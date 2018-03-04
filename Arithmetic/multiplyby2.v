// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module to multiply an 8 bit number by two, and output a carry if need be
// multiplying by 2 is a simple bit shift to the left
// preform the bit shift and make the carry equal to the bit at location 7
module multiplyby2(x,p,c);
	input [7:0] x;
	output [7:0] p;
	output c;
	assign c = x[7];
	assign p = x << 1;
endmodule