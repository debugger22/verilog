`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:21 03/13/2014 
// Design Name: 
// Module Name:    squareMatrix 
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
module squareMatrix(
    input clk,
    input reset,
    input [3:0] decout,
    output reg [3:0] squareMatrixOut
    );

	
	wire outputRow0[3:0];
	wire outputRow1[3:0];
	wire outputRow2[3:0];
	wire outputRow3[3:0];
	
	
	D_FF DFF00(clk, decout[0], decout[0] | reset, outputRow0[0]);
	D_FF DFF01(clk, decout[0], decout[1] | reset, outputRow0[1]);
	D_FF DFF02(clk, decout[0], decout[2] | reset, outputRow0[2]);
	D_FF DFF03(clk, decout[0], decout[3] | reset, outputRow0[3]);
	
	D_FF DFF10(clk, decout[1], decout[0] | reset, outputRow1[0]);
	D_FF DFF11(clk, decout[1], decout[1] | reset, outputRow1[1]);
	D_FF DFF12(clk, decout[1], decout[2] | reset, outputRow1[2]);
	D_FF DFF13(clk, decout[1], decout[3] | reset, outputRow1[3]);
	
	D_FF DFF20(clk, decout[2], decout[0] | reset, outputRow2[0]);
	D_FF DFF21(clk, decout[2], decout[1] | reset, outputRow2[1]);
	D_FF DFF22(clk, decout[2], decout[2] | reset, outputRow2[2]);
	D_FF DFF23(clk, decout[2], decout[3] | reset, outputRow2[3]);
	
	D_FF DFF30(clk, decout[3], decout[0] | reset, outputRow3[0]);
	D_FF DFF31(clk, decout[3], decout[1] | reset, outputRow3[1]);
	D_FF DFF32(clk, decout[3], decout[2] | reset, outputRow3[2]);
	D_FF DFF33(clk, decout[3], decout[3] | reset, outputRow3[3]);

	always@(clk)
	begin
		squareMatrixOut[0] = outputRow0[0] | outputRow0[1] | outputRow0[2] | outputRow0[3];
		squareMatrixOut[1] = outputRow1[0] | outputRow1[1] | outputRow1[2] | outputRow1[3];
		squareMatrixOut[2] = outputRow2[0] | outputRow2[1] | outputRow2[2] | outputRow2[3];
		squareMatrixOut[3] = outputRow3[0] | outputRow3[1] | outputRow3[2] | outputRow3[3];
	end
endmodule
