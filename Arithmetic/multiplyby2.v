module multiplyby2(x,p,c);
	input [7:0] x;
	output [7:0] p;
	output c;
	assign c = x[7];
	assign p = x << 1;
endmodule