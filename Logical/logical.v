module aAND(x,y,aout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] aout;
	
	assign aout = x&y;
	
endmodule 


module oOR(x,y, oout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] oout;
	
	assign oout = x|y;
	
endmodule 

module EXOR(x,y,eout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] eout;
	
	assign eout = x^y;
endmodule 

module nNOT(z,nout);
	input [7:0]z;
	output [7:0] nout;
	
	assign nout = ~z;
endmodule 