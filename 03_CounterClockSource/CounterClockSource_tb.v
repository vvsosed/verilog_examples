`timescale 1ns/1ps

module CounterClockSource_tb();
    wire clkDiv2, clkDiv4, clkDiv8, clkDiv16;
    wire [3:0] cntVal;
    reg  clk = 0;

    CounterClockSource clockSrc_1 (
        .clkDiv2(clkDiv2),
        .clkDiv4(clkDiv4),
        .clkDiv8(clkDiv8),
        .clkDiv16(clkDiv16),
        
        .cntr(cntVal),

        .clk(clk)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("CounterClockSource_tb.vcd");
        $dumpvars(0, CounterClockSource_tb);
        
        $display ("time\tclk\tcntVal\tclkDiv2\tclkDiv4\tclkDiv8\tclkDiv16");
        $monitor ("%g\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, cntVal, clkDiv2, clkDiv4, clkDiv8, clkDiv16);	
        
        $display("Simulation completed successfully");
        #1200 $finish;
    end

endmodule // CounterClockSource_tb 
