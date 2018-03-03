module nNOT(z,nout);
	input [7:0]z;
	output [7:0] nout;
	
	assign nout = ~z;
endmodule 