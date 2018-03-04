// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module max that takes in 2 inputs and outputs the maximum of the two
// output is going to be a wire
// wire the output of our greater than module 
// use our greater than module to do a bitwise AND between every bit of the input and the output of our greater than module
// bitwise OR the result
// assign each bit of the output to each individual result
module max(x,y,o);
	input [3:0] x;
	input [3:0] y;
	output [3:0] o;
	wire greateroutput;
	greater G1(x,y,greateroutput);
	assign o[3] = (x[3] & greateroutput) | (y[3] & ~greateroutput);
	assign o[2] = (x[2] & greateroutput) | (y[2] & ~greateroutput);
	assign o[1] = (x[1] & greateroutput) | (y[1] & ~greateroutput);
	assign o[0] = (x[0] & greateroutput) | (y[0] & ~greateroutput);
endmodule 