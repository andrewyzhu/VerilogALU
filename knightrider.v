module knightrider(clkin,LEDout);
	input clkin;
	reg [19:0] divider;
	reg shiftdirection;
	output reg [9:0] LEDout;
	reg [13:0] LEDbuf; 	 
	initial begin
		divider = 0;
		shiftdirection = 0;
		LEDbuf = 14'b00000000001100;
	end 
	always @(posedge clkin) begin
		divider = divider + 1;
		if(divider == 1000000) begin
			divider = 0;
			if(LEDbuf[13:12] == 2'b11) begin
				shiftdirection = 1;
			end
			if(LEDbuf[1:0] == 2'b11) begin
				shiftdirection = 0;
			end
			if(shiftdirection == 0) begin
				LEDbuf = LEDbuf << 1;
			end
			if(shiftdirection == 1) begin
				LEDbuf = LEDbuf >> 1;
			end
			LEDout = LEDbuf [11:2];
		end
	end
endmodule
			