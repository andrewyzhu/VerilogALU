// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
//assign statement doing the bitwise NOT of the input
module nNOT(z,nout);
	input [7:0]z;
	output [7:0] nout;
	
	assign nout = ~z;
endmodule 