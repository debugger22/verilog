`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:24 01/30/2014 
// Design Name: 
// Module Name:    testaddsub 
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
module testaddsub();
	// Inputs
	reg [7:0] input1;
	reg [7:0] input2;
	reg op;
	reg clk;
	reg reset;
	wire [7:0] result;
	wire ofFlag;
// Instantiate the Unit Under Test (UUT)
	addSub uut (
		.input1(input1),
		.input2(input2),
		.op(op),
		.clk(clk),
		.reset(reset),
		.result(result),
		.ofFlag(ofFlag)
	);

	always
		#5 clk = ~clk;
		initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		op = 0;
		clk = 0;
		reset = 1;
		clk = 0;
		// Wait 100 ns for global reset to finish
		#10;
		reset =0;
		op = 1; //operation addition
		input1=8'd8;
		input2=8'd2; //8 + 2
		#10
		input2=8'b1111_1110;//8 + (-2)
		#10
		input1=8'b1111_1000;
		input2=8'd2; //-8 + 2
		#10
		input2=8'b1111_1110; // -8 + -2
		#10
		op=0;
		input1=8'd8;
		input2=8'd2; //8 - 2
		#10
		input2=8'b1111_1110; // 8 - (-2)
		#10
		input1=8'b1111_1000;
		input2=8'd2; //-8 - (2)
		#10
		input1=8'b1111_1000;
		input2=8'b1111_1110; //-8 - (-2)
		#10
		op = 1 ;
		input1 = 8'd64;
		input2 = 8'd64; //64 + 64, overflow
		#10
		input1 = 8'b1000_0000;
		input2 = 8'b1000_0001; // -128 + (-127), overflow
		#10
		op = 0;
		input2 = 8'b1111_1110; //-128 - (-2)

		#10
		input1 = 8'b0111_1111;
		input2 = 8'b1111_1110; //127 - (-2), overflow
		#10
		$finish;
	end

endmodule
