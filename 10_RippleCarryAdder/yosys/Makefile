all: sim sint

sim: RippleCarryAdder_tb.vcd

synth: RippleCarryAdder_synth.v

show: RippleCarryAdder_synth.v
	yosys -p "read_verilog -sv RippleCarryAdder_synth.v; show RippleCarryAdder4Bit"

RippleCarryAdder_synth.v: ../RippleCarryAdder.v synth.ys
	yosys synth.ys

RippleCarryAdder_tb.vcd: ../RippleCarryAdder.v ../RippleCarryAdder_tb.v
	iverilog -o RippleCarryAdder_tb.out ../RippleCarryAdder.v ../RippleCarryAdder_tb.v
	./RippleCarryAdder_tb.out
	gtkwave RippleCarryAdder_tb.vcd RippleCarryAdder_tb.gtkw &

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

.PHONY: all clean
