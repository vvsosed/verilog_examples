`timescale 1ns/1ps

module DecoderBinTo7SegHex_tb();
    wire [7:0] fullOut;
    wire [6:0] segOut;
    wire dpOut, A, B, C, D, E, F, G;
    assign { dPOut, segOut } = fullOut;
    assign { A, B, C, D, E, F, G } = segOut;

    reg [3:0] valIn;
    reg       dPIn;

    DecoderBinTo7SegHex decoder_1 (
        .fullOut( fullOut ),
        .valIn( valIn ),
        .dpIn( dPIn )
    );

    initial begin
        $dumpfile( "DecoderBinTo7SegHex_tb.vcd" );
        $dumpvars( 0, DecoderBinTo7SegHex_tb );
        
        $display ( "time\tValue\tA\tB\tC\tD\tE\tF\tG" );
        $monitor ( "%g\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, valIn, A, B, C, D, E, F, G );	
        
            dPIn = 0; valIn = 1'h0;
        #01 if ( 7'b1111110 != segOut )
                $display( "fail at 0, segOut=%b", segOut );
        
        #10 valIn = 4'h1;
        #01 if ( 7'b0110000 != segOut )
                $display( "fail at 1, segOut=%b", segOut );
        
        #10 valIn = 4'h2;
        #01 if ( 7'b1101101 != segOut )
                $display( "fail at 2, segOut=%b", segOut );
        
        #10 valIn = 4'h3;
        #01 if ( 7'b1111001 != segOut )
                $display( "fail at 3, segOut=%b", segOut );
        
        #10 valIn = 4'h4;
        #01 if ( 7'b0110011 != segOut )
                $display( "fail at 4, segOut=%b", segOut );

        #10 valIn = 4'h5;
        #01 if ( 7'b1011011 != segOut )
                $display( "fail at 5, segOut=%b", segOut );

        #10 valIn = 4'h6;
        #01 if ( 7'b1011111 != segOut )
                $display( "fail at 6, segOut=%b", segOut );
        
        #10 valIn = 4'h7;
        #01 if ( 7'b1110000 != segOut )
                $display( "fail at 7, segOut=%b", segOut );
                
        $display("Simulation completed successfully");
        #10 $finish;
    end

endmodule // Decoder7Seg_tb 
