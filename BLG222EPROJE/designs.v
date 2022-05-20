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

module MUX2_1_4bit(S0,S1,O,S);
    input wire [3:0] S0;
    input wire [3:0] S1;
    input wire S;
    
    output wire [3:0] O;
    
    assign O[0] = (S0[0]&(~S)) | (S1[0]&S);
    assign O[1] = (S0[1]&(~S)) | (S1[1]&S);
    assign O[2] = (S0[2]&(~S)) | (S1[2]&S);
    assign O[3] = (S0[3]&(~S)) | (S1[3]&S);
    
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

module MUX4_1_8bit(S0,S1,S2,S3,O,S);
    input wire [7:0] S0;
    input wire [7:0] S1;
    input wire [7:0] S2;
    input wire [7:0] S3;
    input wire [1:0]S;
    
    output wire [7:0] O;
    
    assign O[0] = (S0[0]&(~S[0]&~S[1])) | (S1[0]&(S[0]&~S[1])) | (S2[0]&(~S[0]&S[1])) | (S3[0]&(S[0]&S[1]));
    assign O[1] = (S0[1]&(~S[0]&~S[1])) | (S1[1]&(S[0]&~S[1])) | (S2[1]&(~S[0]&S[1])) | (S3[1]&(S[0]&S[1]));
    assign O[2] = (S0[2]&(~S[0]&~S[1])) | (S1[2]&(S[0]&~S[1])) | (S2[2]&(~S[0]&S[1])) | (S3[2]&(S[0]&S[1]));
    assign O[3] = (S0[3]&(~S[0]&~S[1])) | (S1[3]&(S[0]&~S[1])) | (S2[3]&(~S[0]&S[1])) | (S3[3]&(S[0]&S[1]));
    assign O[4] = (S0[4]&(~S[0]&~S[1])) | (S1[4]&(S[0]&~S[1])) | (S2[4]&(~S[0]&S[1])) | (S3[4]&(S[0]&S[1]));
    assign O[5] = (S0[5]&(~S[0]&~S[1])) | (S1[5]&(S[0]&~S[1])) | (S2[5]&(~S[0]&S[1])) | (S3[5]&(S[0]&S[1]));
    assign O[6] = (S0[6]&(~S[0]&~S[1])) | (S1[6]&(S[0]&~S[1])) | (S2[6]&(~S[0]&S[1])) | (S3[6]&(S[0]&S[1]));
    assign O[7] = (S0[7]&(~S[0]&~S[1])) | (S1[7]&(S[0]&~S[1])) | (S2[7]&(~S[0]&S[1])) | (S3[7]&(S[0]&S[1]));
    
endmodule

module MUX16_4_8bit(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,O,S);
    input wire [7:0] S0;
    input wire [7:0] S1;
    input wire [7:0] S2;
    input wire [7:0] S3;
    input wire [7:0] S4;
    input wire [7:0] S5;
    input wire [7:0] S6;
    input wire [7:0] S7;
    input wire [7:0] S8;
    input wire [7:0] S9;
    input wire [7:0] S10;
    input wire [7:0] S11;   
    input wire [7:0] S12;
    input wire [7:0] S13;
    input wire [7:0] S14;
    input wire [7:0] S15;
    input wire [3:0] S;
    
    wire [7:0] first;
    wire [7:0] second;
    wire [7:0] third;
    wire [7:0] fourth;
    
    MUX4_1_8bit m1(S0,S1,S2,S3,first,S[1:0]);
    MUX4_1_8bit m2(S4,S5,S6,S7,second,S[1:0]);
    MUX4_1_8bit m3(S8,S9,S10,S11,third,S[1:0]);
    MUX4_1_8bit m4(S12,S13,S14,S15,fourth,S[1:0]);
    
    output wire [7:0] O;
    
    MUX4_1_8bit final(first,second,third,fourth,O,S[3:2]);
    
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

module MUX2_1_1bit(S0,S1,O,S);
    input S0;
    input S1;
    output O;
    input S;
    
    assign O = S0&~S | S1&S; 
