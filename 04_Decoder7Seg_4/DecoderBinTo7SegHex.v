/*
    -Segments of indicator-
    
             A
           -----
          |     |
        F |     | B
          |  G  |
          -----
          |     |
        E |     | C
          |  D  |
           -----  (dp)


    /----------------------\
    |  -Truth table-       |
    >----------------------<
    | Input:|    ABCDEFG   |
    >----------------------<
    | 4'h0 --> 7'b1111110; |
    | 4'h1 --> 7'b0110000; |
    | 4'h2 --> 7'b1101101; |
    | 4'h3 --> 7'b1111001; |
    | 4'h4 --> 7'b0110011; |
    | 4'h5 --> 7'b1011011; |
    | 4'h6 --> 7'b1011111; |
    | 4'h7 --> 7'b1110000; |
    | 4'h8 --> 7'bxxxxxxx; |
    | 4'h9 --> 7'bxxxxxxx; |
    | 4'hA --> 7'bxxxxxxx; |
    | 4'hB --> 7'bxxxxxxx; |
    | 4'hC --> 7'bxxxxxxx; |
    | 4'hD --> 7'bxxxxxxx; |
    | 4'hE --> 7'bxxxxxxx; |
    | 4'hF --> 7'bxxxxxxx; |
    \----------------------/

*/

module DecoderBinTo7SegHex(
    output wire [7:0] fullOut,
    input  wire [3:0] valIn,
    input  wire       dpIn
);
    reg [6:0] segOut;
    
    assign fullOut = { dpIn, segOut };
    
    always @( valIn )
      case( valIn )
          4'h0: segOut = 7'b1111110;
          4'h1: segOut = 7'b0110000;
          4'h2: segOut = 7'b1101101;
          4'h3: segOut = 7'b1111001;
          4'h4: segOut = 7'b0110011;
          4'h5: segOut = 7'b1011011;
          4'h6: segOut = 7'b1011111;
          4'h7: segOut = 7'b1110000;

          4'h8: segOut = 7'b0000000;
          4'h9: segOut = 7'b0000100;
          4'hA: segOut = 7'b0001000;
          4'hB: segOut = 7'b1100000;
          4'hC: segOut = 7'b0110001;
          4'hD: segOut = 7'b1000010;
          4'hE: segOut = 7'b0110000;
          default: segOut = 7'b0111000; // 4'hF
      endcase

endmodule // module Decoder7Seg
