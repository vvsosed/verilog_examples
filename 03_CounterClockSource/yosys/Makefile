all: sim sint

sim: CounterClockSource_tb.vcd

synth: CounterClockSource_synth.v

show: CounterClockSource_synth.v
	yosys -p "read_verilog -sv CounterClockSource_synth.v; show"

CounterClockSource_tb.vcd: CounterClockSource_synth.v ../CounterClockSource_tb.v
	iverilog -o CounterClockSource_tb.out CounterClockSource_synth.v ../CounterClockSource_tb.v
	./CounterClockSource_tb.out
	gtkwave CounterClockSource_tb.vcd CounterClockSource_tb.gtkw &

CounterClockSource_synth.v: ../CounterClockSource.v synth.ys
	yosys synth.ys

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

.PHONY: all clean
