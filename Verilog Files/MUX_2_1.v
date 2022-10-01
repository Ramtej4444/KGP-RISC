`timescale 1ns / 1ps



module MUX_2_1( input [31:0] in_0, 
					 input [31:0] in_1,
					 input res,
					 output [31:0] out
    );

assign out = (res==1'b0) ? in_0 : in_1;

endmodule
