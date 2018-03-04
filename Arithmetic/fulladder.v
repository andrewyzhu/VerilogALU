// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module to operate as a full adder with
// 2 numbers, a carry in
// and output a sum and a carry out
// a full adder works as a sum equaling the XOR of its inputs
// the carry out is an OR of each input AND
module fulladder(x,y,cin,s,cout);
	input x;
	input y;
	input cin;
	output s;
	output cout;
	assign s = x^y^cin;
	assign cout = (y&cin) | (x&y) | (x&cin);
endmodule
