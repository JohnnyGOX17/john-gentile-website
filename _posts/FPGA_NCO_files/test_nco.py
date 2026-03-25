"""
cocotb testbench for NCO – captures output samples, plots the spectrum, and measures SFDR.

Run with:
    make -f Makefile.cocotb

Requires: cocotb, cocotb-test, numpy, matplotlib
Simulator: Icarus Verilog (iverilog) or Verilator with cocotb support
"""

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
import numpy as np
import matplotlib.pyplot as plt


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def signed_val(signal, width):
    """Convert an unsigned cocotb signal value to signed Python int."""
    val = signal.value.integer
    if val >= (1 << (width - 1)):
        val -= 1 << width
    return val


async def reset_dut(dut, cycles=4):
    """Assert reset for *cycles* clock edges, then release."""
    dut.rst_n.value = 0
    dut.fcw.value = 0
    dut.phase_offset.value = 0
    await ClockCycles(dut.clk, cycles)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)  # wait for pipeline to fill


# ---------------------------------------------------------------------------
# Parameters (must match the cocotb runner / Makefile generics)
# ---------------------------------------------------------------------------
PHASE_ACC_W = 16
LUT_ADDR_W = 8
OUTPUT_W = 12


# ---------------------------------------------------------------------------
# Test: Capture tone, plot spectrum, measure SFDR
# ---------------------------------------------------------------------------


@cocotb.test()
async def test_nco_spectrum(dut):
    """Run the NCO at a known tone, capture samples, compute FFT, and report SFDR."""

    clock = Clock(dut.clk, 10, units="ns")  # 100 MHz
    cocotb.start_soon(clock.start())

    await reset_dut(dut)

    # --- Choose FCW for a bin-centered tone ---
    # N_samples must be a power of 2 for a clean FFT.
    N = 4096
    # Pick a tone that lands exactly on an FFT bin to avoid spectral leakage:
    #   bin_index * 2^PHASE_ACC_W / N  =  FCW
    bin_index = 107  # prime-ish, away from DC and Nyquist
    fcw_val = int(bin_index * (2**PHASE_ACC_W) / N)
    dut.fcw.value = fcw_val

    f_clk = 100e6
    f_tone = fcw_val * f_clk / 2**PHASE_ACC_W
    dut._log.info(
        f"FCW = {fcw_val}  →  f_tone = {f_tone / 1e6:.4f} MHz  (bin {bin_index})"
    )

    # Let the pipeline settle after changing FCW
    await ClockCycles(dut.clk, 4)

    # --- Collect samples ---
    sin_samples = np.zeros(N, dtype=np.float64)
    cos_samples = np.zeros(N, dtype=np.float64)

    for i in range(N):
        await RisingEdge(dut.clk)
        sin_samples[i] = signed_val(dut.sin_out, OUTPUT_W)
        cos_samples[i] = signed_val(dut.cos_out, OUTPUT_W)

    # --- Compute power spectrum (dBFS) ---
    window = np.blackman(N)
    sin_windowed = sin_samples * window

    spectrum = np.fft.rfft(sin_windowed)
    mag = np.abs(spectrum) / (np.sum(window) / 2)  # normalize
    mag_db = 20 * np.log10(mag + 1e-20)  # dBFS (relative to full-scale sine)

    # Normalize so the fundamental is 0 dBFS
    fund_bin = np.argmax(mag_db)
    mag_db -= mag_db[fund_bin]

    freqs_mhz = np.fft.rfftfreq(N, d=1.0 / f_clk) / 1e6

    # --- Measure SFDR ---
    # Exclude DC (bin 0) and a ±3-bin window around the fundamental
    spur_mask = np.ones(len(mag_db), dtype=bool)
    spur_mask[0] = False  # ignore DC
    guard = 3
    lo = max(1, fund_bin - guard)
    hi = min(len(mag_db) - 1, fund_bin + guard)
    spur_mask[lo : hi + 1] = False

    spur_peak_bin = np.argmax(mag_db[spur_mask])
    # Map back to absolute bin index
    spur_abs_bin = np.arange(len(mag_db))[spur_mask][spur_peak_bin]
    sfdr = mag_db[fund_bin] - mag_db[spur_abs_bin]

    dut._log.info(f"Fundamental bin: {fund_bin}  ({freqs_mhz[fund_bin]:.3f} MHz)")
    dut._log.info(
        f"Largest spur bin: {spur_abs_bin}  ({freqs_mhz[spur_abs_bin]:.3f} MHz)"
    )
    dut._log.info(f"SFDR = {sfdr:.1f} dBc")

    # --- Plot ---
    fig, axes = plt.subplots(2, 1, figsize=(10, 7), constrained_layout=True)

    # Time-domain (first 128 samples)
    t_us = np.arange(128) * (1 / f_clk) * 1e6
    axes[0].plot(t_us, sin_samples[:128], label="sin", linewidth=0.8)
    axes[0].plot(t_us, cos_samples[:128], label="cos", linewidth=0.8, alpha=0.7)
    axes[0].set_xlabel("Time (µs)")
    axes[0].set_ylabel("Amplitude (LSB)")
    axes[0].set_title("NCO Time-Domain Output (first 128 samples)")
    axes[0].legend()
    axes[0].grid(True, alpha=0.3)

    # Spectrum
    axes[1].plot(freqs_mhz, mag_db, linewidth=0.6)
    axes[1].axhline(
        -sfdr, color="r", linestyle="--", linewidth=0.8, label=f"SFDR = {sfdr:.1f} dBc"
    )
    axes[1].set_xlabel("Frequency (MHz)")
    axes[1].set_ylabel("Magnitude (dBc)")
    axes[1].set_title(
        f"NCO Output Spectrum  |  f_tone = {f_tone / 1e6:.4f} MHz  |  SFDR = {sfdr:.1f} dBc"
    )
    axes[1].set_ylim([-120, 5])
    axes[1].legend()
    axes[1].grid(True, alpha=0.3)

    fig.savefig("nco_spectrum.png", dpi=150)
    dut._log.info("Saved plot to nco_spectrum.png")
    plt.close(fig)

    # --- Pass/fail ---
    # With 8-bit LUT address (quarter-wave), theoretical spur floor ~ -6*8 = -48 dBc.
    # Require at least 40 dBc as a sanity check.
    MIN_SFDR = 40.0
    assert sfdr >= MIN_SFDR, f"SFDR {sfdr:.1f} dBc below threshold {MIN_SFDR} dBc"
    dut._log.info("PASS")
