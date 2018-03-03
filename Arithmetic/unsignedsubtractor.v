module unsignedsubtractor(x,y,d,bout);
	parameter size = 4;
	input [size-1:0] x;
	input [size-1:0] y;
	output [size-1:0] d;
	wire [size-1:0] boutbuf;
	output bout;
	fullsubtractor FS1(x[0],y[0],0,d[0],boutbuf[0]);
	genvar i;
	generate
	for(i = 1; i<size; i=i+1) begin: subtractors
			fullsubtractor FS(x[i],y[i],boutbuf[i-1],d[i],boutbuf[i]);
		end	
	endgenerate
	assign bout = boutbuf[size-1];
endmodule