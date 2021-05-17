all: sim sint

sim: SimpleCounter_tb.vcd

synth: SimpleCounter_synth.v

show: SimpleCounter_synth.v
	yosys -p "read_verilog -sv SimpleCounter_synth.v; show"

SimpleCounter_tb.vcd: SimpleCounter_synth.v ../SimpleCounter_tb.v
	iverilog -o SimpleCounter_tb.out SimpleCounter_synth.v ../SimpleCounter_tb.v
	./SimpleCounter_tb.out
	gtkwave SimpleCounter_tb.vcd SimpleCounter_tb.gtkw &

SimpleCounter_synth.v: ../SimpleCounter.v synth.ys
	yosys synth.ys

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

.PHONY: all clean
