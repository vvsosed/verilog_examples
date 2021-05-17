`timescale 1ns/1ps

module Decoder7Seg_tb();
    wire A, B, C, D, E, F, G;
    wire [7:0] out;
    reg [2:0] value;

    Decoder7Seg decoder_1 (
        .fA(A),
        .fB(B),
        .fC(C),
        .fD(D),
        .fE(E),
        .fF(F),
        .fG(G),
        
        .val(value)
    );

    assign out = {A,B,C,D,E,F,G};

    initial begin
        $dumpfile("Decoder7Seg_tb.vcd");
        $dumpvars(0, Decoder7Seg_tb);
        
        $display ("time\tValue\tA\tB\tC\tD\tE\tF\tG");
        $monitor ("%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, value, A, B, C, D, E, F, G);	
        
            value = 3'b000;
        #01 if ( 7'b1111110 != out )
                $display("fail at 000, out=%b", out);
        
        #10 value = 3'b001;
        #01 if ( 7'b0110000 != out )
                $display("fail at 001, out=%b", out);
        
        #10 value = 3'b010;
        #01 if ( 7'b1101101 != out )
                $display("fail at 010, out=%b", out);
        
        #10 value = 3'b011;
        #01 if ( 7'b1111001 != out )
                $display("fail at 011, out=%b", out);
        
        #10 value = 3'b100;
        #01 if ( 7'b0110011 != out )
                $display("fail at 100, out=%b", out);

        #10 value = 3'b101;
        #01 if ( 7'b1011011 != out )
                $display("fail at 101, out=%b", out);

        #10 value = 3'b110;
        #01 if ( 7'b1011111 != out )
                $display("fail at 110, out=%b", out);
        
        #10 value = 3'b111;
        #01 if ( 7'b1110000 != out )
                $display("fail at 111, out=%b", out);
                
        $display("Simulation completed successfully");
        #10 $finish;
    end

endmodule // Decoder7Seg_tb 
