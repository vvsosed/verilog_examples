/*
    -Segments of indicator-
    
             
          -- A --
          |     |
          F     B
          |     |
          -- G --
          |     |
          E     C
          |     |
          -- D --  (DP)


    /----------------------\
    |  -Truth table-       |
    >----------------------<
    | Input:|     ABCDEFG  |
    >----------------------<
    | 4'h0 --> 7'b1111110; |
    | 4'h1 --> 7'b0110000; |
    | 4'h2 --> 7'b1101101; |
    | 4'h3 --> 7'b1111001; |
    | 4'h4 --> 7'b0110011; |
    | 4'h5 --> 7'b1011011; |
    | 4'h6 --> 7'b1011111; |
    | 4'h7 --> 7'b1110000; |
    | 4'h8 --> 7'b1111111; |
    | 4'h9 --> 7'b1111011; |
    | 4'hA --> 7'b1110111; |
    | 4'hB --> 7'b0011111; |
    | 4'hC --> 7'b1001110; |
    | 4'hD --> 7'b0111101; |
    | 4'hE --> 7'b1001111; |
    | 4'hF --> 7'b1000111; |
    \----------------------/

*/

module DecoderBinTo7SegHex(
    output wire [7:0] segOut, // [A..F]
    input  wire [3:0] valIn,
    input  wire       dpIn
);
    reg [6:0] segs;
    
    assign segOut = { dpIn, segs };
    
    always @( valIn )
      case( valIn )
          4'h0: segs = ~7'b1111110;
          4'h1: segs = ~7'b0110000;
          4'h2: segs = ~7'b1101101;
          4'h3: segs = ~7'b1111001;
          4'h4: segs = ~7'b0110011;
          4'h5: segs = ~7'b1011011;
          4'h6: segs = ~7'b1011111;
          4'h7: segs = ~7'b1110000;
          4'h8: segs = ~7'b1111111;
          4'h9: segs = ~7'b1111011;
		  4'hA: segs = ~7'b1110111;
		  4'hB: segs = ~7'b0011111;
          4'hC: segs = ~7'b1001110;
		  4'hD: segs = ~7'b0111101;
		  4'hE: segs = ~7'b1001111;
          default: segs = ~7'b1000111; // 4'hF
      endcase

endmodule // module Decoder7Seg
