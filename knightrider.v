// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
//   Digital Logic ECEN 2350 Spring Semester
// ============================================================
// module for the bonus knight rider
// knight rider reads in a clock provided from the board, along with a mode and a speed designated by switches
// the outputs are simply the LED's on the board
// SW[7:4] designates mode while SW[3:0] designates speed
// 16 possible modes, 16 possible speeds

module knightrider(clkin,LEDout,mode,speed);
	input clkin;
	input [3:0] mode;
	input [3:0] speed;
	
	//clock divider
	reg [31:0] divider;
	
	//some output modes rely on bit shifting the leds, these registers store the direction in which the leds should be shifting
	reg shiftdirection1, shiftdirection2, shiftdirection9, shiftdirection11, shiftdirection12;
	
	output reg [9:0] LEDout;
	
	//buffers for the outputs of different modes
	reg [13:0] LEDbuf1, LEDbuf2;
	reg [9:0] LEDbuf3, LEDbuf4, LEDbuf5, LEDbuf6, LEDbuf7, LEDbuf8, LEDbuf10, LEDbuf11, LEDbuf12;
	reg[17:0] LEDbuf9;
	
	//initialize all registers
	initial begin
		divider = 0;
		shiftdirection1 = 0;
		shiftdirection2 = 1;
		shiftdirection9 = 0;
		shiftdirection11 = 0;
		shiftdirection12 = 0;
		LEDbuf1 = 14'b00000000001100;
		LEDbuf2 = 14'b00110000000000;
		LEDbuf3 = 10'b0000011111;
		LEDbuf4 = 10'b0101010101;
		LEDbuf5 = 10'b0011001100;
		LEDbuf6 = 10'b0000110000;
		LEDbuf7 = 10'b0001111000;
		LEDbuf8 = 10'b1110000111;
		LEDbuf9 = 17'b00000000000110000;
		LEDbuf10 = 10'b0000000000;
		LEDbuf11 = 10'b0000000000;
		LEDbuf12 = 10'b0000000000;
	end 
	
	always @(posedge clkin) begin
		divider = divider + 1;
		//increasing speed input will increase clock divider
		if(divider >= (100000*(speed+1))) begin
			divider = 0;
			
			//conditions on which shift direction should change for different modes
			if(LEDbuf1[13:12] == 2'b11) begin
				shiftdirection1 = 1;
			end
			if(LEDbuf1[1:0] == 2'b11) begin
				shiftdirection1 = 0;
			end
			if(LEDbuf2[13:12] == 2'b11) begin
				shiftdirection2 = 1;
			end
			if(LEDbuf2[1:0] == 2'b11) begin
				shiftdirection2 = 0;
			end
			if(LEDbuf9[17:16] == 2'b11) begin
				shiftdirection9 = 1;
			end
			if(LEDbuf9[1:0] == 2'b11) begin
				shiftdirection9 = 0;
			end
			if(LEDbuf11 == 10'b1111111111) begin
				shiftdirection11 = 1;
			end
			if(LEDbuf11 == 0) begin
				shiftdirection11 = 0;
			end
			if(LEDbuf12 == 10'b1111111111) begin
				shiftdirection12 = 1;
			end
			if(LEDbuf12 == 0) begin
				shiftdirection12 = 0;
			end
			
			//shift LED output buffers for certain modes depending on shift direction
			if(shiftdirection1 == 0) begin
				LEDbuf1 = LEDbuf1 << 1;
			end
			if(shiftdirection1 == 1) begin
				LEDbuf1 = LEDbuf1 >> 1;
			end
			if(shiftdirection2 == 0) begin
				LEDbuf2 = LEDbuf2 << 1;
			end
			if(shiftdirection2 == 1) begin
				LEDbuf2 = LEDbuf2 >> 1;
			end
			
			//toggle LED output buffers for certain modes
			LEDbuf3 = LEDbuf3 ^ 10'b1111111111;
			LEDbuf4 = LEDbuf4 ^ 10'b1111111111;
			LEDbuf5 = LEDbuf5 ^ 10'b1111111111;
			LEDbuf6 = LEDbuf6 ^ 10'b1111111111;
			LEDbuf7 = LEDbuf7 ^ 10'b1111111111;
			
			//toggle LED output buffer except for bits 1,2,7, and 8
			LEDbuf8 = LEDbuf8 ^ 10'b1001111001;
			
			//shift LED output buffers for certain modes depending on shift direction
			if(shiftdirection9 == 0) begin
				LEDbuf9 = LEDbuf9 << 4;
			end
			if(shiftdirection2 == 1) begin
				LEDbuf9 = LEDbuf9 >> 4;
			end
			
			//if LED output buffer is full, clear the buffer
			if(LEDbuf10 == 10'b1111111111) begin
				LEDbuf10 = ~LEDbuf10;
			end
			
			//shift left by 1 bit, add 1. Essentially turns on LEDs from right to left
			LEDbuf10 = LEDbuf10 << 1;
			LEDbuf10 = LEDbuf10 + 1;
			
			//shift LED output buffers for certain modes depending on shift direction
			if(shiftdirection11 == 0) begin
				//shift left by 1 bit, add 1. Essentially turns on LEDs from right to left
				LEDbuf11 = LEDbuf11 << 1;
				LEDbuf11 = LEDbuf11 + 1;
			end
			if(shiftdirection11 == 1) begin
				//shifts to the right by 1 bit. Essentially turns off LEDs from left to right
				LEDbuf11 = LEDbuf11 >> 1;
			end
			
			if(shiftdirection12 == 0) begin
				//shift left by 1 bit, add 1. Essentially turns on LEDs from right to left
				LEDbuf12 = LEDbuf12 << 1;
				LEDbuf12 = LEDbuf12 + 1;
			end
			if(shiftdirection12 == 1) begin
				//shift left by 1 bit. Essentially turns off LEDs from right to left
				LEDbuf12 = LEDbuf12 << 1;
			end
			
			//choses output depending on mode
			if(mode == 0) begin
				LEDout = LEDbuf1 [11:2];
			end
			if(mode == 1) begin
				LEDout = ~LEDbuf1 [11:2];
			end
			if(mode == 2) begin
				LEDout = (LEDbuf1 [11:2] | LEDbuf2 [11:2]);
			end
			if(mode == 3) begin
				LEDout = ~(LEDbuf1 [11:2] | LEDbuf2 [11:2]);
			end
			if(mode == 4) begin
				LEDout = (LEDbuf1 [11:2] | LEDbuf2 [11:2]);
				if(LEDbuf1 == LEDbuf2) begin
					LEDout = 10'b1111111111;
					LEDbuf1 = 14'b00000000000011;
					LEDbuf2 = 14'b11000000000000;
				end
			end
			if(mode == 5) begin
				LEDout = ~(LEDbuf1 [11:2] | LEDbuf2 [11:2]);
				if(LEDbuf1 == LEDbuf2) begin
					LEDout = 10'b0000000000;
					LEDbuf1 = 14'b00000000000011;
					LEDbuf2 = 14'b11000000000000;
				end
			end
			if(mode == 6) begin 
				LEDout = LEDbuf3;
			end
			if(mode == 7) begin
				LEDout = LEDbuf4;
			end
			if(mode == 8) begin
				LEDout = LEDbuf5;
			end
			if(mode == 9) begin
				LEDout = LEDbuf6;
			end
			if(mode == 10) begin
				LEDout = LEDbuf7;
			end
			if(mode == 11) begin
				LEDout = LEDbuf8;
			end
			if(mode == 12) begin
				LEDout = LEDbuf9[13:4];
			end
			if(mode == 13) begin
				LEDout = LEDbuf10;
			end
			if(mode == 14) begin
				LEDout = LEDbuf11;
			end
			if(mode == 15) begin
				LEDout = LEDbuf12;
			end
		end
	end
endmodule
			
