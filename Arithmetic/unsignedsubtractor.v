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