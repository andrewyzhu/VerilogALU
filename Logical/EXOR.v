module EXOR(x,y,eout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] eout;
	
	assign eout = x^y;
endmodule 