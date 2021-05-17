`timescale 1ns/1ps

module RippleClockSource_tb();

wire clkDiv2, clkDiv4, clkDiv8, clkDiv16;
reg  clk = 0;

RippleClockSource rippleClockSource_1 (
  .clkDiv2(clkDiv2),
  .clkDiv4(clkDiv4),
  .clkDiv8(clkDiv8),
  .clkDiv16(clkDiv16),
  
  .clk(clk)
);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("RippleClockSource_tb.vcd");
        $dumpvars(0, RippleClockSource_tb);
        
        $display ("time\tclk\tclkDiv2\tclkDiv4\tclkDiv8\tclkDiv16");
        $monitor ("%g\t%b\t%b\t%b\t%b\t%b", $time, clk, clkDiv2, clkDiv4, clkDiv8, clkDiv16);	
        
        $display("Simulation completed successfully");
        #1200 $finish;
    end

endmodule // module RippleClockSource_tb
