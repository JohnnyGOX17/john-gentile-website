// =============================================================================
// Numerically Controlled Oscillator (NCO)
// =============================================================================
//
// Architecture:
//   Phase Accumulator (N bits) → Truncated Phase (L bits) → Quarter-Wave LUT → Output
//
//   f_out = (FCW * f_clk) / 2^N
//   Phase resolution:  2π / 2^N
//   Spurious floor:    ~-6.02 * L dBc (truncation spurs before dithering)
//
// Quarter-wave symmetry exploits sin() symmetry to store only [0, π/2),
// reducing LUT depth from 2^L to 2^(L-2) entries.
//
// Parameters:
//   PHASE_ACC_W  – Phase accumulator width N (frequency resolution)
//   LUT_ADDR_W   – Truncated phase / LUT address width L (spur performance)
//   OUTPUT_W     – Output sample width (SNR ≈ 6.02*OUTPUT_W dB)
//   DITHER_EN    – Add 1-bit LFSR dither to truncated phase to whiten spurs
// =============================================================================

module nco #(
    parameter int PHASE_ACC_W = 32,
    parameter int LUT_ADDR_W  = 12,
    parameter int OUTPUT_W    = 16,
    parameter bit DITHER_EN   = 1'b1
) (
    input  logic                    clk,
    input  logic                    rst_n,

    // Control
    input  logic [PHASE_ACC_W-1:0]  fcw,          // Frequency control word
    input  logic [PHASE_ACC_W-1:0]  phase_offset, // Phase modulation input

    // Output — signed two's complement
    output logic signed [OUTPUT_W-1:0] sin_out,
    output logic signed [OUTPUT_W-1:0] cos_out,
    output logic                       valid
);

    // -------------------------------------------------------------------------
    // Derived parameters
    // -------------------------------------------------------------------------
    localparam int QUARTER_DEPTH = 2 ** (LUT_ADDR_W - 2); // π/2 worth of entries
    localparam int DISCARD_BITS  = PHASE_ACC_W - LUT_ADDR_W;

    // -------------------------------------------------------------------------
    // Phase accumulator
    // -------------------------------------------------------------------------
    logic [PHASE_ACC_W-1:0] phase_acc;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            phase_acc <= '0;
        else
            phase_acc <= phase_acc + fcw; // free-running, wraps modulo 2^N
    end

    // -------------------------------------------------------------------------
    // Optional truncation dither (LFSR-based)
    //   Adds pseudorandom noise into discarded LSBs to whiten truncation spurs.
    //   Galois LFSR, maximal-length for 16-bit: x^16 + x^14 + x^13 + x^11 + 1
    // -------------------------------------------------------------------------
    logic [15:0] lfsr;

    generate
        if (DITHER_EN) begin : gen_dither
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n)
                    lfsr <= 16'hACE1; // nonzero seed
                else
                    lfsr <= {lfsr[14:0], lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10]};
            end
        end else begin : gen_no_dither
            assign lfsr = '0;
        end
    endgenerate

    // -------------------------------------------------------------------------
    // Phase truncation + offset + dither → LUT address
    // -------------------------------------------------------------------------
    logic [PHASE_ACC_W-1:0] phase_total;
    logic [LUT_ADDR_W-1:0]  phase_trunc;

    assign phase_total = phase_acc + phase_offset;

    // Add dither into the rounding region then truncate
    always_comb begin
        if (DITHER_EN && DISCARD_BITS > 0) begin
            automatic logic [PHASE_ACC_W-1:0] dithered;
            dithered    = phase_total + {{LUT_ADDR_W{1'b0}}, lfsr[DISCARD_BITS-1:0]};
            phase_trunc = dithered[PHASE_ACC_W-1 -: LUT_ADDR_W];
        end else begin
            phase_trunc = phase_total[PHASE_ACC_W-1 -: LUT_ADDR_W];
        end
    end

    // -------------------------------------------------------------------------
    // Quarter-wave LUT with symmetry decomposition
    //
    //   quadrant[1:0] = phase_trunc MSBs
    //   Q0 (00): sin(θ)        =  LUT[ addr          ]
    //   Q1 (01): sin(π-θ)      =  LUT[ ~addr         ]   (mirror)
    //   Q2 (10): sin(π+θ)      = -LUT[ addr          ]   (negate)
    //   Q3 (11): sin(2π-θ)     = -LUT[ ~addr         ]   (mirror+negate)
    //
    //   cos(θ) = sin(θ + π/2), so feed (phase_trunc + 2^(L-2)) into same logic.
    // -------------------------------------------------------------------------
    logic [1:0]               sin_quad, cos_quad;
    logic [LUT_ADDR_W-3:0]    sin_addr, cos_addr;
    logic                     sin_neg,  cos_neg;
    logic                     sin_mirror, cos_mirror;

    // Cosine phase = sin phase + π/2 (add 1 to quadrant)
    logic [LUT_ADDR_W-1:0] cos_phase;
    assign cos_phase = phase_trunc + LUT_ADDR_W'(QUARTER_DEPTH); // +2^(L-2)

    assign sin_quad   = phase_trunc[LUT_ADDR_W-1 -: 2];
    assign cos_quad   = cos_phase  [LUT_ADDR_W-1 -: 2];

    assign sin_mirror = sin_quad[0];
    assign cos_mirror = cos_quad[0];
    assign sin_neg    = sin_quad[1];
    assign cos_neg    = cos_quad[1];

    assign sin_addr = sin_mirror ? ~phase_trunc[LUT_ADDR_W-3:0]
                                 :  phase_trunc[LUT_ADDR_W-3:0];
    assign cos_addr = cos_mirror ? ~cos_phase[LUT_ADDR_W-3:0]
                                 :  cos_phase[LUT_ADDR_W-3:0];

    // -------------------------------------------------------------------------
    // LUT storage — inferred as block RAM (single-port, registered output)
    // Stores unsigned magnitude: round(2^(OUTPUT_W-1) - 1) * sin(2π·k / 4·DEPTH)
    // for k in [0, QUARTER_DEPTH).
    // -------------------------------------------------------------------------
    logic [OUTPUT_W-2:0] sin_lut [QUARTER_DEPTH]; // unsigned magnitude
    logic [OUTPUT_W-2:0] cos_lut [QUARTER_DEPTH];

    initial begin
        for (int k = 0; k < QUARTER_DEPTH; k++) begin
            sin_lut[k] = OUTPUT_W'($rtoi(
                $floor(((2.0 ** (OUTPUT_W - 1)) - 1.0)
                       * $sin(2.0 * 3.14159265358979323846 * real'(k) / real'(4 * QUARTER_DEPTH))
                       + 0.5)
            ));
            cos_lut[k] = sin_lut[k]; // same data, separate copy for dual-port inference
        end
    end

    // -------------------------------------------------------------------------
    // Pipeline stage 1: LUT read (registered for BRAM inference)
    // -------------------------------------------------------------------------
    logic [OUTPUT_W-2:0] sin_mag_r, cos_mag_r;
    logic                sin_neg_r, cos_neg_r;

    always_ff @(posedge clk) begin
        sin_mag_r <= sin_lut[sin_addr];
        cos_mag_r <= cos_lut[cos_addr];
        sin_neg_r <= sin_neg;
        cos_neg_r <= cos_neg;
    end

    // -------------------------------------------------------------------------
    // Pipeline stage 2: sign application → two's complement output
    // -------------------------------------------------------------------------
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sin_out <= '0;
            cos_out <= '0;
        end else begin
            sin_out <= sin_neg_r ? -signed'({1'b0, sin_mag_r})
                                 :  signed'({1'b0, sin_mag_r});
            cos_out <= cos_neg_r ? -signed'({1'b0, cos_mag_r})
                                 :  signed'({1'b0, cos_mag_r});
        end
    end

    // -------------------------------------------------------------------------
    // Valid strobe — accounts for 2-cycle pipeline latency
    // -------------------------------------------------------------------------
    logic [1:0] pipe_valid;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pipe_valid <= '0;
        else
            pipe_valid <= {pipe_valid[0], 1'b1};
    end

    assign valid = pipe_valid[1];

    // -------------------------------------------------------------------------
    // Assertions (simulation only)
    // -------------------------------------------------------------------------
    // synthesis translate_off
    initial begin
        assert (LUT_ADDR_W >= 4)
            else $fatal(1, "LUT_ADDR_W must be >= 4 for quarter-wave decomposition");
        assert (PHASE_ACC_W >= LUT_ADDR_W)
            else $fatal(1, "PHASE_ACC_W must be >= LUT_ADDR_W");
        assert (OUTPUT_W >= 2)
            else $fatal(1, "OUTPUT_W must be >= 2 for signed representation");
    end
    // synthesis translate_on

endmodule
