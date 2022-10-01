`timescale 1ns / 1ps

// module_name = Program Counter

module ProgramCounter( input clk,
			  input reset,
			  input [31:0] next,
			  output reg [31:0] address
    );
	
always @(posedge clk) begin
	if (reset) begin
		address<=32'b00000000000000000000000000000000;
	end
	
	else begin
		address <= next;
   end
end
endmodule
