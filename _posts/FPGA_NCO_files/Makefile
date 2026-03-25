# NCO Verilator testbench
# Usage:
#   make        — build and run the testbench
#   make wave   — open waveform in GTKWave (if installed)
#   make clean  — remove generated files

TOP      := nco_tb
SOURCES  := nco.sv nco_tb.sv
OBJ_DIR  := obj_dir

.PHONY: all run wave clean

all: run

# Verilator compile: SystemVerilog, enable timing, trace (VCD)
$(OBJ_DIR)/V$(TOP): $(SOURCES)
	verilator --binary --timing -j 0 --trace \
		-Wno-WIDTHEXPAND -Wno-WIDTHTRUNC -Wno-INITIALDLY -Wno-IMPLICITSTATIC \
		--top-module $(TOP) $(SOURCES)

run: $(OBJ_DIR)/V$(TOP)
	./$(OBJ_DIR)/V$(TOP)

wave: run
	gtkwave $(TOP).vcd &

clean:
	rm -rf $(OBJ_DIR) $(TOP).vcd
