
module RippleClockSource (
    output reg clkDiv2  = 0,
    output reg clkDiv4  = 0,
    output reg clkDiv8  = 0,
    output reg clkDiv16 = 0,

    input wire clk
);

    always @( posedge clk )
        clkDiv2 <= ~clkDiv2;

    always @( posedge clkDiv2 )
        clkDiv4 <= ~clkDiv4;

    always @( posedge clkDiv4 )
        clkDiv8 <= ~clkDiv8;

    always @( posedge clkDiv8 )
        clkDiv16 <= ~clkDiv16;

endmodule // module RippleClockSource
