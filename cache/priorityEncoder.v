`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:00 03/13/2014 
// Design Name: 
// Module Name:    priorityEncoder 
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
module priorityEncoder(
    input [3:0] squareMatrixOut,
    input reset,
    output reg [1:0] lruLine
    );
	 
	always @ (squareMatrixOut)
	begin
		if(reset==0)
		begin
			if(squareMatrixOut[0]==0) lruLine = 2'b00;
			else if(squareMatrixOut[1]==0) lruLine = 2'b01;
			else if(squareMatrixOut[2]==0) lruLine = 2'b10;
			else if(squareMatrixOut[3]==0) lruLine = 2'b11;
		end
		else
		begin
			lruLine = 2'd0;
		end
	end


endmodule
