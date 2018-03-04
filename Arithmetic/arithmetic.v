// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================
// module to do unsigned subtraction
// inputs are 4 bits
// output is 4 bits as well
// there is an extra output in case there is a borrow that needs to be represented
// wire from our full subtractor module needed in a later for loop
// in the for loop, subtract each bit using our full subtractor, registering a borrow when used
// assign our borrow output to our buffer at bit 3, so we get a 1 bit representation of if we needed a borrow or not
module unsignedsubtractor(x,y,d,bout);
	parameter size = 4;
	input [size-1:0] x;
	input [size-1:0] y;
	output [size-1:0] d;
	wire [size-1:0] boutbuf;
	output bout;
	fullsubtractor FS1(x[0],y[0],0,d[0],boutbuf[0]);
	genvar i;
	generate
	for(i = 1; i<size; i=i+1) begin: subtractors
			fullsubtractor FS(x[i],y[i],boutbuf[i-1],d[i],boutbuf[i]);
		end	
	endgenerate
	assign bout = boutbuf[size-1];
endmodule

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

// module to multiply an 8 bit number by two, and output a carry if need be
// multiplying by 2 is a simple bit shift to the left
// preform the bit shift and make the carry equal to the bit at location 7
module multiplyby2(x,p,c);
	input [7:0] x;
	output [7:0] p;
	output c;
	assign c = x[7];
	assign p = x << 1;
endmodule

// module to act as a full subtractor, similar to a full adder
// the inputs are similar because they are 2 numbers and a borrow in
// the out puts are similar as they are a difference and a borrow out
// the difference is similar in the way that they are an XOR of the inputs
// but the borrow out is different in the way that the number you are subtracting must be inverted in the borrow out logic
module fullsubtractor(x,y,bin,d,bout);
	input x;
	input y;
	input bin;
	output d;
	output bout;
	assign d = x^y^bin;
	assign bout = (y&bin) | ((~x)&bin) | ((~x)&y);
endmodule

// module to operate as a full adder with
// 2 numbers, a carry in
// and output a sum and a carry out
// a full adder works as a sum equaling the XOR of its inputs
// the carry out is an OR of each input AND
module fulladder(x,y,cin,s,cout);
	input x;
	input y;
	input cin;
	output s;
	output cout;
	assign s = x^y^cin;
	assign cout = (y&cin) | (x&y) | (x&cin);
endmodule

//module to divide an 8 bit number by 2
// dividing is a simple bit shift to the right
// preform the bitshift and make the carry equal to the value at position 0
module divideby2(x,q,r);
	input [7:0] x;
	output [7:0] q;
	output r; 
	assign r = x[0];
	assign q = x >> 1;
endmodule