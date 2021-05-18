all: sim sint

sim: VgaHVSyncSignalGen_tb.vcd

synth: VgaHVSyncSignalGen_synth.v

show: VgaHVSyncSignalGen_synth.v
	yosys -p "read_verilog -sv VgaHVSyncSignalGen_synth.v; show VgaHVSyncSignalGen"

VgaHVSyncSignalGen_synth.v: ../VgaHVSyncSignalGen.v synth.ys
	yosys synth.ys

VgaHVSyncSignalGen_tb.vcd: ../VgaHVSyncSignalGen.v ../VgaHVSyncSignalGen_tb.v
	iverilog -o VgaHVSyncSignalGen_tb.out ../VgaHVSyncSignalGen.v ../VgaHVSyncSignalGen_tb.v
	./VgaHVSyncSignalGen_tb.out
	gtkwave VgaHVSyncSignalGen_tb.vcd VgaHVSyncSignalGen_tb.gtkw &

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

.PHONY: all clean
