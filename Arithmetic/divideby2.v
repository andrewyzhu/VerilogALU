// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
//module to divide an 8 bit number by 2
// dividing is a simple bit shift to the right
// perform the bitshift and make the remainder equal to the value that was initially at position 0
module divideby2(x,q,r);
	input [7:0] x;
	output [7:0] q;
	output r; 
	assign r = x[0];
	assign q = x >> 1;
endmodule