endmodule

module Full_Adder_1bit(A,B,Cin,O,Cout);
    input wire A;
    input wire B;
    input wire Cin;
    
    output wire O;
    output wire Cout;
    
    wire controlled_Cout = A&B | A&Cin | B&Cin;
    
    assign O = Cin===1'bX ? 1'b0 : Cin&~B&~A | ~Cin&B&~A | Cin&B&A | ~Cin&~B&A; 
    assign Cout = controlled_Cout===1'bX ? 1'b0 : controlled_Cout;
    
endmodule

module Adder_Substractor_4bit(A,B,Cin,O,Cout);
    input wire [3:0] A;
    input wire [3:0] B;
    input wire Cin;
    
    output wire [3:0] O;
    output wire Cout;
    
    wire B0 = Cin&~B[0] | ~Cin&B[0];
    wire B1 = Cin&~B[1] | ~Cin&B[1];
    wire B2 = Cin&~B[2] | ~Cin&B[2];
    wire B3 = Cin&~B[3] | ~Cin&B[3];
    
    wire Cout0, Cout1, Cout2;
    
    Full_Adder_1bit adder0(A[0],B[0],Cin,O[0],Cout0);
    Full_Adder_1bit adder1(A[1],B[1],Cout0,O[1],Cout1);
    Full_Adder_1bit adder2(A[2],B[2],Cout1,O[2],Cout2);
    Full_Adder_1bit adder3(A[3],B[3],Cout2,O[3],Cout);
    
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

module ZCNO_register(E,FunSel,I,Q,CLK);
    input wire E;
    input wire [1:0] FunSel;
    input wire [3:0] I;
    input wire CLK;
    
    output wire [3:0] Q;
    
    //Mux if S=0, output is 0, if S=1, output is I
    //Also mean, S=0 is for clear, S=1 is for load
    wire [3:0] I_funsel_mux;
    MUX2_1_4bit mux0(I,4'b0,I_funsel_mux,FunSel[0]);
    
    //Mux if S=0, output is binary 1, if S=1, output is complement of it
    //S is cin for adder/substractor, so if S=1 is A-B(A+B+1), if S=0 A+B will be performed
    wire [3:0] add_subst_Bin;
    MUX2_1_4bit mux1(4'b1,~(4'b1),add_subst_Bin,~FunSel[0]);
    
    //If Cin is 1, it will decrement Q by one, if it is 0, it will increment Q by one
    wire [3:0] adder_subst_output;
    wire adder_subst_cout;
    Adder_Substractor_4bit adder_substractor(Q,add_subst_Bin,~FunSel[0],adder_subst_output,adder_subst_cout);

    //If the first bit of funsel is 1, register will be loaded or reseted
    //If the first bit of funsel is 0, register will be decremented or incremented by one
    //This mux will send proper inputs to D flip flops for these operations
    wire [3:0] D;
    MUX2_1_4bit mux2(adder_subst_output,I_funsel_mux,D,FunSel[1]);
    
    //Synchronized D flip flops
    D_Flip_Flop dff0(D[0],CLK,Q[0],E);
    D_Flip_Flop dff1(D[1],CLK,Q[1],E);
    D_Flip_Flop dff2(D[2],CLK,Q[2],E);
    D_Flip_Flop dff3(D[3],CLK,Q[3],E); 

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

module PART2_a(FunSel,OutASel,OutBSel,RegSel,I,OutA,OutB,CLK);
    input wire [1:0] FunSel;
    input wire [1:0] OutASel;
    input wire [1:0] OutBSel;
    input wire [3:0] RegSel;
    input wire [7:0] I;
    input wire CLK;
    
    wire [7:0] Q1; //Output of R1
    wire [7:0] Q2; //Output of R2
    wire [7:0] Q3; //Output of R3
    wire [7:0] Q4; //Output of R4
    
    output wire [7:0] OutA;
    output wire [7:0] OutB;
    
    PART1_8bit R1(~RegSel[3],FunSel,I,Q1,CLK); //If RegSel[3] is 0, R1 is enabled
    PART1_8bit R2(~RegSel[2],FunSel,I,Q2,CLK); //If RegSel[2] is 0, R2 is enabled
    PART1_8bit R3(~RegSel[1],FunSel,I,Q3,CLK); //If RegSel[1] is 0, R3 is enabled
    PART1_8bit R4(~RegSel[0],FunSel,I,Q4,CLK); //If RegSel[0] is 0, R4 is enabled
    
    MUX4_1_8bit MUXA(Q1,Q2,Q3,Q4,OutA,OutASel);
    MUX4_1_8bit MUXB(Q1,Q2,Q3,Q4,OutB,OutBSel);
    

