`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:24 03/06/2014 
// Design Name: 
// Module Name:    counterReg2b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counterReg2b(
    input clk,
    input reset,
    input load,
    input dcr,
    output [1:0] cnt
    );
	reg [1:0] mInput;
	
	always@(posedge clk)
		begin
			if(reset) mInput = 0;
			else if(load) mInput = 2'd3;
			
		end
		
	always@(negedge clk)
		begin
				if(dcr) mInput = mInput - 2'd1;
		end
	
	/*
	always@(*)
	begin
		if(reset) mInput = 0;
		else if(load) mInput = 2'd3;
		else if(dcr) mInput = mInput - 2'd1;
	end
	*/
	D_FF msb(mInput[1],cnt[1]);
	D_FF lsb(mInput[0],cnt[0]);

endmodule
