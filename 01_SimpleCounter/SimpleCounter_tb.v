`timescale 1ns/1ps

module SimpleCounter_tb();
    reg         clk = 0;
    wire [25:0] ctrVal;
    reg  [25:0] counterCheck = 1;

    SimpleCounter counter_1(
        .clk(clk),
        .ctrVal(ctrVal)
    );
    
    always #5 clk = ~clk;

    always @( negedge clk ) begin
        if ( counterCheck != ctrVal )
            $display("-->ERROR!. Esperado: %d. Leido: %d", counterCheck, ctrVal);
        else 
            counterCheck <= counterCheck + 1;
    end

    initial begin
        $dumpfile("SimpleCounter_tb.vcd");
        $dumpvars(0, SimpleCounter_tb);

        #1 if ( ctrVal != 0 )
            $display("ERROR! Counter value not equal to 0 at start!");
        else
            $display("Counter initialized successfully");

        #99 $display("Simulation completed");
        #100 $finish;
    end

endmodule // module SimpleCounter_tb
