`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:59 03/06/2014 
// Design Name: 
// Module Name:    mux4to1 
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
module mux4to1(
    input [1:0] cnt0,
    input [1:0] cnt1,
    input [1:0] cnt2,
    input [1:0] cnt3,
    input [1:0] cacheLine,
    output reg [1:0] refCnt
    );

	always@(cnt0,cnt1, cnt2,cnt3,cacheLine)
		begin 
			case(cacheLine)
				2'd0: refCnt = cnt0;
				2'd1: refCnt = cnt1;
				2'd2: refCnt = cnt2;
				2'd3: refCnt = cnt3;
			endcase
		end

endmodule
