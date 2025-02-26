`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2025 14:30:50
// Design Name: 
// Module Name: exp5dsd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exp5dsd(
    input logic A,               // MSB (Similar to num[3])
    input logic B,               // Equi. to num[2]
    input logic C,               // Equi. to num[1])
    input logic D,               // LSB (Equiv. to num[0])
    input logic [2:0] y,         // 3-bit in. to select one of the 8 displays
    output logic segments_a1,    // Seg. A
    output logic segments_b1,    // Seg. B
    output logic segments_c1,    // Seg. C
    output logic segments_d1,    // Seg. D
    output logic segments_e,     // Seg. E
    output logic segments_f,     // Seg. F
    output logic segments_g,     // Seg. G
    output logic [7:0] anodes    // Anode control signals
);

    // Segment control 
    assign segments_a1 = ((~A&B) & (~C&~D)) | 
                         ((~A&~B) & (~C&D)) | 
                         ((A&B) & (~C&D)) | 
                         ((A&~B) & (C&D));

    assign segments_b1 = ((~A&B) & (~C&D)) | 
                         ((A&C&D)) | 
                         ((A&B&~D)) | 
                         ((B&C&~D));

    assign segments_c1 = ((~A&~B&C&~D)) | 
                         ((A&B)&C) | 
                         ((A&B)&(~C&~D));

    assign segments_d1 = ((~A&B)&(~C&~D)) | 
                         ((~A&~B)&(~C&D)) | 
                         ((A&~B)&(C&~D)) | 
                         (B&C&D);

    assign segments_e = ((~A)&D) | 
                        ((~B & ~C)&D) |
                        ((~A&B)&(C));

    assign segments_f = ((A & B) & (~C&D)) | 
                        (~A&C&D) | 
                        (~A&~B&D) | 
                        (~A&(~B&C));

    assign segments_g = ((A&B)&(~C&~D)) | 
                        ((~A)&(C&D)) | 
                        ((~A)&(~B)&(~C));

    //  Choosing  Anode
    always_comb begin
        case(y)
            3'b000: anodes = 8'b1111_1110;
            3'b001: anodes = 8'b1111_1101;
            3'b010: anodes = 8'b1111_1011;
            3'b011: anodes = 8'b1111_0111;
            3'b100: anodes = 8'b1110_1111;
            3'b101: anodes = 8'b1101_1111;
            3'b110: anodes = 8'b1011_1111;
            3'b111: anodes = 8'b0111_1111;
            default: anodes = 8'b1111_1111; // Default to all off
        endcase
    end

endmodule
