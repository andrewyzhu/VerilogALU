module sevensegment(binaryin,decin,sevenseg,decout);
	input [3:0] binaryin;
	input decin; 
	output reg [6:0] sevenseg;
	output decout; 
	assign decout = decin;
	always @(binaryin) begin
		case(binaryin)
			4'b0000 : sevenseg = 7'b1000000; //0
			4'b0001 : sevenseg = 7'b1111001; //1
			4'b0010 : sevenseg = 7'b0100100;	//2
			4'b0011 : sevenseg = 7'b0110000;	//3
			4'b0100 : sevenseg = 7'b0011001;	//4
			4'b0101 : sevenseg = 7'b0010010;	//5
			4'b0110 : sevenseg = 7'b0000010;	//6
			4'b0111 : sevenseg = 7'b1111000;	//7
			4'b1000 : sevenseg = 7'b0000000;	//8
			4'b1001 : sevenseg = 7'b0010000;	//9
			4'b1010 : sevenseg = 7'b0001000;	//A
			4'b1011 : sevenseg = 7'b0000011;	//b
			4'b1100 : sevenseg = 7'b1000110;	//C
			4'b1101 : sevenseg = 7'b0100001;	//d
			4'b1110 : sevenseg = 7'b0000110; //E
			4'b1111 : sevenseg = 7'b0001110;	//f
			endcase
		end
endmodule 

module sevensegmodedisplay(mode, sevensegmode1,sevensegmode2);
	input [3:0] mode;
	output reg [6:0] sevensegmode1;
	output reg [6:0] sevensegmode2;
	always @(mode) begin
		case(mode)
			4'b0000 : //arithmetic add, seven segment will display 'aa'
			begin
				sevensegmode1 = 7'b0001000;	
				sevensegmode2 = 7'b0001000;
			end
			4'b0001 : //arithmetic subtract, seven segment will display 'a5'
			begin
				sevensegmode1 = 7'b0001000;	
				sevensegmode2 = 7'b0010010;
			end
			4'b0010 : //arithmetic multiplyby2, seven segment will display 'aP' (arithmetic product)
			begin
				sevensegmode1 = 7'b0001000; 
				sevensegmode2 = 7'b0001100;
			end
			4'b0011 : //arithmetic divideby2, seven segment will display 'ad'
			begin
				sevensegmode1 = 7'b0001000; 
				sevensegmode2 = 7'b0100001;
			end
			4'b0100 : //logical and, seven segment will display 'LA'
			begin
				sevensegmode1 = 7'b1000111; 
				sevensegmode2 = 7'b0001000;
			end
			4'b0101 : //logical or, seven segment will display 'L0'
			begin
				sevensegmode1 = 7'b1000111;	
				sevensegmode2 = 7'b1000000;
			end
			4'b0110 : //logical xor, seven segment will display 'LX'
			begin
				sevensegmode1 = 7'b1000111; 
				sevensegmode2 = 7'b0001001;
			end
			4'b0111 : //logical not, seven segment will display 'Ln'
			begin
				sevensegmode1 = 7'b1000111; 
				sevensegmode2 = 7'b0101011;
			end
			4'b1000 : //comparison equals, seven segment will display 'CE'
			begin
				sevensegmode1 = 7'b1000110;	
				sevensegmode2 = 7'b0000110;
			end
			4'b1001 : //comparison greater, seven segment will display 'C6'
			begin
				sevensegmode1 = 7'b1000110; 
				sevensegmode2 = 7'b0000010;
			end
			4'b1010 : //comparison lessthan, seven segment will display 'CL'
			begin
				sevensegmode1 = 7'b1000110; 
				sevensegmode2 = 7'b1000111;
			end
			4'b1011 : //logical max, seven segment will display 'CX'
			begin
				sevensegmode1 = 7'b1000110; 
				sevensegmode2 = 7'b0001001;
			end
			4'b1100: //knight rider, seven segment will display 'nr'
			begin
				sevensegmode1 = 7'b0101011;
				sevensegmode2 = 7'b0101111;
			end
			endcase
		end
endmodule
			
	
	