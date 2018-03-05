// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
//adds two 4 bit signed numbers
//takes two inputs, x and y
//outputs an 8 bit sum to eliminate need for a carry out
module signedadder(x,y,s);
	//inputs and outputs
	input [3:0] x, y;
	output [7:0] s;
	
	//sign extend the inputs to 5 bits long. This will prevent overflow
	wire [4:0] signextensionx, signextensiony;
	//the added bit in the sign extension is the same as the most significant bit of the input 
	assign signextensionx [4] = x [3];
	assign signextensionx [3:0] = x;
	assign signextensiony [4] = y [3];
	assign signextensiony [3:0] = y;
	
	//wire containing the carries needed for addition
	wire [4:0] coutbuf;
	
	//add the least significant bit of the sign-extended inputs together
	fulladder FA1(signextensionx[0],signextensiony[0],0,s[0],coutbuf[0]);
	
	//add the rest of the bits, taking into account carries. 
	genvar i; 
	generate
	for(i = 1; i<=size; i=i+1) begin: signedadders
		fulladder FA(signextensionx[i],signextensiony[i],coutbuf[i-1],s[i],coutbuf[i]);
		end
	endgenerate 
	//sign extend the output to 8 bits
	assign s[5] = s[4];
	assign s[6] = s[4];
	assign s[7] = s[4];
endmodule
