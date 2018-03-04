// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module that will determine if x is greater than y
// the output will be a register because it changes based off of the always block
// always block triggered at x or y change
// default output to 0
// if x is greater than y set output to 1
module greater(x,y,o);
	input [3:0] x;
	input [3:0] y;
	output reg o;
	always @(x,y) begin
		o = 0;
		if(x > y) begin
			o = 1;
			end
		end
endmodule