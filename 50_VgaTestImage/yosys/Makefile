clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

#.PHONY: all clean

# VgaHVSyncSignalGen

synth_gen: VgaHVSyncSignalGen_synth.v

VgaHVSyncSignalGen_synth.v: ../VgaHVSyncSignalGen.v synth.ys
	yosys synth.ys

show_gen: VgaHVSyncSignalGen_synth.v
	yosys -p "read_verilog -sv VgaHVSyncSignalGen_synth.v; show VgaHVSyncSignalGen"

sim_gen: VgaHVSyncSignalGen_tb.vcd
	gtkwave VgaHVSyncSignalGen_tb.vcd VgaHVSyncSignalGen_tb.gtkw
	rm ./VgaHVSyncSignalGen_tb.vcd

VgaHVSyncSignalGen_tb.out: ../VgaHVSyncSignalGen.v ../VgaHVSyncSignalGen_tb.v
	iverilog -o VgaHVSyncSignalGen_tb.out ../VgaHVSyncSignalGen.v ../VgaHVSyncSignalGen_tb.v

VgaHVSyncSignalGen_tb.vcd: VgaHVSyncSignalGen_tb.out
	./VgaHVSyncSignalGen_tb.out

# VgaTestImage

sim_img: VgaTestImage_tb.vcd
	gtkwave VgaTestImage_tb.vcd VgaTestImage_tb.gtkw
	rm ./VgaTestImage_tb.vcd

VgaTestImage_tb.out: ../VgaHVSyncSignalGen.v ../VgaTestImage.v ../VgaTestImage_tb.v
	iverilog -o VgaTestImage_tb.out ../VgaHVSyncSignalGen.v ../VgaTestImage.v ../VgaTestImage_tb.v

VgaTestImage_tb.vcd: VgaTestImage_tb.out
	./VgaTestImage_tb.out