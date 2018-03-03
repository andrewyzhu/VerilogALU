module multip(ArithAdd,ArithSub,Arithx2,Arithd2,Logand,Logor,Logxor,Lognot,Compeq,Compgreat,Compless,CompMAX,nightrid,O,S);
	input [7:0] ArithAdd,ArithSub,Arithx2,Arithd2,Logand,Logor,Logxor,Lognot,Compeq,Compgreat,Compless,CompMAX,nightrid;
	input [3:0] S;
	output reg [7:0] O;
	
	always@(ArithAdd,ArithSub,Arithx2,Arithd2,Logand,Logor,Logxor,Lognot,Compeq,Compgreat,Compless,CompMAX,nightrid)
	begin
		case(S)
		4'b0000 : O = ArithAdd; //arithmatic add
		4'b0001 : O = ArithSub; //arithmatic sub
		4'b0010 : O = Arithx2; //arithmatic x2
		4'b0011 : O = Arithd2; //arithmatic /2
		4'b0100 : O = Logand; //logical and
		4'b0101 : O = Logor; //logical or
		4'b0110 : O = Logxor; //logical xor
		4'b0111 : O = Lognot; //logical not
		4'b1000 : O = Compeq; //comparison =
		4'b1001 : O = Compgreat; //comparison greater
		4'b1010 : O = Compless; //comparison less
		4'b1011 : O = CompMAX; //comparison MAX
		4'b1100 : O = nightrid; //knight rider
		endcase
	end
endmodule

	