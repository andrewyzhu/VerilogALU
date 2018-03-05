// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
//   Digital Logic ECEN 2350 Spring Semester
// ============================================================

//signed subtractor
//takes in two 4 bit signed numbers: x and y
//subtracts y from x
//most of the time, this can be performed by taking the two's complement of y and adding the result to x
//however if y is -8 (0b1000), this does not work
//two's complement of -8 is -8 (~0b1000 + 1 = 0b1000)
//in the case where y is -8, first add 7 to x, then add 1 to x. 
module signedsubtractor(x,y,d);
	input [3:0] x, y;
	output reg [7:0] d;
	wire [7:0] dbuf,dplus8,diff;
	wire [3:0] negy;
	
	//two's complement of y
	assign negy = ~y + 1;
	
	//add 8 to x
	signedadder sa1(x,7,dbuf);
	signedadder sa2(dbuf,1,dplus8);
	
	//add two's complement of y to x
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
