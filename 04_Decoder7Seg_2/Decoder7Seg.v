/*
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

  #---Truth table----#
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
    output wire [6:0] out,
    input  wire [2:0] val
);
    assign out = (val == 3'b000) ? 7'b111_1110 :
                 (val == 3'b001) ? 7'b011_0000 :
                 (val == 3'b010) ? 7'b110_1101 :
                 (val == 3'b011) ? 7'b111_1001 :
                 (val == 3'b100) ? 7'b011_0011 :
                 (val == 3'b101) ? 7'b101_1011 :
                 (val == 3'b110) ? 7'b101_1111 :
                 //(val == 3'b111) ? 7'b111_0000 :
                 //                  7'bXXX_XXXX;
               /*(val == 3'b111)*/ 7'b111_0000;

endmodule // module Decoder7Seg
