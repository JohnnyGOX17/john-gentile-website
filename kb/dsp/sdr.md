---
title: Software Defined Radio (SDR)
layout: default
kb: true
top-category: Digital Signal Processing (DSP)
comments: true
wip: false
---

## Waveforms

### Communications

#### Wi-Fi (IEEE 802.11)

* [How a Wifi chip works internally](https://media.ccc.de/v/gpn22-380-how-a-wifi-chip-works-internally)
* [gr-ieee802-11 - IEEE 802.11 a/g/p Transceiver in GNU Radio](https://github.com/bastibl/gr-ieee802-11)
* [open-sdr](https://github.com/open-sdr) manages open-source WiFI baseband stacks that use FPGAs and plug into Linux like [openwifi](https://github.com/open-sdr/openwifi)
* [Nuand/bladeRF-wiphy: bladeRF-wiphy is an open-source IEEE 802.11 compatible software defined radio VHDL modem](https://github.com/Nuand/bladeRF-wiphy)
* [Marsrocky/Awesome-WiFi-CSI-Sensing](https://github.com/Marsrocky/Awesome-WiFi-CSI-Sensing): a list of awesome papers and cool resources on WiFi CSI sensing.


#### Cellular (LTE/3GPP, 4G/5G)

* [srsRAN - Open Source 4G/5G software](https://github.com/srsran)
* [open5G_phy](https://github.com/catkira/open5G_phy): A resource efficient, customizable, synthesizable 5G NR lower PHY written in Verilog
* [free5GRAN](https://github.com/free5G/free5GRAN): free5GRAN is an open-source 5G RAN stack. The current version includes a receiver which decodes MIB & SIB1 data. It also acts as a cell scanner. free5GRAN works in SA mode.
* [SysSec-KAIST/LTESniffer: An Open-source LTE Downlink/Uplink Eavesdropper](https://github.com/SysSec-KAIST/LTESniffer)
* [Private LTE with Analog ADALM-PLUTO](https://www.quantulum.co.uk/blog/private-lte-with-analog-adalm-pluto/)
* [LTE-Cell-Scanner](https://github.com/JiaoXianjun/LTE-Cell-Scanner): OpenCL, SDR, TDD/FDD LTE cell scanner, full stack from A/D samples to SIB ASN1 messages decoded in PDSCH, (optimized for RTL-SDR HACKRF and BladeRF board)
* [Evrytania/Matlab-Library](https://github.com/Evrytania/Matlab-Library): Miscellaneous Matlab functions that are useful for wireless communications. Primarily focused on LTE / 3GPP.


#### DVB-S2

* [igorauad/gr-dvbs2rx: DVB-S2 receiver blocks for GNU Radio](https://github.com/igorauad/gr-dvbs2rx)
* [csdvb/dvbs2_tx: Nexø DVB-S2 transmitter application](https://github.com/csdvb/dvbs2_tx)
* [mattzgto/bladerf-dvbs2: 16-APSK DVB-S2 Transmitter for BladeRF](https://github.com/mattzgto/bladerf-dvbs2)
* [OpenResearchInstitute/dvb_fpga: RTL implementation of components for DVB-S2](https://github.com/OpenResearchInstitute/dvb_fpga)
* [freecores/dvb_s2_ldpc_decoder: DVB-S2 LDPC Decoder](https://github.com/freecores/dvb_s2_ldpc_decoder)
* [phase4ground/dvb_fpga: RTL implementation of components for DVB-S2](https://github.com/phase4ground/dvb_fpga)
* [CCSDS Protocols over DVB-S2—Summary of Definition, Implementation, and Performance](https://public.ccsds.org/Pubs/130x12g1.pdf)
* [aff3ct/dvbs2: DVB-S2 SDR Transceiver.](https://github.com/aff3ct/dvbs2)
* [A Flexible and Portable Real-time DVB-S2 Transceiver using Multicore and SIMD CPUs](https://hal.science/hal-03336450/file/article.pdf)

#### Bluetooth

* [DEF CON 30 RF Village - Mike Ryan - Building a Modern Bluetooth Sniffer for SDRs - YouTube](https://www.youtube.com/watch?v=lpM9rnMfy2w)
* [JiaoXianjun/BTLE](https://github.com/JiaoXianjun/BTLE): Bluetooth Low Energy (BLE) packet sniffer and transmitter for both standard and non standard (raw bit) based on Software Defined Radio (SDR).
* [OpenHaystack](https://github.com/seemoo-lab/openhaystack): track personal Bluetooth devices via Apple's Find My network.
* [GitHub - newhouseb/onebitbt](https://github.com/newhouseb/onebitbt): A Bluetooth Low Energy Radio using FPGA SERDES: No ADC, AGC, filters, mixers, or amplifiers required.


#### LoRaWAN

* [tapparelj/gr-lora_sdr](https://github.com/tapparelj/gr-lora_sdr): fully-functional GNU Radio software-defined radio (SDR) implementation of a LoRa transceiver with all the necessary receiver components to operate correctly even at very low SNRs.
* [Meshtastic](https://meshtastic.org/): open source mesh network software running on low-power, affordable devices.
  + [Meshtastic SDR](https://gitlab.com/crankylinuxuser/meshtastic_sdr): This GnuRadio project aims at being a full transceiver stack (RX and TX) for a software defined radio to communicate with the Meshtastic LoRa network.
* [LoRaWAN On Helium Network](https://docs.helium.com/iot/lorawan-on-helium/)

#### ZigBee

* [gr-ieee802-15-4 ZigBee Transceiver GNU Radio block](https://github.com/bastibl/gr-ieee802-15-4)

#### Orthogonal Time Frequency Space (OTFS) Modulation

* [OTFS Modulation- Mathworks](https://www.mathworks.com/help/comm/ug/otfs-modulation.html)
* [OTFS − A Mathematical Foundation for Communication and Radar Sensing in the Delay-Doppler Domain](https://ece.iisc.ac.in/~achockal/pdf_files/zak_otfs1.pdf)

### Datasources & Recordings

* [IQEngine](https://iqengine.org/)
* [SDR Angel I/Q Files](https://www.sdrangel.org/iq-files/)


## Software Defined Radio (SDR)

### SDR Software/Frameworks

#### GNU Radio

[GNU Radio](https://www.gnuradio.org/) is an open-source SDR framework for prototyping communications systems.

* [Comprehensive GNU Radio Archive Network (CGRAN)](https://www.cgran.org/): list of GNU Radio blocks and repos.
* [gnuradio/volk: The Vector Optimized Library of Kernels](https://github.com/gnuradio/volk)
[Tutorials - GNU Radio](https://wiki.gnuradio.org/index.php/Tutorials)
        [SuggestedReading - GNU Radio](https://wiki.gnuradio.org/index.php/SuggestedReading)

#### Other SDR Frameworks

* [LiquidSDR](https://liquidsdr.org/): home to _liquid-dsp_, a free and open-source signal processing library for software-defined radios written in C. Its purpose is to provide a set of extensible DSP modules that do not rely on external dependencies or cumbersome frameworks. The project is now hosted on [github](https://github.com/jgaeddert/liquid-dsp).
* [SoapySDR](https://github.com/pothosware/SoapySDR): vendor and platform neutral SDR library.
* [FutureSDR](https://www.futuresdr.org/): experimental asynchronous SDR runtime for heterogeneous architectures.
* [Sionna - NVIDIA Labs](https://nvlabs.github.io/sionna/index.html#): Sionna is a hardware-accelerated differentiable open-source library for research on communication systems.

#### SDR Frontends

* [sdrangel](https://github.com/f4exb/sdrangel)

### SDR Hardware

#### RTL-SDR

RTL-SDRs are cheap and omnipresent, RX-only SDRs.

- **[RTL-SDR Quick Start Guide](https://www.rtl-sdr.com/rtl-sdr-quick-start-guide/):** general guides to RTL-SDR features and dipole antenna usage.
- **[RTL-SDR for Linux Quick Start Guide](https://ranous.wordpress.com/rtl-sdr4linux/):** installation instructions for necessary drivers and libraries to get up and running.
- [osmocom rtl-sdr wiki](https://osmocom.org/projects/rtl-sdr/wiki)

#### Ettus Research SDRs

[Ettus](https://www.ettus.com/) has been a long time maker of high-quality SDR HW. They also open-source nearly all schematics, software, and [FPGA firmware/HDL](https://github.com/EttusResearch/fpga). They also maintain the [USRP Hardware Driver (UHD)](https://github.com/EttusResearch/uhd/), an open-source driver library across their devices, and well supported by other open-source frameworks, like GNU Radio.

#### Other SDR Hardware

* [A comprehensive list of SDR hardware supported by GNU Radio](https://wiki.gnuradio.org/index.php/Hardware).
* [LimeSDR Mini 2.0](https://www.crowdsupply.com/lime-micro/limesdr-mini-2): open-source, small form factor USB 3.0 SDR, utilizing the [Lime LMS7002M RF ASIC](https://limemicro.com/technology/lms7002m/).
  + There's also the original, slightly larger [LimeSDR](https://limemicro.com/products/boards/limesdr/)
  + [LimeRFE RF Front End](https://www.crowdsupply.com/lime-micro/limerfe)
* [AntSDR E200](https://www.crowdsupply.com/microphase-technology/antsdr-e200) small form factor with AD936x front end, similar to PlutoSDR and compatible with both UHD and ADI IIO driver stacks.
* [ADI CN0417 2.4GHz small amplifier eval board](https://wiki.analog.com/resources/eval/user-guides/circuits-from-the-lab/cn0417)
* [greatscottgadgets/hackrf: low cost software radio platform](https://github.com/greatscottgadgets/hackrf)
* [YARD Stick One - Great Scott Gadgets](https://www.greatscottgadgets.com/yardstickone/): half-duplex sub-1GHz SDR.
* [rpitx - RF transmitter for Raspberry Pi](https://github.com/F5OEO/rpitx)
* [osmo-fl2k VGA adapter transmitter](https://osmocom.org/projects/osmo-fl2k/wiki)
* [RFNM](https://rfnm.io/)


## References

- [ ] [Learn SDR with Prof Jason - YouTube Playlist](https://www.youtube.com/playlist?list=PLywxmTaHNUNyKmgF70q8q3QHYIw_LFbrX)
- [ ] [veeresht/CommPy](https://github.com/veeresht/CommPy)
- [Wireless Pi](https://wirelesspi.com/)
- MathWorks [Communications](https://www.mathworks.com/help/comm/index.html?s_tid=CRUX_lftnav), [SATCOM](https://www.mathworks.com/help/satcom/index.html?s_tid=CRUX_lftnav) and [Wireless HDL](https://www.mathworks.com/help/wireless-hdl/index.html?s_tid=CRUX_lftnav) Toolboxes

