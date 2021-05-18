`timescale 1ns/1ps

module RippleCarryAdder_tb();
    reg [3:0] val1, val2;
    reg carryIn;

    wire [3:0] sumOut; 
    wire carryOut;

    RippleCarryAdder4Bit rcAdder_1 (
        .sumOut(sumOut),
        .carryOut(carryOut),

        .xIn(val1), 
        .yIn(val2),
        .carryIn(carryIn)
    );

    initial begin
        $dumpfile("RippleCarryAdder_tb.vcd");
        $dumpvars(0, RippleCarryAdder_tb);
        
        $display ("time\txIn\tyIn\tcarryIn\tsumOut\tcarryOut");
        $monitor ("%g\t%b\t%b\t%b\t%b\t%b", $time, val1, val2, carryIn, sumOut, carryOut);	
        
        #10 carryIn = 0; val1 = 4'b0010;    val2 = 4'b0001;
        #50              val1 = 4'b0001; #1 val2 = 4'b0011;
        #50 carryIn = 1;
        #50              val1 = 4'b1110; #1 val2 = 4'b0001;
        #50 carryIn = 0;
                
        #50 $display("Simulation completed successfully");
        #50 $finish;
    end // initial procedure block
endmodule // RippleCarryAdder_tb 
