`timescale 1ns / 1ps


module MUX_4_1( input in_0,
					 input in_1,
					 input in_2,
					 input in_3,
					 input [1:0]flag,
					 output reg out                
    );

always @ (*) begin
case (flag)
	2'b00 : out = in_0;
	2'b01 : out = in_1;
	2'b10 : out = in_2;
	2'b11 : out = in_3;
	default : out = 32'b00000000000000000000000000000000;

endcase
end


endmodule
