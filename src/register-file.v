//Register File de 32 registros de 32 bits y 2 puertos de salida.

//Escrito por: Victor Hernandez (802-19-4188)

module RegisterFile (output [31:0] PA, PB, input [31:0] PW,  input [4:0] RW, RA, RB, input LE, Clk,clr);
    //Outputs: Puertos A y B
    //Inputs: Puerto de Entrada (PW), RW (Write Register) y LE (BinaryDecoder Selector y "load"), 
    //RA, RB y RD  (Selectors de multiplexers a la salida), y Clk (Clock)

    //Wires
    wire [31:0] E;
    wire [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, 
    Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;

    //Instanciando módulos:

    //Binary Decoder for RA,RB
    binaryDecoder bdecoder (E, RW, LE);

    //Los multiplexers a continuacion cogen valor almacenado en el registro 
    //correspondiente y lo envian a las salidas de los registros:

    //Multiplexer for PA register
    mux_32x1_32bit mux_32x1A (PA, RA, 32'b0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9,
                    Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, 
                    Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31);
    //Multiplexer for PB register
    mux_32x1_32bit mux_32x1B (PB, RB, 32'b0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9,
                    Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, 
                    Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31);             
   
    //Instanciando registros del 0 al 31
    register_32bit R0 (Q0, PW, Clk, E[0],clr);
    register_32bit R1 (Q1, PW, Clk, E[1],clr);
    register_32bit R2 (Q2, PW, Clk, E[2],clr);
    register_32bit R3 (Q3, PW, Clk, E[3],clr);
    register_32bit R4 (Q4, PW, Clk, E[4],clr);
    register_32bit R5 (Q5, PW, Clk, 1'b1,clr);
    register_32bit R6 (Q6, PW, Clk, 1'b1,clr);
    register_32bit R7 (Q7, PW, Clk, E[7],clr);
    register_32bit R8 (Q8, PW, Clk, E[8],clr);
    register_32bit R9 (Q9, PW, Clk, E[9],clr);
    register_32bit R10 (Q10, PW, Clk, E[10],clr);
    register_32bit R11 (Q11, PW, Clk, E[11],clr);
    register_32bit R12 (Q12, PW, Clk, E[12],clr);
    register_32bit R13 (Q13, PW, Clk, E[13],clr);
    register_32bit R14 (Q14, PW, Clk, E[14],clr);
    register_32bit R15 (Q15, PW, Clk, E[15],clr);
    register_32bit R16 (Q16, PW, Clk, 1'b1,clr);
    register_32bit R17 (Q17, PW, Clk, 1'b1,clr);
    register_32bit R18 (Q18, PW, Clk, 1'b1,clr);
    register_32bit R19 (Q19, PW, Clk, E[19],clr);
    register_32bit R20 (Q20, PW, Clk, E[20],clr);
    register_32bit R21 (Q21, PW, Clk, E[21],clr);
    register_32bit R22 (Q22, PW, Clk, E[22],clr);
    register_32bit R23 (Q23, PW, Clk, E[23],clr);
    register_32bit R24 (Q24, PW, Clk, E[24],clr);
    register_32bit R25 (Q25, PW, Clk, E[25],clr);
    register_32bit R26 (Q26, PW, Clk, E[26],clr);
    register_32bit R27 (Q27, PW, Clk, E[27],clr);
    register_32bit R28 (Q28, PW, Clk, E[28],clr);
    register_32bit R29 (Q29, PW, Clk, E[29],clr);
    register_32bit R30 (Q30, PW, Clk, E[30],clr);
    register_32bit R31 (Q31, PW, Clk, 1'b1,clr);

endmodule



module mux_32x1_32bit (output reg [31:0] Y, input [4:0] S, 
input [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15,
R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31);
    
    always @ (*)
        begin
            case (S)
            5'b00000: Y = R0;
            5'b00001: Y = R1;
            5'b00010: Y = R2;
            5'b00011: Y = R3;
            5'b00100: Y = R4;
            5'b00101: Y = R5;
            5'b00110: Y = R6;
            5'b00111: Y = R7;
            5'b01000: Y = R8;
            5'b01001: Y = R9;
            5'b01010: Y = R10;
            5'b01011: Y = R11;
            5'b01100: Y = R12;
            5'b01101: Y = R13;
            5'b01110: Y = R14;
            5'b01111: Y = R15;
            5'b10000: Y = R16;
            5'b10001: Y = R17;
            5'b10010: Y = R18;
            5'b10011: Y = R19;
            5'b10100: Y = R20;
            5'b10101: Y = R21;
            5'b10110: Y = R22;
            5'b10111: Y = R23;
            5'b11000: Y = R24;
            5'b11001: Y = R25;
            5'b11010: Y = R26;
            5'b11011: Y = R27;
            5'b11100: Y = R28;
            5'b11101: Y = R29;
            5'b11110: Y = R30;
            5'b11111: Y = R31;
            endcase
    end
endmodule

module HiRegister (
    input clk,
    input HiEnable, 
    input [31:0] PW, 
    output reg [31:0] HiSignal
);

    // Update HiSignal with PW on the rising edge of clk if HiEnable is high
    always @(posedge clk) begin
        if (HiEnable) begin
            HiSignal <= PW;
        end
    end

endmodule

module LoRegister (
    input clk,
    input LoEnable, 
    input [31:0] PW, 
    output reg [31:0] LoSignal
);

    // Update LoSignal with PW on the rising edge of clk if LoEnable is high
    always @(posedge clk) begin
        if (LoEnable) begin
            LoSignal <= PW;
        end
    end

endmodule


//BINARY DECODER - C is a 5bit input and RF is a 1bit input.
//E is a 32bit output and a function of C and RF. 

module binaryDecoder (output reg [31:0] E, input [4:0] C, input RF);
    always @ (*) begin
        if (RF == 1'b1) 
          begin
              case (C)
              5'b00000: E = 32'b00000000000000000000000000000001;
              5'b00001: E = 32'b00000000000000000000000000000010;
              5'b00010: E = 32'b00000000000000000000000000000100;
              5'b00011: E = 32'b00000000000000000000000000001000;
              5'b00100: E = 32'b00000000000000000000000000010000;
              5'b00101: E = 32'b00000000000000000000000000100000;
              5'b00110: E = 32'b00000000000000000000000001000000;
              5'b00111: E = 32'b00000000000000000000000010000000;
              5'b01000: E = 32'b00000000000000000000000100000000;
              5'b01001: E = 32'b00000000000000000000001000000000;
              5'b01010: E = 32'b00000000000000000000010000000000;
              5'b01011: E = 32'b00000000000000000000100000000000;
              5'b01100: E = 32'b00000000000000000001000000000000;
              5'b01101: E = 32'b00000000000000000010000000000000;
              5'b01110: E = 32'b00000000000000000100000000000000;
              5'b01111: E = 32'b00000000000000001000000000000000;
              5'b10000: E = 32'b00000000000000010000000000000000;
              5'b10001: E = 32'b00000000000000100000000000000000;
              5'b10010: E = 32'b00000000000001000000000000000000;
              5'b10011: E = 32'b00000000000010000000000000000000;
              5'b10100: E = 32'b00000000000100000000000000000000;
              5'b10101: E = 32'b00000000001000000000000000000000;
              5'b10110: E = 32'b00000000010000000000000000000000;
              5'b10111: E = 32'b00000000100000000000000000000000;
              5'b11000: E = 32'b00000001000000000000000000000000;
              5'b11001: E = 32'b00000010000000000000000000000000;
              5'b11010: E = 32'b00000100000000000000000000000000;
              5'b11011: E = 32'b00001000000000000000000000000000;
              5'b11100: E = 32'b00010000000000000000000000000000;
              5'b11101: E = 32'b00100000000000000000000000000000;
              5'b11110: E = 32'b01000000000000000000000000000000;
              5'b11111: E = 32'b10000000000000000000000000000000;
              endcase
          end
        else 
          E = 32'b00000000000000000000000000000000;
    end
endmodule

module register_32bit (output reg [31:0] Q, input [31:0] D, input Clk, Ld,rst);
    always @ (posedge Clk)
    if(rst)
    Q<=32'd0;
    else
        if(Ld) Q <= D;
endmodule
