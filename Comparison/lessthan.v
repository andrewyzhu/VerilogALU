// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module that will determine if x input is less than y input
// assign statement that triggers on the change of x or y
// default the output to 0
// if x is less than y set the output to 1
module lessthan(x,y,o);
	input [3:0] x;
	input [3:0] y;
	output reg o;
	always @(x,y) begin
		o = 0;
		if(x < y) begin
			o = 1;
			end
		end
endmodule 