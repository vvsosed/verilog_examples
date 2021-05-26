
module RunningCounter( output wire [7:0] segOut, 
                       output wire [3:0] digitOut, 
							  input wire clock, 
							  input wire rst 
);
	reg [36:0] delayCtr;
	reg [1:0] digCtr;
	
	wire [7:0] segIn;
	DecoderBinTo7SegHex decSeg (
		.fullOut( segOut ),
		.valIn( segIn ),
		.dpIn( 0 )
	);
		
	assign digitOut[0] = (digCtr == 0);
	assign digitOut[1] = (digCtr == 1);
	assign digitOut[2] = (digCtr == 2);
	assign digitOut[3] = (digCtr == 3);
	
	assign segIn = (digCtr == 0) ? delayCtr[24:21] :
                  (digCtr == 1) ? delayCtr[28:25] :
                  (digCtr == 2) ? delayCtr[32:29] :
                /*(digCtr == 3)*/ delayCtr[36:33];
	
	always @ ( posedge clock ) begin 
		delayCtr = delayCtr + 1;
	end
	
	always @ ( delayCtr[15] ) begin
		digCtr = digCtr + 1;
	end
	
endmodule // RunningCounter
