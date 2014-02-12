`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:36 02/06/2014 
// Design Name: 
// Module Name:    registerFile 
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
module registerFile(
    input clk,
    input reset,
    input regWrite,
    input [3:0] srcRegA,
    input [3:0] srcRegB,
    input [3:0] destReg,
    input [15:0] writeData,
    output [15:0] outBusA,
    output [15:0] outBusB
    );
	 wire [15:0] dectoreg;	//decOut
	 wire [15:0] outR0;
	 wire [15:0] outR1;
	 wire [15:0] outR2;
	 wire [15:0] outR3;
	 wire [15:0] outR4;
	 wire [15:0] outR5;
	 wire [15:0] outR6;
	 wire [15:0] outR7;
	 wire [15:0] outR8;
	 wire [15:0] outR9;
	 wire [15:0] outR10;
	 wire [15:0] outR11;
	 wire [15:0] outR12;
	 wire [15:0] outR13;
	 wire [15:0] outR14;
	 wire [15:0] outR15;
	 
	decoder dec1(destReg,dectoreg);
	registerSet regS1(clk,reset,regWrite,dectoreg,writeData,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15);
	mux16to1 mux1(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,srcRegA,outBusA);
	mux16to1 mux2(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,srcRegB,outBusB);

endmodule
