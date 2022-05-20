`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2022 19:24:58
// Design Name: 
// Module Name: designs
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

module D_Latch(D,E,Q);
    input wire D;
    input wire E;

    output wire Q;
    
    
    wire nand2_out = ~(D&E);
    wire D_neg = ~(D&D);
    wire nand3_out = ~(D_neg&E);
    wire Q_neg = ~(nand3_out&Q);
    
    assign Q = ~(nand2_out&Q_neg);
    
endmodule

module D_Flip_Flop(D,CLK,Q,E);
    input wire D;
    input wire CLK;
    input wire E;
    
    output wire Q;

    wire dff_connection;
    wire ff_input = ~E&Q | E&D;
    
    D_Latch d_latch1(ff_input, ~CLK, dff_connection);
    D_Latch d_latch2(dff_connection,~(~CLK), Q);

endmodule

module MUX2_1_8bit(S0,S1,O,S);
    input wire [7:0] S0;
    input wire [7:0] S1;
    input wire S;
    
    output wire [7:0] O;
    
    assign O[0] = (S0[0]&(~S)) | (S1[0]&S);
    assign O[1] = (S0[1]&(~S)) | (S1[1]&S);
    assign O[2] = (S0[2]&(~S)) | (S1[2]&S);
    assign O[3] = (S0[3]&(~S)) | (S1[3]&S);
    assign O[4] = (S0[4]&(~S)) | (S1[4]&S);
    assign O[5] = (S0[5]&(~S)) | (S1[5]&S);
    assign O[6] = (S0[6]&(~S)) | (S1[6]&S);
    assign O[7] = (S0[7]&(~S)) | (S1[7]&S);
    
endmodule
        
module MUX2_1_16bit(S0,S1,O,S);
    input wire [15:0] S0;
    input wire [15:0] S1;
    input wire S;
    
    output wire [15:0] O;
    
    assign O[0] = (S0[0]&(~S)) | (S1[0]&S);
    assign O[1] = (S0[1]&(~S)) | (S1[1]&S);
    assign O[2] = (S0[2]&(~S)) | (S1[2]&S);
    assign O[3] = (S0[3]&(~S)) | (S1[3]&S);
    assign O[4] = (S0[4]&(~S)) | (S1[4]&S);
    assign O[5] = (S0[5]&(~S)) | (S1[5]&S);
    assign O[6] = (S0[6]&(~S)) | (S1[6]&S);
    assign O[7] = (S0[7]&(~S)) | (S1[7]&S);
    assign O[8] = (S0[8]&(~S)) | (S1[8]&S);
    assign O[9] = (S0[9]&(~S)) | (S1[9]&S);
    assign O[10] = (S0[10]&(~S)) | (S1[10]&S);
    assign O[11] = (S0[11]&(~S)) | (S1[11]&S);
    assign O[12] = (S0[12]&(~S)) | (S1[12]&S);
    assign O[13] = (S0[13]&(~S)) | (S1[13]&S);
    assign O[14] = (S0[14]&(~S)) | (S1[14]&S);
    assign O[15] = (S0[15]&(~S)) | (S1[15]&S);
    
endmodule

module Full_Adder_1bit(A,B,Cin,O,Cout);
    input wire A;
    input wire B;
    input wire Cin;
    
    output wire O;
    output wire Cout;

    assign O = Cin&~B&~A | ~Cin&B&~A | Cin&B&A | ~Cin&~B&A; 
    assign Cout = A&B | A&Cin | B&Cin;
    
endmodule

module Adder_Substractor_8bit(A,B,Cin,O,Cout);
    input wire [7:0] A;
    input wire [7:0] B;
    input wire Cin;
    
    output wire [7:0] O;
    output wire Cout;
    
    wire B0 = Cin&~B[0] | ~Cin&B[0];
    wire B1 = Cin&~B[1] | ~Cin&B[1];
    wire B2 = Cin&~B[2] | ~Cin&B[2];
    wire B3 = Cin&~B[3] | ~Cin&B[3];
    wire B4 = Cin&~B[4] | ~Cin&B[4];
    wire B5 = Cin&~B[5] | ~Cin&B[5];
    wire B6 = Cin&~B[6] | ~Cin&B[6];
    wire B7 = Cin&~B[7] | ~Cin&B[7];
    
    wire Cout0, Cout1, Cout2, Cout3, Cout4, Cout5, Cout6;
    
    Full_Adder_1bit adder0(A[0],B[0],Cin,O[0],Cout0);
    Full_Adder_1bit adder1(A[1],B[1],Cout0,O[1],Cout1);
    Full_Adder_1bit adder2(A[2],B[2],Cout1,O[2],Cout2);
    Full_Adder_1bit adder3(A[3],B[3],Cout2,O[3],Cout3);
    Full_Adder_1bit adder4(A[4],B[4],Cout3,O[4],Cout4);
    Full_Adder_1bit adder5(A[5],B[5],Cout4,O[5],Cout5);
    Full_Adder_1bit adder6(A[6],B[6],Cout5,O[6],Cout6);
    Full_Adder_1bit adder7(A[7],B[7],Cout6,O[7],Cout);
    
endmodule

module Adder_Substractor_16bit(A,B,Cin,O,Cout);
    input wire [15:0] A;
    input wire [15:0] B;
    input wire Cin;
    
    output wire [15:0] O;
    output wire Cout;
    
    wire cout0;
    
    Adder_Substractor_8bit as0(A[7:0],B[7:0],Cin,O[7:0],cout0);
    Adder_Substractor_8bit as1(A[15:8],B[15:8],cout0,O[15:8],Cout);
endmodule

module PART1_8bit(E,FunSel,I,Q,CLK);
    input wire E;
    input wire [1:0] FunSel;
    input wire [7:0] I;
    input wire CLK;
    
    output wire [7:0] Q;
    
    //Mux if S=0, output is 0, if S=1, output is I
    //Also mean, S=0 is for clear, S=1 is for load
    wire [7:0] I_funsel_mux;
    MUX2_1_8bit mux0(I,8'b0,I_funsel_mux,FunSel[0]);
    
    //Mux if S=0, output is binary 1, if S=1, output is complement of it
    //S is cin for adder/substractor, so if S=1 is A-B(A+B+1), if S=0 A+B will be performed
    wire [7:0] add_subst_Bin;
    MUX2_1_8bit mux1(8'b1,~(8'b1),add_subst_Bin,~FunSel[0]);
    
    //If Cin is 1, it will decrement Q by one, if it is 0, it will increment Q by one
    wire [7:0] adder_subst_output;
    wire adder_subst_cout;
    Adder_Substractor_8bit adder_substractor(Q,add_subst_Bin,~FunSel[0],adder_subst_output,adder_subst_cout);

    //If the first bit of funsel is 1, register will be loaded or reseted
    //If the first bit of funsel is 0, register will be decremented or incremented by one
    //This mux will send proper inputs to D flip flops for these operations
    wire [7:0] D;
    MUX2_1_8bit mux2(adder_subst_output,I_funsel_mux,D,FunSel[1]);
    
    //Synchronized D flip flops
    D_Flip_Flop dff0(D[0],CLK,Q[0],E);
    D_Flip_Flop dff1(D[1],CLK,Q[1],E);
    D_Flip_Flop dff2(D[2],CLK,Q[2],E);
    D_Flip_Flop dff3(D[3],CLK,Q[3],E);
    D_Flip_Flop dff4(D[4],CLK,Q[4],E);
    D_Flip_Flop dff5(D[5],CLK,Q[5],E);
    D_Flip_Flop dff6(D[6],CLK,Q[6],E);
    D_Flip_Flop dff7(D[7],CLK,Q[7],E);    

endmodule

module PART1_16bit(E,FunSel,I,Q,CLK);
    input wire E;
    input wire [1:0] FunSel;
    input wire [15:0] I;
    input wire CLK;
    
    output wire [15:0] Q;
    
    //Mux if S=0, output is 0, if S=1, output is I
    //Also mean, S=0 is for clear, S=1 is for load
    wire [15:0] I_funsel_mux;
    MUX2_1_16bit mux0(I,16'b0,I_funsel_mux,FunSel[0]);
    
    //Mux if S=0, output is binary 1, if S=1, output is complement of it
    //S is cin for adder/substractor, so if S=1 is A-B(A+B+1), if S=0 A+B will be performed
    wire [15:0] add_subst_Bin;
    MUX2_1_16bit mux1(16'b1,~(16'b1),add_subst_Bin,~FunSel[0]);
    
    //If Cin is 1, it will decrement Q by one, if it is 0, it will increment Q by one
    wire [15:0] adder_subst_output;
    wire adder_subst_cout;
    Adder_Substractor_16bit adder_substractor(Q,add_subst_Bin,~FunSel[0],adder_subst_output,adder_subst_cout);

    //If the first bit of funsel is 1, register will be loaded or reseted
    //If the first bit of funsel is 0, register will be decremented or incremented by one
    //This mux will send proper inputs to D flip flops for these operations
    wire [15:0] D;
    MUX2_1_16bit mux2(adder_subst_output,I_funsel_mux,D,FunSel[1]);
    
    //Synchronized D flip flops
    D_Flip_Flop dff0(D[0],CLK,Q[0],E);
    D_Flip_Flop dff1(D[1],CLK,Q[1],E);
    D_Flip_Flop dff2(D[2],CLK,Q[2],E);
    D_Flip_Flop dff3(D[3],CLK,Q[3],E);
    D_Flip_Flop dff4(D[4],CLK,Q[4],E);
    D_Flip_Flop dff5(D[5],CLK,Q[5],E);
    D_Flip_Flop dff6(D[6],CLK,Q[6],E);
    D_Flip_Flop dff7(D[7],CLK,Q[7],E);    
    D_Flip_Flop dff8(D[8],CLK,Q[8],E);
    D_Flip_Flop dff9(D[9],CLK,Q[9],E);
    D_Flip_Flop dff10(D[10],CLK,Q[10],E);
    D_Flip_Flop dff11(D[11],CLK,Q[11],E);
    D_Flip_Flop dff12(D[12],CLK,Q[12],E);
    D_Flip_Flop dff13(D[13],CLK,Q[13],E);
    D_Flip_Flop dff14(D[14],CLK,Q[14],E);
    D_Flip_Flop dff15(D[15],CLK,Q[15],E);   
    
endmodule

        