endmodule

module PART2_b(FunSel,OutCSel,OutDSel,RegSel,I,OutC,OutD,CLK);
    input wire [1:0] FunSel;
    input wire [1:0] OutCSel;
    input wire [1:0] OutDSel;
    input wire [2:0] RegSel;
    input wire [7:0] I;
    input wire CLK;
    
    wire [7:0] PC; //Output of PC register
    wire [7:0] AR; //Output of AR register
    wire [7:0] SP; //Output of SP register
    
    output wire [7:0] OutC;
    output wire [7:0] OutD;
    
    PART1_8bit PC_reg(~RegSel[2],FunSel,I,PC,CLK); //If RegSel[2] is 0, PC is enabled
    PART1_8bit AR_reg(~RegSel[1],FunSel,I,AR,CLK); //If RegSel[1] is 0, AR is enabled   
    PART1_8bit SR_reg(~RegSel[0],FunSel,I,SP,CLK); //If RegSel[0] is 0, SR is enabled
    
    MUX4_1_8bit MUXA(PC,PC,AR,SP,OutC,OutCSel);
    MUX4_1_8bit MUXB(PC,PC,AR,SP,OutD,OutDSel);
    

endmodule

module PART2_c(E,LH,FunSel,I,IRout,CLK);
    input wire E;
    input wire LH;
    input wire [1:0] FunSel;
    input wire [7:0] I;
    input wire CLK;
    
    //MASK selection
    // If we load I into IR(15-8), we need to mask IR(15-8), thus MASK will be 0000000011111111
    // otherwise it will 1111111100000000
    wire [15:0] MASK;
    MUX2_1_16bit mask_mux(16'b0000000011111111,16'b1111111100000000,MASK,LH); 
    
    //Extend the length of load I.
    //We fill right side of I with 0s and load it to ADD1.
    //We fill left side of I with 0s and load it to ADD2.
    //Then we will add one of these ADDs to masked register value 
    wire [15:0] ADD1;
    wire [15:0] ADD2;
    wire [7:0] CONST = 8'b0;
    assign ADD1[15:8] = I|CONST;
    assign ADD1[7:0] = 8'b0; 
    assign ADD2[7:0] = I|CONST;
    assign ADD2[15:8] = 8'b0;
    
    //Select ADD number which will be added to masked register value
    wire [15:0] ADD_RESULT;
    MUX2_1_16bit add_mux(ADD1,ADD2,ADD_RESULT,LH);
    
    output wire [15:0] IRout;
    
    //Mask register value
    wire [15:0] MASKED_LOAD;
    assign MASKED_LOAD = IRout&MASK;
    
    //Add extended load I to masked register value
    //As a result we will get a 16 bit number ready to be loaded into register
    wire [15:0] LOAD;
    wire temp;
    Adder_Substractor_16bit load_adder(MASKED_LOAD,ADD_RESULT,1'b0,LOAD,temp);
    
    PART1_16bit IR_reg(E,FunSel,LOAD,IRout,CLK);
    
endmodule

module PART3(A,B,FunSel,OutALU,OutFlag,CLK);
    input wire [7:0] A;
    input wire [7:0] B;
    input wire [3:0] FunSel;
    output wire [7:0] OutALU;
    output wire [3:0] OutFlag;
    input wire CLK;
    
    wire [3:0] InFlag;
    
    //adder
    wire [7:0] B_adder;
    wire cin;
    wire cout;
    wire [7:0]adder_result;
    //Decided whether B or its complement is sent to adder/substracter
    MUX2_1_8bit adder(B,~B,B_adder,FunSel[1]);
    //if funsel[0] is 1, addition with carry flag is performed
    //if funsel[0] is 0 and (FunSel[0]|FunSel[1]) is 0, A+B, if (FunSel[0]|FunSel[1]) is 1 A-B is performed
    MUX2_1_1bit mux_cin((FunSel[0]|FunSel[1]),OutFlag[2],cin,FunSel[0]); 
    Adder_Substractor_8bit adder_substractor(A,B_adder,cin,adder_result,cout);
    
    //check for carry flag
    wire shifter_carry;
    wire decided_carry;
    //check if carry coming from left shift or right shift
    MUX2_1_1bit c_decider1(A[7],A[0],shifter_carry,FunSel[0]);  
    //check if carry coming from adder/substractor or from shifter  
    MUX2_1_1bit c_decider2(cout,shifter_carry,decided_carry,FunSel[3]);    
    //check if carry output should be effected or not
    MUX2_1_1bit c_decider3(OutFlag[2],decided_carry,InFlag[2],(FunSel[3]&FunSel[1])|(FunSel[2]&~FunSel[3]&(~FunSel[1]|~FunSel[0])));
    
    //check for overflow flag
    wire decided_o;
    wire shifter_o;
    //check if overflow coming from left shift or right shift
    MUX2_1_1bit o_decider1((~A[7]&A[6] | A[7]&~A[6]), (~A[7]&A[0] | A[7]&~A[0]) ,shifter_o,FunSel[0]); 
    //check if overflow coming from adder/substractor or from shifter 
    wire decided_B = ~B[7]&FunSel[1] | B[7]&~FunSel[1];
    wire and1 = ~A[7]&adder_result[7]&~decided_B;
    wire and2 = A[7]&~adder_result[7]&decided_B;
    MUX2_1_1bit o_decider2(and1|and2,shifter_o,decided_o,FunSel[3]);   
    //check if overflow output should be effected or not
    MUX2_1_1bit o_decider3(OutFlag[0],decided_o,InFlag[0],FunSel[2]&(~FunSel[0] | (FunSel[3]&FunSel[1]) | (~FunSel[3]&~FunSel[1])));   
    
    //check for zero flag 
    assign InFlag[3] = ~(OutALU[0]|OutALU[1]|OutALU[2]|OutALU[3]|OutALU[4]|OutALU[5]|OutALU[6]|OutALU[7]);
    
    //check for negative flag 
    //if funsel is 1101 negative flag will not be effected
    MUX2_1_1bit n_decider(OutFlag[1],OutALU[7],InFlag[1],~(FunSel[0]&~FunSel[1]&FunSel[2]&FunSel[3]));       
    
    //shifter 
    wire [7:0] shift; //shifted A
    //If LSB of Funsel is 0, A is shifted to left, otherwise to right
    //If both FunSel[1] and FunSel[2] are 1 and FunSel[0] is 0, it performs circular left shift and puts C to LSB, otherwise it puts 0
    MUX2_1_1bit sf0((OutFlag[2]&FunSel[1]&FunSel[2]),A[1],shift[0],FunSel[0]);
    MUX2_1_1bit sf1(A[0],A[2],shift[1],FunSel[0]);
    MUX2_1_1bit sf2(A[1],A[3],shift[2],FunSel[0]);
    MUX2_1_1bit sf3(A[2],A[4],shift[3],FunSel[0]);
    MUX2_1_1bit sf4(A[3],A[5],shift[4],FunSel[0]);
    MUX2_1_1bit sf5(A[4],A[6],shift[5],FunSel[0]);
    MUX2_1_1bit sf6(A[5],A[7],shift[6],FunSel[0]);   
    //If both FunSel[1] and FunSel[2] are 1 and FunSel[0] is 1, it performs circular right shift and puts MSB to C,
    //If both FunSel[1] is 0 and FunSel[2] is 1 and FunSel[0] is 1, it performs arithmetic right shift and puts MSB to MSB,
    //otherwise it puts 0 to MSB
    MUX2_1_1bit sf7(A[6],((OutFlag[2]&FunSel[1]&FunSel[2])|(A[7]&~FunSel[1]&FunSel[2])),shift[7],FunSel[0]);
   
    MUX16_4_8bit alu(A,B,~A,~B,adder_result,adder_result,adder_result,(A&B),(A|B),((A&~B)|(~A&B)),shift,shift,shift,shift,shift,shift,OutALU,FunSel);
    
    //ZCNO register. We used the first 4 bit of our 8 bit register we created in part 1 
    
    ZCNO_register ZCNO_reg(1'b1,2'b10,InFlag,OutFlag,CLK);
    
endmodule

module Memory(
    input wire[7:0] address,
    input wire[7:0] data,
    input wire wr, //Read = 0, Write = 1
    input wire cs, //Chip is enable when cs = 0
    input wire clock,
    output reg[7:0] o // Output
);
    //Declaration oýf the RAM Area
    reg[7:0] RAM_DATA[0:255];
    //Read Ram data from the file
    initial $readmemh("RAM.mem", RAM_DATA);
    //Read the selected data from RAM
    always @(*) begin
        o = ~wr && ~cs ? RAM_DATA[address] : 8'hZ;
    end
    
    //Write the data to RAM
    always @(posedge clock) begin
        if (wr && ~cs) begin
            RAM_DATA[address] <= data; 
        end
    end
endmodule

module ALUSystem(
    input wire [1:0] RF_OutASel, 
    input wire [1:0] RF_OutBSel, 
    input wire [1:0] RF_FunSel,
    input wire [3:0] RF_RegSel,
    input wire [3:0] ALU_FunSel,
    input wire [1:0] ARF_OutCSel, 
    input wire [1:0] ARF_OutDSel, 
    input wire [1:0] ARF_FunSel,
    input wire [2:0] ARF_RegSel,
    input wire IR_LH,
    input wire IR_Enable,
    input wire [1:0] IR_Funsel,
    input wire Mem_WR,
    input wire Mem_CS,
    input wire [1:0] MuxASel,
    input wire [1:0] MuxBSel,
    input wire MuxCSel,
    input wire Clock
    );
    
    wire [7:0] AOut;
    wire [7:0] BOut;
    wire [7:0] ALUOut;
    wire [7:0] ARF_COut; //address register file part2b
    wire [7:0] Address;
    wire [7:0] MemoryOut;
    wire [7:0] IROut;//IR(0-7)
    wire [7:0] MuxAOut;
    wire [7:0] MuxBOut;
    wire [7:0] MuxCOut;
    wire [15:0] temp_I;
    wire [3:0] ALUOutFlag;
    
    PART2_a register_file(RF_FunSel,RF_OutASel,RF_OutBSel,RF_RegSel,MuxAOut,AOut,BOut,Clock);
    
    PART2_b ARF(ARF_FunSel,ARF_OutCSel,ARF_OutDSel,ARF_RegSel,MuxBOut,ARF_COut,Address,Clock);
    
    Memory mem(Address,ALUOut,Mem_WR,Mem_CS,Clock,MemoryOut);
    
    
    PART2_c IR(IR_Enable,IR_LH,IR_Funsel,MemoryOut,temp_I,Clock);
    
    assign IROut = temp_I[7:0];
    
    MUX4_1_8bit MUXA(IROut,MemoryOut,ARF_COut,ALUOut,MuxAOut,MuxASel);
    MUX4_1_8bit MUXB(8'b0,IROut,MemoryOut,ALUOut,MuxBOut,MuxBSel);
    MUX2_1_8bit MUXC(ARF_COut,AOut,MuxCOut,MuxCSel);
    
    PART3 ALU(MuxCOut,BOut,ALU_FunSel,ALUOut,ALUOutFlag,Clock);
    
endmodule
        

