// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
//   Digital Logic ECEN 2350 Spring Semester
// ============================================================

// signed adder module
// takes in two 4 bit signed numbers
// sign extends both inputs by 1 bit to prevent overflow
// uses fulladders to add the sign extended inputs
// sign extends the output to 8 bits
module signedadder(x,y,s);
	input [3:0] x, y;
	output [7:0] s;
	
	//sign extension to prevent overflow, msb of sign extension is equal to msb of the input
	wire [4:0] signextensionx, signextensiony;
	assign signextensionx [4] = x [3];
	assign signextensionx [3:0] = x;
	assign signextensiony [4] = y [3];
	assign signextensiony [3:0] = y;
	
	//same implementation as unsigned adder
	wire [4:0] coutbuf;
	fulladder FA1(signextensionx[0],signextensiony[0],0,s[0],coutbuf[0]);
	genvar i; 
	generate
	for(i = 1; i<=4; i=i+1) begin: signedadders
		fulladder FA(signextensionx[i],signextensiony[i],coutbuf[i-1],s[i],coutbuf[i]);
		end
	endgenerate 
	
	//sign extends the output to 8 bits
	assign s[5] = s[4];
	assign s[6] = s[4];
	assign s[7] = s[4];
endmodule
