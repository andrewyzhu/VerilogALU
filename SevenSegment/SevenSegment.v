module sevensegment(binaryin,decin,sevenseg,decout);
	input [3:0] binaryin;
	input decin; 
	output reg [6:0] sevenseg;
	output decout; 
	assign decout = decin;
	always @(binaryin) begin
		case(binaryin)
			4'b0000 : sevenseg = 7'b0000001;
			4'b0001 : sevenseg = 7'b1001111;
			4'b0010 : sevenseg = 7'b0010010;
			4'b0011 : sevenseg = 7'b0000110;
			4'b0100 : sevenseg = 7'b1001100;
			4'b0101 : sevenseg = 7'b0100100;
			4'b0110 : sevenseg = 7'b0100000;
			4'b0111 : sevenseg = 7'b0001111;
			4'b0100 : sevenseg = 7'b1001100;
			4'b1000 : sevenseg = 7'b0000000;
			4'b1001 : sevenseg = 7'b0000100;
			4'b1010 : sevenseg = 7'b0001000;
			4'b1011 : sevenseg = 7'b1100000;
			4'b1100 : sevenseg = 7'b1110001;
			4'b1101 : sevenseg = 7'b1000010;
			4'b1110 : sevenseg = 7'b0110000;
			4'b1111 : sevenseg = 7'b0111000;
			endcase
		end
endmodule 
	
	