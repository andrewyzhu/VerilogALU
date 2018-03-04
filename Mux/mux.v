// ============================================================
//   Ver  :| Authors					               :| Mod. Date :| 
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
// ============================================================

// Create a module that serves as the multiplexer, taking in every previous output
// 4 outputs, 2 decimal point registers, an output register to the sevensegment.v, and an output to the LEDS for knight rider
module multip(ArithAdd,Addcarry,ArithSub,Subborrow,Arithx2,x2carry,Arithd2,d2remainder,Logand,Logor,Logxor,Lognot,Compeq,Compgreat,Compless,CompMAX,nightrid,signedadd,signedsub,O,S,outputLED,multiplydecpoint,dividedecpoint);
	input [7:0] ArithAdd,ArithSub,Arithx2,Arithd2,Logand,Logor,Logxor,Lognot,Compeq,Compgreat,Compless,CompMAX,signedadd,signedsub;
	input [3:0] S;
	input [9:0] nightrid;
	input Addcarry, Subborrow, x2carry, d2remainder;
	output reg multiplydecpoint,dividedecpoint;
	output reg [7:0] O;
	output reg [9:0] outputLED;
	
// an always block that triggers on any of the inputs
// by default make the decimal points 0
// make the multiplexer by doing a case statement with the switches/buttons making the outcomes
// first 2 bits are the buttons, last 2 are the switches
// LED9 is designated for the leftovers(carry,borrow,remainder)
// the rest of the led's are to visualize the math in binary	
	always@(ArithAdd,Addcarry,ArithSub,Subborrow,Arithx2,x2carry,Arithd2,d2remainder,Logand,Logor,Logxor,Lognot,Compeq,Compgreat,Compless,CompMAX,nightrid,signedadd,signedsub)
	begin
		multiplydecpoint = 1;
		dividedecpoint = 1; 
		case(S)
		4'b0000 :
		begin
			O = ArithAdd; //arithmatic add
			outputLED[7:0] = O;
			outputLED[8] = 0;
			outputLED[9] = Addcarry;
		end
		4'b0001 : 
		begin
			O = ArithSub; //arithmatic sub
			outputLED[7:0] = O;
			outputLED[8] = 0;
			outputLED[9] = Subborrow;
		end
		4'b0010 : 
		begin
			O = Arithx2; //arithmatic x2
			outputLED[7:0] = O;
			outputLED[8] = 0;
			outputLED[9] = x2carry;
			multiplydecpoint = ~x2carry;
		end
		4'b0011 : 
		begin
			O = Arithd2; //arithmatic /2
			outputLED[7:0] = O;
			outputLED[8] = 0;
			outputLED[9] = d2remainder;
			dividedecpoint = ~d2remainder;
		end
		4'b0100 :
		begin
			O = Logand; //logical and
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b0101 : 
		begin 
			O = Logor; //logical or
			outputLED[3:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b0110 : 
		begin
			O = Logxor; //logical xor
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b0111 : 
		begin
			O = Lognot; //logical not
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b1000 : 
		begin
			O = Compeq; //comparison =
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b1001 : 
		begin
			O = Compgreat; //comparison greater
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b1010 : 
		begin
			O = Compless; //comparison less
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b1011 :
		begin
			O = CompMAX; //comparison MAX
			outputLED[7:0] = O;
			outputLED[9:8] = 2'b00;
		end
		4'b1100 : 
		begin
			O = 0;
			outputLED = nightrid; //night rider
		end
		4'b1101 : //signed adder
		begin
			O = signedadd;
			outputLED[7:0] = O;
			outputLED[9:8] = 0;
		end
		4'b1110 : //signed subtractor
		begin
			O = signedsub;
			outputLED[7:0] = O;
			outputLED[9:8] = 0;
		end
		4'b1111: //no function
		begin
			O = 0;
			outputLED = 0;
		end
		endcase
		
	end
endmodule
