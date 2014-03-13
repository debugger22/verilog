`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:26 01/23/2014 
// Design Name: 
// Module Name:    testbench 
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
module addSub(input1, input2, op, clk, reset, result, ofFlag);
	// Inputs	
	input [7:0] input1;
	input [7:0] input2;
	input op;
	input clk;
	input reset;
	output wire  [7:0] result;
   output wire ofFlag;
	
	wire [7:0] op1;
	wire [7:0] op2;
	wire [7:0] compIn;
	wire [7:0] compOut;
	
	reg8bit r1(clk, reset, input1, op1);
	reg8bit r2(clk, reset, input2, compIn);
	complementer comp(compIn,compOut);
	multiplexer mux(compIn, compOut, op, op2);
	adder add1(op1, op2, result, ofFlag);
	
	
endmodule
