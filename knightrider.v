module knightrider(clk,out);
	input clk;
	output[9:0] out;

	reg clkshift;
	
	reg [13:0] totalled; //2 extra leds that dont exist on each side of the 10
	reg [1:0] currentpos; // 2 leds at a time scrolling
	

	always@(posedge clk)
		begin
			if (clkshift <= 500)
				begin
					clkshift = clkshift + 1;
				end
			else
				begin
					clkshift = 0;
				end
		end
	
	assign delayedclk = clkshift; //delayed clock
	

	
	always@(delayedclk) //shift
		begin
			if (currentpos == 0)
				begin
					totalled <= totalled << 1;
				end
			else 
				begin
					totalled <= totalled >> 1;
				end
			currentpos <= currentpos + 1;
		end
	
	
	assign out [8:0] = totalled [10:2]; // make sure the 10 leds output are 10 of the fake array
endmodule
