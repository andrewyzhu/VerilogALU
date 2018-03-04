// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module to operate as a full adder with
// 3 inputs: 2 operands and a carry in,
// and 2 outputs: a sum and a carry out
// sum equals the XOR of its inputs
// the carry out is an OR of all possible combinations of inputs
module fulladder(x,y,cin,s,cout);
	input x;
	input y;
	input cin;
	output s;
	output cout;
	assign s = x^y^cin;
	assign cout = (y&cin) | (x&y) | (x&cin);
endmodule
