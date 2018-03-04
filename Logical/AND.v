// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
//assign statement in a module that outputs a bitwise and of the inputs
module aAND(x,y,aout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] aout;
	
	assign aout = x&y;
	
endmodule 