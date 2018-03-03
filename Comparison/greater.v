module greater(x,y,o);
	input [3:0] x;
	input [3:0] y;
	output reg o;
	always @(x,y) begin
		o = 0;
		if(x > y) begin
			o = 1;
			end
		end
endmodule