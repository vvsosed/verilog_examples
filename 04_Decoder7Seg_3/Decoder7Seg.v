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
         -----


     -Truth table-

  Input: A B C D E F G
  000 -> 1 1 1 1 1 1 0
  001 -> 0 1 1 0 0 0 0
  010 -> 1 1 0 1 1 0 1
  011 -> 1 1 1 1 0 0 1
  100 -> 0 1 1 0 0 1 1
  101 -> 1 0 1 1 0 1 1
  110 -> 1 0 1 1 1 1 1
  111 -> 1 1 1 0 0 0 0

*/

module Decoder7Seg(
    output reg  [6:0] out,
    input  wire [2:0] inp
);
    always @( inp )
      case( inp )
          3'b000:  out = 7'b111_1110;
          3'b001:  out = 7'b011_0000;
          3'b010:  out = 7'b110_1101;
          3'b011:  out = 7'b111_1001;
          3'b100:  out = 7'b011_0011;
          3'b101:  out = 7'b101_1011;
          3'b110:  out = 7'b101_1111;
          default: out = 7'b111_0000;
      endcase

endmodule // module Decoder7Seg
