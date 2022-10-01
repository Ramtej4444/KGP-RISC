`timescale 1ns / 1ps



module Branch( input carry,
					input zero,
					input sign,
					input [1:0] flag,
					input branch,
					input branchType,
					input brNotEq,
					output brType
					
    );



MUX_4_1 mux_flag(.flag(flag), .in_0(carry), .in_1(zero), .in_2(sign), .in_3(1'b0) , .out(flagOut));

xor b_xor ( eqType, brNotEq, flagOut);

and b_and ( brType_1, branch, eqType);

MUX_2_1_1bit mux_brType ( .res(branchType), .in_0(branch), .in_1(brType_1), .out(brType));

endmodule
