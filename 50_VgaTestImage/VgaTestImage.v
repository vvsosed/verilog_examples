//`define MODE_640x480
//`define MODE_800x600
//`define MODE_1024x768
//`define MODE_1280x1024
//`define MODE_1440x900
`define MODE_1920x1080

module VgaTestImage(
    output wire [2:0] disp_RGB,
    output wire       hsync,
    output wire       vsync,
    input  wire       clock,    // 50MHz
    input  wire [3:0] switch
);

    wire display_on;
    wire [15:0] hpos;
    wire [15:0] vpos;

    wire areset_sig = 0;
    wire pixelClock;

`ifdef MODE_800x600
    assign pixelClock = clock; // 50 MHz
    `include "vm800x600.txt"
`endif
`ifdef MODE_640x480
    DMClkPll dmClkPllInst (
        .areset ( areset_sig ),
        .inclk0 ( clock ),
        .c0 ( pixelClock ) // 25.175 MHz
    );
    `include "vm640x480.txt"
`endif
`ifdef MODE_1024x768
    DMClkPll dmClkPllInst (
        .areset ( areset_sig ),
        .inclk0 ( clock ),
        .c1 ( pixelClock ) // 65 MHz
    );
    `include "vm1024x768.txt"
`endif 
`ifdef MODE_1280x1024
    DMClkPll dmClkPllInst (
        .areset ( areset_sig ),
        .inclk0 ( clock ),
        .c2 ( pixelClock ) // 108.0 MHz
    );
    `include "vm1280x1024.txt"
`endif 
`ifdef MODE_1440x900
    DMClkPll dmClkPllInst (
        .areset ( areset_sig ),
        .inclk0 ( clock ),
        .c3 ( pixelClock ) // 106.47 MHz
    );
    `include "vm1440x900.txt"
`endif 
`ifdef MODE_1920x1080
    DMClkPll dmClkPllInst (
        .areset ( areset_sig ),
        .inclk0 ( clock ),
        .c4 ( pixelClock ) // 148.5 MHz
    );
    `include "vm1920x1080.txt"
`endif

    VgaHVSyncSignalGen #(
        .DISPLAY_WIDTH(DISPLAY_WIDTH),
        .H_BACK_PORCH(H_BACK_PORCH),
        .H_FRONT_PORCH(H_FRONT_PORCH),
        .H_SYNC(H_SYNC),
        
        .DISPLAY_HEIGHT(DISPLAY_HEIGHT),
        .V_BACK_PORCH(V_BACK_PORCH),
        .V_FRONT_PORCH(V_FRONT_PORCH),
        .V_SYNC(V_SYNC)
    ) hvSyncGen (
        .hPosOut(hpos),
        .vPosOut(vpos),
        .isDisplayOnOut(display_on),
        .isHSyncOut(hsync),
        .isVSyncOut(vsync),

        .clkIn(pixelClock)
    );
    
    wire isGridPixel = (hpos & 4'b0111) == 0 || (vpos & 4'b0111) == 0;
    wire r = display_on && switch[0] && isGridPixel;
    wire b = display_on && switch[1] && (switch[3] ? hpos[4] : isGridPixel);
    wire g = display_on && switch[2] && (switch[3] ? vpos[4] : isGridPixel);
    assign disp_RGB = {r,g,b};

endmodule // VgaTestImage
