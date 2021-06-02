
module RunningCounter( output wire [7:0] segOut, 
                       output wire [3:0] digitOut, 
							  input wire clock, 
							  input wire reset 
);
	reg [36:0] delayCtr;
	reg [1:0] digCtr;
	
	wire [3:0] valIn;
	DecoderBinTo7SegHex decSeg (
		.segOut( segOut ),
		.valIn( valIn ),
		.dpIn( 1'b1 )
	);
	
	assign digitOut[0] = !reset || (digCtr != 0);
	assign digitOut[1] = !reset || (digCtr != 1);
	assign digitOut[2] = !reset || (digCtr != 2);
	assign digitOut[3] = !reset || (digCtr != 3);
	
	assign valIn = (digCtr == 0) ? delayCtr[24:21] :
                  (digCtr == 1) ? delayCtr[28:25] :
                  (digCtr == 2) ? delayCtr[32:29] :
                /*(digCtr == 3)*/ delayCtr[36:33];
	
	always @ ( posedge clock ) begin 
		if ( !reset )
			delayCtr = 37'h0;
		else
			delayCtr = delayCtr + 1'b1;
	end
	
	always @ ( posedge delayCtr[15] ) begin
		digCtr = digCtr + 1'b1;
	end
	
endmodule // RunningCounter
