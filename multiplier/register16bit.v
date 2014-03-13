`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:14 02/06/2014 
// Design Name: 
// Module Name:    register16bit 
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
module register16bit(clk, reset, regWrite, decOut1b, writeData, outR);
	input clk;
	input reset;
	input regWrite;
	input decOut1b;
	input [15:0] writeData;
	input [15:0] outR;
	
	D_FF ff0 (clk,reset,regWrite,writeData[0],decOut1b,outR[0]);
	D_FF ff1 (clk,reset,regWrite,writeData[1],decOut1b,outR[1]);
	D_FF ff2 (clk,reset,regWrite,writeData[2],decOut1b,outR[2]);
	D_FF ff3 (clk,reset,regWrite,writeData[3],decOut1b,outR[3]);
	D_FF ff4 (clk,reset,regWrite,writeData[4],decOut1b,outR[4]);
	D_FF ff5 (clk,reset,regWrite,writeData[5],decOut1b,outR[5]);
	D_FF ff6 (clk,reset,regWrite,writeData[6],decOut1b,outR[6]);
	D_FF ff7 (clk,reset,regWrite,writeData[7],decOut1b,outR[7]);
	D_FF ff8 (clk,reset,regWrite,writeData[8],decOut1b,outR[8]);
	D_FF ff9 (clk,reset,regWrite,writeData[9],decOut1b,outR[9]);
	D_FF ff10 (clk,reset,regWrite,writeData[10],decOut1b,outR[10]);
	D_FF ff11 (clk,reset,regWrite,writeData[11],decOut1b,outR[11]);
	D_FF ff12 (clk,reset,regWrite,writeData[12],decOut1b,outR[12]);
	D_FF ff13 (clk,reset,regWrite,writeData[13],decOut1b,outR[13]);
	D_FF ff14 (clk,reset,regWrite,writeData[14],decOut1b,outR[14]);
	D_FF ff15 (clk,reset,regWrite,writeData[15],decOut1b,outR[15]);


endmodule
