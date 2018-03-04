// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module to act as a full subtractor, similar to a full adder
// the inputs are similar because they are 2 numbers and a borrow in
// the out puts are similar as they are a difference and a borrow out
// the difference is similar in the way that they are an XOR of the inputs
// but the borrow out is different in the way that the number you are subtracting must be inverted in the borrow out logic
module fullsubtractor(x,y,bin,d,bout);
	input x;
	input y;
	input bin;
	output d;
	output bout;
	assign d = x^y^bin;
	assign bout = (y&bin) | ((~x)&bin) | ((~x)&y);
endmodule