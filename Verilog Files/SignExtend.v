`timescale 1ns / 1ps

// module_name = SignExtend 

module SignExtend( input [25:0] in,
						 input [1:0] extendType,
						 output reg [31:0] out
    );

always @(*) begin
	case(extendType)
		2'b00 : out =(in[15]==1'b1) ? {16'b1111111111111111, in[15:0]} : {16'b0000000000000000, in[15:0]};
		
		2'b01 : out =(in[20]==1'b1) ?  { 11'b11111111111, in[20:0] } : { 11'b00000000000, in[20:0] } ;  
		
		2'b10 : out = (in[25]==1'b1) ? {6'b111111 ,  in[25:0] } : {6'b000000 ,  in[25:0] };
		
		default : out = 32'b00000000000000000000000000000000;
	endcase
end

endmodule
