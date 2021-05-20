`timescale 1ns/1ps

module VgaTestImage_tb();
    wire [2:0] disp_RGB;
    wire       hsync;
    wire       vsync;
    reg        clock  = 0;    // 50MHz
    reg  [1:0] switch = 0;

    VgaTestImage vgaTestImage (
        .disp_RGB(disp_RGB),
        .hsync(hsync),
        .vsync(vsync),
        .clock(clock), 
        .switch(switch)
    );

    initial begin
        $dumpfile( "VgaTestImage_tb.vcd" );
        $dumpvars( 0, VgaTestImage_tb );
        #50000000 $finish;
    end

    initial begin
        forever #10 clock = ~clock;
    end

    initial begin
        $display( "time \t\tdisp_RGB \t\thsync \t\tvsync" );
        $monitor( "%g \t\t%b \t\t%b \t\t%b", $time, disp_RGB, hsync, vsync );
    end // initial procedure block
endmodule //VgaTestImage_tb 
