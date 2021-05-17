
module CounterClockSource(
    output wire clkDiv2,
    output wire clkDiv4,
    output wire clkDiv8,
    output wire clkDiv16,

    output reg [3:0] cntr = 0,

    input wire clk
);

    always @( posedge clk )
        cntr <= cntr + 1;

    assign clkDiv2  = cntr[0];
    assign clkDiv4  = cntr[1];
    assign clkDiv8  = cntr[2];
    assign clkDiv16 = cntr[3];

endmodule // module CounterClockSource
