// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module that determines if x and y are equal
// output is a reg because the equality is determined in an always block
// always block triggered at x or y
// output is default set to 0
// if x and y are equal set output to 1
module equal(x,y,o);
	input [3:0] x;
	input [3:0] y;
	output reg o;
	always @(x,y) begin
		o = 0;
		if(x == y) begin
			o = 1;
			end
		end
endmodule 