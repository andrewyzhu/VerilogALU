module divideby2(x,q,r);
	input [7:0] x;
	output [7:0] q;
	output r; 
	assign r = x[0];
	assign q = x >> 1;
endmodule