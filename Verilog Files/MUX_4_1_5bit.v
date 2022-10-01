`timescale 1ns / 1ps

module MUX_4_1_5bit( input [4:0] in_0,
					 input [4:0] in_1,
					 input [4:0] in_2,
					 input [4:0] in_3,
					 input [1:0] flag,
					 output reg [4:0] out
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
