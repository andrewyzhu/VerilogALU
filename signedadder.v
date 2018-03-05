// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
//   Digital Logic ECEN 2350 Spring Semester
// ============================================================
module signedadder(x,y,s);
	parameter size = 4;
	input [size-1:0] x, y;
	output [7:0] s;
	wire [size:0] signextensionx, signextensiony;
	assign signextensionx [size] = x [size-1];
	assign signextensionx [size-1:0] = x;
	assign signextensiony [size] = y [size-1];
	assign signextensiony [size-1:0] = y;
	wire [size:0] coutbuf;
	fulladder FA1(signextensionx[0],signextensiony[0],0,s[0],coutbuf[0]);
	genvar i; 
	generate
	for(i = 1; i<=size; i=i+1) begin: signedadders
		fulladder FA(signextensionx[i],signextensiony[i],coutbuf[i-1],s[i],coutbuf[i]);
		end
	endgenerate 
	assign s[5] = s[4];
	assign s[6] = s[4];
	assign s[7] = s[4];
endmodule