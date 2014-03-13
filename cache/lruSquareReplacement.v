`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:44 03/13/2014 
// Design Name: 
// Module Name:    lruSquareReplacement 
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
module lruSquareReplacement(
    input clk,
    input reset,
    input hit,
    input [1:0] lineIndex,
    output [1:0] lruLine
    );

	wire [1:0] muxtodec;
	wire [3:0] dectosquaremat;
	wire [3:0] squaremattopdec;
	
	mux2to1 mux(lineIndex, lruLine, hit, muxtodec);
	decoder dec(muxtodec, dectosquaremat);
	squareMatrix sqmat(clk, reset, dectosquaremat, squaremattopdec);
	priorityEncoder penc(squaremattopdec, reset, lruLine);
	
endmodule
