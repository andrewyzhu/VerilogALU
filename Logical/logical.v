module logical(x,y,z,out1,out2,out3,rout);
	input [3:0] x; 
	input [3:0] y;
	input [7:0] z;
	input [1:0] s;
	output reg [7:0] rout;
	output reg [3:0] out1,out2,out3;
	wire [3:0]d,e,f;
	wire [7:0] g;
	
	aAND D1(x,y,d);
	oOR E1(x,y,e);
	EXOR F1(x,y,f);
	nNOR G1(z,g);
	
	assign out1 = d;
	assign out2 = e;
	assign out3 = f;
	assign rout = g;
	/*always@(x,y,z)
	begin
		case(s)
		2'b00 : out2 = d;
		2'b01 : out2 = e;
		2'b10 : out2 = f;
		2'b11 : rout = g;
		endcase
	end	
	*/
endmodule 

module aAND(x,y,aout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] aout;
	
	assign aout = x&y;
	
endmodule 


module oOR(x,y, oout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] oout;
	
	assign oout = x|y;
	
endmodule 

module EXOR(x,y,eout);
	input [3:0] x;
	input [3:0] y;
	output [3:0] eout;
	
	assign eout = x^y;
endmodule 

module nNOT(z,nout);
	input [7:0]z;
	output [7:0] nout;
	
	assign nout = ~z;
endmodule 