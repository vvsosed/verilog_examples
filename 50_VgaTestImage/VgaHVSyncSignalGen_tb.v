`timescale 1ns/1ps

module VgaHVSyncSignalGen_tb();
    wire [15:0] hPosOut, 
                vPosOut;

    wire       isDisplayOnOut;
    wire       isHSyncOut, 
               isVSyncOut;

    reg       clkIn = 0;

    VgaHVSyncSignalGen vgaSigGen_1 (
        .hPosOut(hPosOut),
        .vPosOut(vPosOut),

        .isDisplayOnOut(isDisplayOnOut),
        .isHSyncOut(isHSyncOut), 
        .isVSyncOut(isVSyncOut),

        .clkIn(clkIn)
    );

    initial begin
        $dumpfile("VgaHVSyncSignalGen_tb.vcd");
        $dumpvars(0, VgaHVSyncSignalGen_tb);
        #50000000 $finish;
    end

    initial begin
        forever #10 clkIn = ~clkIn;
    end

    initial begin
        $display ("time \t\tclkIn \t\thPosOut \t\tvPosOut \t\tisDisplayOnOut \t\tisHSyncOut \t\tisVSyncOut");
        $monitor ("%g \t\t%b \t\t%b \t\t%b \t\t%b \t\t%b \t\t%b", $time, clkIn, hPosOut, vPosOut, isDisplayOnOut, isHSyncOut, isVSyncOut);
    end // initial procedure block
endmodule //VgaHVSyncSignalGen_tb 
