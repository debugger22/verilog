`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:15 02/06/2014 
// Design Name: 
// Module Name:    mux16to1 
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
module mux16to1(
    input [15:0] outR0,
    input [15:0] outR1,
    input [15:0] outR2,
    input [15:0] outR3,
    input [15:0] outR4,
    input [15:0] outR5,
    input [15:0] outR6,
    input [15:0] outR7,
    input [15:0] outR8,
    input [15:0] outR9,
    input [15:0] outR10,
    input [15:0] outR11,
    input [15:0] outR12,
    input [15:0] outR13,
    input [15:0] outR14,
    input [15:0] outR15,
    input [3:0] se1,
    output reg [15:0] outBus
    );
		
	always @ (*)
		begin
		outBus = 0;
			case (se1)
				4'h0 : outBus = outR0;
				4'h1 : outBus = outR1;
				4'h2 : outBus = outR2;
				4'h3 : outBus = outR3;
				4'h4 : outBus = outR4;
				4'h5 : outBus = outR5;
				4'h6 : outBus = outR6;
				4'h7 : outBus = outR7;
				4'h8 : outBus = outR8;
				4'h9 : outBus = outR9;
				4'hA : outBus = outR10;
				4'hB : outBus = outR11;
				4'hC : outBus = outR12;
				4'hD : outBus = outR13;
				4'hE : outBus = outR14;
				4'hF : outBus = outR15;
			endcase
		end
	
endmodule
