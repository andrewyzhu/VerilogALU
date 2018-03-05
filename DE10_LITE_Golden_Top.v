// ============================================================================
//   Ver  :| Authors					               :| Mod. Date :| Changes Made:
//   V1.1 :| Andrew Zhu and Kurt Sprague			:| 3/4/2018  :| Added implementation for all .v files below this top
//   Digital Logic ECEN 2350 Spring Semester
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

`define ENABLE_ADC_CLOCK
`define ENABLE_CLOCK1
`define ENABLE_CLOCK2
`define ENABLE_SDRAM
`define ENABLE_HEX0
`define ENABLE_HEX1
`define ENABLE_HEX2
`define ENABLE_HEX3
`define ENABLE_HEX4
`define ENABLE_HEX5
`define ENABLE_KEY
`define ENABLE_LED
`define ENABLE_SW
`define ENABLE_VGA
`define ENABLE_ACCELEROMETER
`define ENABLE_ARDUINO
`define ENABLE_GPIO

module DE10_LITE_Golden_Top(

	//////////// ADC CLOCK: 3.3-V LVTTL //////////
`ifdef ENABLE_ADC_CLOCK
	input 		          		ADC_CLK_10,
`endif
	//////////// CLOCK 1: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK1
	input 		          		MAX10_CLK1_50,
`endif
	//////////// CLOCK 2: 3.3-V LVTTL //////////
`ifdef ENABLE_CLOCK2
	input 		          		MAX10_CLK2_50,
`endif

	//////////// SDRAM: 3.3-V LVTTL //////////
`ifdef ENABLE_SDRAM
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
`endif

	//////////// SEG7: 3.3-V LVTTL //////////
`ifdef ENABLE_HEX0
	output		     [7:0]		HEX0,
`endif
`ifdef ENABLE_HEX1
	output		     [7:0]		HEX1,
`endif
`ifdef ENABLE_HEX2
	output		     [7:0]		HEX2,
`endif
`ifdef ENABLE_HEX3
	output		     [7:0]		HEX3,
`endif
`ifdef ENABLE_HEX4
	output		     [7:0]		HEX4,
`endif
`ifdef ENABLE_HEX5
	output		     [7:0]		HEX5,
`endif

	//////////// KEY: 3.3 V SCHMITT TRIGGER //////////
`ifdef ENABLE_KEY
	input 		     [1:0]		KEY,
`endif

	//////////// LED: 3.3-V LVTTL //////////
`ifdef ENABLE_LED
	output		     [9:0]		LEDR,
`endif

	//////////// SW: 3.3-V LVTTL //////////
`ifdef ENABLE_SW
	input 		     [9:0]		SW,
`endif

	//////////// VGA: 3.3-V LVTTL //////////
`ifdef ENABLE_VGA
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,
`endif

	//////////// Accelerometer: 3.3-V LVTTL //////////
`ifdef ENABLE_ACCELEROMETER
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,
`endif

	//////////// Arduino: 3.3-V LVTTL //////////
`ifdef ENABLE_ARDUINO
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
`endif

	//////////// GPIO, GPIO connect to GPIO Default: 3.3-V LVTTL //////////
`ifdef ENABLE_GPIO
	inout 		    [35:0]		GPIO
`endif
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
//registers for the mode control going into the multiplexer
reg [1:0] buttoncount;
reg [1:0] switchstate;
reg [3:0] modecontrol;

// wires for the outputs of various modules
wire[7:0] muxout;
wire [7:0] sumout,diffout,productout,quotientout,orout,andout,xorout,notout,greaterout,lessthanout,equalout,maxout,signedaddout, signedsubout;
wire [9:0] knightrider;

// wires for the specific representations
wire decin;
wire addercarry;
wire subtractorborrow;
wire multiplycarry;
wire divideremainder;
wire leftover;
wire multiplydecpoint;
wire dividedecpoint;

//=======================================================
//  Structural coding
//=======================================================

// assigns key[0] to either be 1 or 0
always @(posedge KEY[0]) begin
	modecontrol[3] = modecontrol[3]^1;
	end

//assigns key[1] to either be a 1 or 0
always @(posedge KEY[1]) begin 
	modecontrol[2] = modecontrol[2]^1;
	end

//assigns the two switches to either be 1 or 0
always @(SW[8],SW[9]) begin
	switchstate = SW[9:8];
	modecontrol[1:0] = switchstate;
	end

//initialization of our unsigned adder/subtractor
unsignedripplecarryadder a1(SW[7:4],SW[3:0],sumout[3:0],addercarry);
unsignedsubtractor s1(SW[7:4],SW[3:0],diffout[3:0],subtractorborrow);

//initialization of our arithmetic modules
multiplyby2 m1(SW[7:0],productout,multiplycarry);
divideby2 d1(SW[7:0],quotientout,divideremainder);
signedadder sa1(SW[7:4],SW[3:0],signedaddout);
signedsubtractor ss1(SW[7:4],SW[3:0],signedsubout);

//initialization of our logical modules
aAND and1(SW[7:4],SW[3:0],andout[3:0]);
oOR o1(SW[7:4],SW[3:0],orout[3:0]);
EXOR x1(SW[7:4],SW[3:0],xorout[3:0]);
nNOT n1(SW[7:0],notout);

//initialization of our comparison modules
equal e1(SW[7:4],SW[3:0],equalout[0]);
greater g1(SW[7:4],SW[3:0],greaterout[0]);
lessthan l1(SW[7:4],SW[3:0],lessthanout[0]);
max max1(SW[7:4],SW[3:0],maxout[3:0]);

//initialization of our knightrider module
knightrider kr1(ADC_CLK_10,knightrider,SW[7:4],SW[3:0]);

//tieing everything together into the multiplexer module
multip(sumout,addercarry,diffout,subtractorborrow,productout,multiplycarry,quotientout,divideremainder,andout,orout,xorout,notout,equalout,greaterout,lessthanout,maxout,knightrider,signedaddout,signedsubout,muxout,modecontrol,LEDR[9:0],multiplydecpoint,dividedecpoint);

//Use of our sevensegment module to show the modecontrol, and the decimal points if need be
sevensegment(SW[7:4],decin,HEX5[6:0],HEX5[7]);
sevensegment(SW[3:0],decin,HEX4[6:0],HEX4[7]);
sevensegmodedisplay(modecontrol,HEX3[6:0],HEX2[6:0]);
sevensegment(muxout[3:0],dividedecpoint,HEX0[6:0],HEX0[7]);
sevensegment(muxout[7:4],multiplydecpoint,HEX1[6:0],HEX1[7]);
endmodule
