`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Design Name:   Processor
// Module Name:   D:/RISC/KGP-RISC/Processor_tb.v
// Project Name:  KGP-RISC
// Verilog Test Fixture created by ISE for module: Processor
////////////////////////////////////////////////////////////////////////////////

module Processor_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	Processor uut (
		.clk(clk), 
		.reset(reset), 
		.result(result)
	);
	
   initial begin
	clk = 0;
		forever begin
			#10 clk = ~clk;
		end
	end
	
	initial begin
		// Initialize Inputs
		
		reset = 1;

		#20;
      reset = 0;

	end
      
endmodule

