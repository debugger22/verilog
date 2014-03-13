`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:38 03/06/2014 
// Design Name: 
// Module Name:    mux2to1 
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
module mux2to1(
    input [1:0] lineIndex,
    input [1:0] lruLine,
    input hit,
    output reg [1:0] cacheLine
    );
	
	always@(lineIndex,lruLine,hit)
		begin 
			case(hit)
				1'b0: cacheLine = lruLine;
				1'b1: cacheLine = lineIndex;
			endcase
		end
	
	
endmodule
