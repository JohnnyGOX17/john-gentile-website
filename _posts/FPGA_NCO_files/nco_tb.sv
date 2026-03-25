// =============================================================================
// NCO Testbench
// =============================================================================
// Basic verification:
//   1. Reset behavior — outputs zero, valid deasserted
//   2. Valid strobe asserts after 2-cycle pipeline latency
//   3. DC check — FCW=0 produces constant output
//   4. Sine/cosine quadrature — cos leads sin by ~90°
//   5. Output bounded within signed range
// =============================================================================

module nco_tb;

    // Use small parameters for fast simulation
    localparam int PHASE_ACC_W = 16;
    localparam int LUT_ADDR_W  = 8;
    localparam int OUTPUT_W    = 12;

    logic                          clk;
    logic                          rst_n;
    logic [PHASE_ACC_W-1:0]       fcw;
    logic [PHASE_ACC_W-1:0]       phase_offset;
    logic signed [OUTPUT_W-1:0]   sin_out;
    logic signed [OUTPUT_W-1:0]   cos_out;
    logic                          valid;

    nco #(
        .PHASE_ACC_W (PHASE_ACC_W),
        .LUT_ADDR_W  (LUT_ADDR_W),
        .OUTPUT_W    (OUTPUT_W),
        .DITHER_EN   (1'b0)         // disable dither for deterministic checks
    ) dut (
        .clk          (clk),
        .rst_n        (rst_n),
        .fcw          (fcw),
        .phase_offset (phase_offset),
        .sin_out      (sin_out),
        .cos_out      (cos_out),
        .valid        (valid)
    );

    // Clock: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Max positive value the LUT can produce
    localparam int MAX_MAG = (2 ** (OUTPUT_W - 1)) - 1;

    int errors = 0;

    // Helper: run N clock cycles
    task automatic tick(int n = 1);
        repeat (n) @(posedge clk);
    endtask

    // -------------------------------------------------------------------------
    // Main test sequence
    // -------------------------------------------------------------------------
    initial begin
        $dumpfile("nco_tb.vcd");
        $dumpvars(0, nco_tb);

        // ---- Init ----
        rst_n        = 0;
        fcw          = '0;
        phase_offset = '0;
        tick(4);

        // ---- Test 1: Reset behaviour ----
        $display("[TEST 1] Reset behavior");
        if (sin_out !== '0 || cos_out !== '0) begin
            $display("  FAIL: outputs not zero in reset (sin=%0d cos=%0d)", sin_out, cos_out);
            errors++;
        end
        if (valid !== 1'b0) begin
            $display("  FAIL: valid asserted during reset");
            errors++;
        end

        // ---- Release reset ----
        @(posedge clk) rst_n <= 1;

        // ---- Test 2: Valid strobe latency ----
        $display("[TEST 2] Valid strobe latency");
        tick(1);
        if (valid !== 1'b0) begin
            $display("  FAIL: valid high too early (cycle 1)");
            errors++;
        end
        tick(1);  // 2 cycles after reset release
        if (valid !== 1'b1) begin
            $display("  FAIL: valid not asserted after 2 pipeline stages");
            errors++;
        end

        // ---- Test 3: FCW=0 → constant output ----
        $display("[TEST 3] FCW=0 constant output");
        fcw = '0;
        tick(10);
        begin
            logic signed [OUTPUT_W-1:0] s0, c0, s1, c1;
            s0 = sin_out; c0 = cos_out;
            tick(5);
            s1 = sin_out; c1 = cos_out;
            if (s0 !== s1 || c0 !== c1) begin
                $display("  FAIL: output changed with FCW=0");
                errors++;
            end
        end

        // ---- Test 4: Run a tone — check outputs stay bounded ----
        // FCW = 2^(N-4) gives f_out = f_clk/16 — completes one full cycle in 16 samples
        $display("[TEST 4] Bounded output with active tone");
        fcw = 16'(1 << (PHASE_ACC_W - 4));
        tick(4); // flush pipeline
        begin
            int bounded_ok = 1;
            for (int i = 0; i < 64; i++) begin
                tick(1);
                if (sin_out > MAX_MAG || sin_out < -MAX_MAG ||
                    cos_out > MAX_MAG || cos_out < -MAX_MAG) begin
                    $display("  FAIL: output out of range at sample %0d (sin=%0d cos=%0d)",
                             i, sin_out, cos_out);
                    bounded_ok = 0;
                    errors++;
                end
            end
            if (bounded_ok) $display("  PASS: all samples within [-%0d, %0d]", MAX_MAG, MAX_MAG);
        end

        // ---- Test 5: Quadrature relationship ----
        // With a slow tone, sample near zero-crossing of sin where cos should be near peak
        $display("[TEST 5] Quadrature check (cos leads sin by ~90 deg)");
        fcw = 16'(1 << (PHASE_ACC_W - 4)); // same tone
        rst_n = 0;
        tick(4);
        @(posedge clk) rst_n <= 1;
        tick(3); // pipeline flush — phase_acc ≈ 0 at this point
        // Near phase=0: sin≈0, cos≈+peak
        begin
            if (!(cos_out > sin_out)) begin
                $display("  FAIL: at phase~0 expected cos > sin (sin=%0d cos=%0d)", sin_out, cos_out);
                errors++;
            end else begin
                $display("  PASS: cos > sin near phase 0 (sin=%0d cos=%0d)", sin_out, cos_out);
            end
        end

        // ---- Summary ----
        tick(2);
        if (errors == 0)
            $display("\n=== ALL TESTS PASSED ===");
        else
            $display("\n=== %0d ERROR(S) ===", errors);

        $finish;
    end

endmodule
