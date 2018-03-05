// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
//   Digital Logic ECEN 2350 Spring Semester
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