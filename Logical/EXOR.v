// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// assign statement in a module that outputs the bitwise EXOR of the input
module EXOR(x,y,eout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] eout;
	
	assign eout = x^y;
endmodule 