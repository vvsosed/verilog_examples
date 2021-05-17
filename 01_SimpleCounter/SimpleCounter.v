
module SimpleCounter( output reg [25:0] ctrVal = 0, input wire clk );
    always @(posedge clk) ctrVal <= ctrVal + 1;
endmodule // module SimpleCounter
