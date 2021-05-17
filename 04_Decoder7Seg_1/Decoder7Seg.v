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
