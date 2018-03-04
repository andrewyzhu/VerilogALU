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