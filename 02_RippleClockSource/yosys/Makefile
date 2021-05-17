all: sim sint

sim: RippleClockSource_tb.vcd

synth: RippleClockSource_synth.v

show: RippleClockSource_synth.v
	yosys -p "read_verilog -sv RippleClockSource_synth.v; show"

RippleClockSource_tb.vcd: RippleClockSource_synth.v ../RippleClockSource_tb.v
	iverilog -o RippleClockSource_tb.out RippleClockSource_synth.v ../RippleClockSource_tb.v
	./RippleClockSource_tb.out
	gtkwave RippleClockSource_tb.vcd RippleClockSource_tb.gtkw &

RippleClockSource_synth.v: ../RippleClockSource.v synth.ys
	yosys synth.ys

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

.PHONY: all clean
