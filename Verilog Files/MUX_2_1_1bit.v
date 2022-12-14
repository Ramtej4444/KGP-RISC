`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    MUX_2_1_1bit
//////////////////////////////////////////////////////////////////////////////////
module MUX_2_1_1bit( input in_0,
							input in_1,
							input res,
							output out
										
    );

assign out = (res == 1'b0) ? in_0 : in_1;

endmodule
