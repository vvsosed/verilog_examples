`timescale 1ns/1ps


module HalfAdder( output wire sumOut, carryOut, input wire xIn, yIn );
    // xor #1 U1(sumOut,   xIn,  yIn);
    // and #1 U2(carryOut, xIn, yIn);
    assign #1 sumOut   = xIn ^ yIn;
    assign #1 carryOut = xIn & yIn;
endmodule // HalfAdder


module FullAdder( output wire sumOut, carryOut, input wire xIn, yIn, carryIn );
    wire ha1Sum, ha1CarryOut, ha2CarryOut;

    HalfAdder halfAdder_1(ha1Sum, ha1CarryOut, xIn,    yIn);
    HalfAdder halfAdder_2(sumOut, ha2CarryOut, ha1Sum, carryIn);

    // or #1 or_1(carryOut, ha2CarryOut, ha1CarryOut);
    assign #1 carryOut = ha2CarryOut | ha1CarryOut;
endmodule // FullAdder


module RippleCarryAdder4Bit( 
    output wire [3:0] sumOut, 
    output wire carryOut,

    input wire [3:0] xIn, yIn,
    input wire carryIn
);
    wire carry1, carry2, carry3;

    FullAdder fullAdder_1(sumOut[0], carry1,   xIn[0], yIn[0], carryIn);
    FullAdder fullAdder_2(sumOut[1], carry2,   xIn[1], yIn[1], carry1);
    FullAdder fullAdder_3(sumOut[2], carry3,   xIn[2], yIn[2], carry2);
    FullAdder fullAdder_4(sumOut[3], carryOut, xIn[3], yIn[3], carry3);
endmodule // RippleCarryAdder4Bit
