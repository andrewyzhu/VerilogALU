module fulladder(x,y,cin,s,cout);
	input x;
	input y;
	input cin;
	output s;
	output cout;
	assign s = x^y^cin;
	assign cout = (y&cin) | (x&y) | (x&cin);
endmodule
