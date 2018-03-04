// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module to be a RCA
// inputs 4 bit for x and y
// 2 outputs, one the added number, and two the carry out if necessarry
// wire a buffer to see if a carry out happened
// use the full adder module to add each bit in a for loop, returning a carry out if need be
// assign the carry out to be the bit represented at the buffer[3]
// otherwise output the value stored from the addition
module unsignedripplecarryadder(x,y,s,cout);
	parameter size = 4;
	input [size-1:0] x;
	input [size-1:0] y;
	output[size-1:0] s;
	wire [size-1:0] coutbuf;
	output cout;
	fulladder FA1(x[0],y[0],0,s[0],coutbuf[0]);
	genvar i; 
	generate
	for(i = 1; i<size; i=i+1) begin: adders
		fulladder FA(x[i],y[i],coutbuf[i-1],s[i],coutbuf[i]);
		end
	endgenerate 
	assign cout = coutbuf[size-1];
endmodule