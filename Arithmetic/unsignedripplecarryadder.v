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