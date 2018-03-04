// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================

//assign statement doing the bitwise or of the input
module oOR(x,y, oout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] oout;
	
	assign oout = x|y;
	
endmodule 

//assign statement doing the bitwise NOT of the input
module nNOT(z,nout);
	input [7:0]z;
	output [7:0] nout;
	
	assign nout = ~z;
endmodule 

// assign statement in a module that outputs the bitwise EXOR of the input
module EXOR(x,y,eout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] eout;
	
	assign eout = x^y;
endmodule 

//assign statement in a module that outputs a bitwise and of the inputs
module aAND(x,y,aout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] aout;
	
	assign aout = x&y;
	
endmodule 