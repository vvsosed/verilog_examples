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
    output wire fA, fB, fC, fD, fE, fF, fG,
    input  wire [2:0] val
);
    wire A, B, C;
    assign {A, B, C} = val;

    assign fA = (~A & ~C) | (B)      | (A & C);
    assign fB = (~B & ~C) | (~A)     | (B & C);
    assign fC = (A)       | (~B)     | (C);
    assign fD = (~A & ~C) | (~A & B) | (B & ~C) | ( A & ~B & C);
    assign fE = (~A & ~C) | (B & ~C);
    assign fF = (~B & ~C) | (A & ~C) | (A & ~B);
    assign fG = (~A & B)  | (A & ~C) | (A & ~B);

endmodule // module Decoder7Seg
