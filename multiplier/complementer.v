`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:17 01/30/2014 
// Design Name: 
// Module Name:    complementer 
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
module complementer(compIn, compOut);
	input [7:0] compIn;
	output reg [7:0] compOut;
	
	always@(compIn,compOut)
		begin
			compOut = ~compIn + 8'd1;
		end
		
endmodule
