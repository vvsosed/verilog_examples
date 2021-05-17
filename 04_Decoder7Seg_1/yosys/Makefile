all: sim sint

sim: Decoder7Seg_tb.vcd

synth: Decoder7Seg_synth.v

show: Decoder7Seg_synth.v
	yosys -p "read_verilog -sv Decoder7Seg_synth.v; show"

Decoder7Seg_synth.v: ../Decoder7Seg.v synth.ys
	yosys synth.ys

Decoder7Seg_tb.vcd: Decoder7Seg_synth.v ../Decoder7Seg_tb.v
	iverilog -o Decoder7Seg_tb.out Decoder7Seg_synth.v ../Decoder7Seg_tb.v
	./Decoder7Seg_tb.out
	gtkwave Decoder7Seg_tb.vcd Decoder7Seg_tb.gtkw &

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

.PHONY: all clean
