// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
//signed subtractor
//takes two 4 bit signed inputs x and y, outputs a difference
//subtracts y from x
module signedsubtractor(x,y,d);
	input [3:0] x, y;
	output reg [7:0] d;
	wire [7:0] dbuf,dplus8,diff;
	//Two's complement of y
	wire [3:0] negy;
	assign negy = ~y + 1;
	//subtracting y from x is usually the same as taking the two's complement of y and adding it to x. 
	//However, this is not the case when y is equal to -8 (0b1000). 
	// The two's complement of -8 is -8 when using a 4 bit representation. (~0b1000 + 1 = 0b1000)
	//Therefore, if y input is -8, we add 7, then add 1 to x in order to achieve x-(-8)
	
	//add 8 to x, output this when y is -8
	signedadder sa1(x,7,dbuf);
	signedadder sa2(dbuf,1,dplus8);
	
	//add two's complement of y to x, output this when y does not equal -8.
	signedadder sa3(x,negy,diff);
	always @(x,y) begin
		if(y == 8) begin
			d = dplus8;
		end
		else begin
			d = diff;
		end
	end
endmodule
