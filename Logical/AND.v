module aAND(x,y,aout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] aout;
	
	assign aout = x&y;
	
endmodule 