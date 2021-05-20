/* Sources: http://tinyvga.com/vga-timing/800x600@72Hz
            https://projectf.io/posts/video-timings-vga-720p-1080p/
    
    Screen refresh rate: 72 Hz
    Vertical refresh:    48.076923076923 kHz
    Pixel freq:          50.0 MHz
*/

`timescale 1ns/1ps

module VgaHVSyncSignalGen( 
    output reg [15:0] hPosOut = 0, 
    output reg [15:0] vPosOut = 0,
    output wire       isDisplayOnOut,
    output wire       isHSyncOut, 
    output wire       isVSyncOut,

    input  wire       clkIn // should be "Pixel freq"
);

    /* ------- Horizontal timing (line) -------
        Scanline part   Pixels   Time [µs]
        Visible area    800	     16
        Front porch	    56       1.12
        Sync pulse      120      2.4
        Back porch      64       1.28
        Whole line	    1040     20.8	
    */
    localparam DISPLAY_WIDTH = 800; // display width (horizontal)
    localparam H_BACK_PORCH  = 64;  // left border or horizontal back porch
    localparam H_FRONT_PORCH = 56;  // right border or horizontal front porch
    localparam H_SYNC        = 120; // horizontal sync # pixels
    
    localparam H_SYNC_START = DISPLAY_WIDTH + H_FRONT_PORCH - 1;
    localparam H_SYNC_END   = H_SYNC_START  + H_SYNC;
    localparam H_MAX        = H_SYNC_END    + H_BACK_PORCH; // 1040 - 1 #pixels

    /* ------- Vertical timing (frame) -------------------------------------
        Frame part      Lines    Time [ms]
        Visible area    600      12.48
        Front porch     37       0.7696
        Sync pulse      6        0.1248
        Back porch      23       0.4784
        Whole frame     666      13.8528	
    */
    localparam DISPLAY_HEIGHT = 600; // display height (vertical) #pixels
    localparam V_BACK_PORCH   = 23;  // vertical top border or vertical back porch
    localparam V_FRONT_PORCH  = 37;  // vertical bottom border vertical front porch
    localparam V_SYNC         = 6;   // vertical sync # lines

    localparam V_SYNC_START = DISPLAY_HEIGHT + V_FRONT_PORCH - 1;
    localparam V_SYNC_END   = V_SYNC_START   + V_SYNC;
    localparam V_MAX        = V_SYNC_END     + V_BACK_PORCH; // 666 - 1 #lines
    //-----------------------------------------------------------------------

    wire isHMax = (hPosOut == H_MAX);
    wire isVMax = (vPosOut == V_MAX);

    assign isDisplayOnOut = (hPosOut < DISPLAY_WIDTH - 1) && (vPosOut < DISPLAY_HEIGHT - 1);
    assign isHSyncOut     = H_SYNC_START <= hPosOut && hPosOut <= H_SYNC_END;
    assign isVSyncOut     = V_SYNC_START <= vPosOut && vPosOut <= V_SYNC_START;

    always @( posedge clkIn )
        if( isHMax )
            hPosOut <= 0;
        else
            hPosOut <= hPosOut + 1;

    always @( posedge clkIn )
        if( isHMax )
            if( isVMax )
                vPosOut <= 0;
            else
                vPosOut <= vPosOut + 1;

endmodule // VgaHVSyncSignalGen
