
module VgaTestImage(
    output wire [2:0] disp_RGB,
    output wire       hsync,
    output wire       vsync,
    input  wire       clock,    // 50MHz
    input  wire [1:0] switch
);

  wire display_on;
  wire [15:0] hpos;
  wire [15:0] vpos;

  VgaHVSyncSignalGen hvSyncGen(
    .hPosOut(hpos),
    .vPosOut(vpos),
    .isDisplayOnOut(display_on),
    .isHSyncOut(hsync),
    .isVSyncOut(vsync),

    .clkIn(clock)
  );

  wire r = display_on && (((hpos&7)==0) || ((vpos&7)==0));
  wire g = display_on && vpos[4];
  wire b = display_on && hpos[4];
  assign disp_RGB = {b,g,r};

endmodule // VgaTestImage
