sim_dec: DecoderBinTo7SegHex_tb.vcd
	gtkwave DecoderBinTo7SegHex_tb.vcd DecoderBinTo7SegHex_tb.gtkw

synth_dec: DecoderBinTo7SegHex_synth.v

show_synth_dec: DecoderBinTo7SegHex_synth.v
	yosys -p "read_verilog -sv DecoderBinTo7SegHex_synth.v; show"

show_dec: ../DecoderBinTo7SegHex.v
	yosys -p "read_verilog -sv ../DecoderBinTo7SegHex.v; show"

DecoderBinTo7SegHex_synth.v: ../DecoderBinTo7SegHex.v synth.ys
	yosys synth.ys

DecoderBinTo7SegHex_tb.vcd: ../DecoderBinTo7SegHex.v ../DecoderBinTo7SegHex_tb.v
	iverilog -o DecoderBinTo7SegHex_tb.out ../DecoderBinTo7SegHex.v ../DecoderBinTo7SegHex_tb.v
	./DecoderBinTo7SegHex_tb.out

clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~ *_synth.v

//.PHONY: all clean
