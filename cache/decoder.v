`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:50 03/06/2014 
// Design Name: 
// Module Name:    decoder 
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
module decoder(
    input [1:0] decIn,
    output reg [3:0] decOut
    );
	 
	 	always @ (decIn)
		begin
			case (decIn)
				2'h0 : decOut = 4'h1;
				2'h1 : decOut = 4'h2;
				2'h2 : decOut = 4'h4;
				2'h3 : decOut = 4'h8;
			endcase
		end


endmodule
