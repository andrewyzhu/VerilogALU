// ============================================================
//   Ver  :| Authors					               :| Mod. Date :|
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :|
//   Digital Logic ECEN 2350 Spring Semester
// ============================================================
module signedsubtractor(x,y,d);
	input [3:0] x, y;
	output reg [7:0] d;
	wire [7:0] dbuf,dplus8,diff;
	wire [3:0] negy;
	assign negy = ~y + 1;
	signedadder sa1(x,7,dbuf);
	signedadder sa2(dbuf,1,dplus8);
	signedadder sa3(x,negy,diff);
	always @(x,y) begin
		if(y == 8) begin
			d = dplus8;
		end
		else begin
			d = diff;
		end
	end
endmodule