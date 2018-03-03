module multip(L,A,K,C,S,O);
	input [3:0] L,A,C;
	input K;
	input [3:0] S;
	output O;
	
	always@(L,A,K,C)
	begin
		case(S)
		4'b0000 : O = A[0]; //arithmatic add
		4'b0001 : O = A[1]; //arithmatic sub
		4'b0010 : O = A[2]; //arithmatic x2
		4'b0011 : O = A[3]; //arithmatic /2
		4'b0100 : O = L[0]; //logical and
		4'b0101 : O = L[1]; //logical or
		4'b0110 : O = L[2]; //logical xor
		4'b0111 : O = L[3]; //logical not
		4'b1000 : O = C[0]; //comparison =
		4'b1001 : O = C[1]; //comparison greater
		4'b1010 : O = C[2]; //comparison less
		4'b1011 : O = C[3]; //comparison MAX
		4'b1100 : O = K; //knight rider
		endcase
	end
endmodule

	