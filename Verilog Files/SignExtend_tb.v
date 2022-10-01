`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:38:39 11/08/2021
// Design Name:   signExtend
// Module Name:   D:/vv/KGP-RISC/signExtend_tb.v
// Project Name:  KGP-RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtend_tb;

	// Inputs
	reg [25:0] in;
	reg [1:0] extendType;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.in(in), 
		.extendType(extendType), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 26'b01100000000000010000101011;
		extendType = 2'b00;
      #100
		extendType = 2'b01;
		#100
		extendType = 2'b10;
		#100;
		in = 26'b10110101001000011011010111;
		extendType = 2'b00;
		#100
		extendType = 2'b01;
		#100
		extendType = 2'b10;
		#100
		extendType = 2'b00;
		
		

	end
      
endmodule

