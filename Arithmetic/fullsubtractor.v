module fullsubtractor(x,y,bin,d,bout);
	input x;
	input y;
	input bin;
	output d;
	output bout;
	assign d = x^y^bin;
	assign bout = (y&bin) | ((~x)&bin) | ((~x)&y);
endmodule