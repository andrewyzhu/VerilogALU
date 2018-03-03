module max(x,y,o);
	input [3:0] x;
	input [3:0] y;
	output [3:0] o;
	wire greateroutput;
	greater G1(x,y,greateroutput);
	assign o[3] = (x[3] & greateroutput) | (y[3] & ~greateroutput);
	assign o[2] = (x[2] & greateroutput) | (y[2] & ~greateroutput);
	assign o[1] = (x[1] & greateroutput) | (y[1] & ~greateroutput);
	assign o[0] = (x[0] & greateroutput) | (y[0] & ~greateroutput);
endmodule 