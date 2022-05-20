`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2022 21:23:44
// Design Name: 
// Module Name: simulations
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


module part1_8bit_test();
    reg E;
    reg [1:0] FunSel;
    reg [7:0] I;
    reg CLK;
    
    wire [7:0] Q;
    PART1_8bit uut(.E(E),.FunSel(FunSel),.I(I),.Q(Q),.CLK(CLK));      
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;     
    end  
    initial begin
        E = 1; FunSel = 2'b11; I = 8'b00000000; #25;
        E = 1; FunSel = 2'b10; I = 8'b00000000; #25;
        E = 0; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 0; FunSel = 2'b10; I = 8'b00000010; #25;
        E = 1; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 1; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 1; FunSel = 2'b00; I = 8'b00000000; #25;
        E = 1; FunSel = 2'b11; I = 8'b00000000; #25;        
    end
endmodule

module part1_16bit_test();
    reg E;
    reg [15:0] FunSel;
    reg [15:0] I;
    reg CLK;
    
    wire [15:0] Q;
    PART1_16bit uut(.E(E),.FunSel(FunSel),.I(I),.Q(Q),.CLK(CLK));      
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;     
    end  
    initial begin
        E = 1; FunSel = 2'b11; I = 16'b0000000000001000; #25;
        E = 1; FunSel = 2'b10; I = 16'b0000100000100000; #25;
        E = 0; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 0; FunSel = 2'b10; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b00; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b00; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b00; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b00; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b01; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b00; I = 16'b0000000000000000; #25;
        E = 1; FunSel = 2'b11; I = 16'b0000000000000000; #25;        
    end
endmodule

module PART2_a_test();
    reg [1:0]FunSel;
    reg [1:0]OutASel;
    reg [1:0]OutBSel;
    reg [3:0]RegSel;
    reg [7:0]I;
    wire [7:0]OutA;
    wire [7:0]OutB;
    reg CLK;
    
    PART2_a uut(.FunSel(FunSel),.OutASel(OutASel),.OutBSel(OutBSel),.RegSel(RegSel),.I(I),.OutA(OutA),.OutB(OutB),.CLK(CLK));
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;     
    end 
    initial begin
        OutASel = 2'b00; OutBSel = 2'b01; FunSel = 2'b10; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutASel = 2'b00; OutBSel = 2'b10; FunSel = 2'b01; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutASel = 2'b00; OutBSel = 2'b11; FunSel = 2'b01; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutASel = 2'b10; OutBSel = 2'b00; FunSel = 2'b00; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutASel = 2'b00; OutBSel = 2'b01; FunSel = 2'b11; RegSel = 4'b0000; I = 8'b11100100; #25;
    end
endmodule

module PART2_b_test();
    reg [1:0]FunSel;
    reg [1:0]OutCSel;
    reg [1:0]OutDSel;
    reg [2:0]RegSel;
    reg [7:0]I;
    wire [7:0]OutC;
    wire [7:0]OutD;
    reg CLK;
    
    PART2_b uut(.FunSel(FunSel),.OutCSel(OutCSel),.OutDSel(OutDSel),.RegSel(RegSel),.I(I),.OutC(OutC),.OutD(OutD),.CLK(CLK));
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;     
    end 
    initial begin
        OutCSel = 2'b00; OutDSel = 2'b01; FunSel = 2'b10; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutCSel = 2'b00; OutDSel = 2'b10; FunSel = 2'b01; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutCSel = 2'b00; OutDSel = 2'b11; FunSel = 2'b01; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutCSel = 2'b10; OutDSel = 2'b00; FunSel = 2'b00; RegSel = 4'b0000; I = 8'b11100100; #25;
        OutCSel = 2'b00; OutDSel = 2'b01; FunSel = 2'b11; RegSel = 4'b0000; I = 8'b11100100; #25;
    end
endmodule

module PART2_c_test();
    reg E;
    reg LH;
    reg [1:0] FunSel;
    reg [7:0] I;
    wire [15:0] IRout;
    reg CLK;
    
    PART2_c uut(.E(E),.LH(LH),.FunSel(FunSel),.I(I),.IRout(IRout),.CLK(CLK));
    
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;     
    end  
    
    initial begin
        E = 1; LH = 0; FunSel = 2'b10; I = 8'b11100100; #25;        
        E = 1; LH = 1; FunSel = 2'b10; I = 8'b01000100; #25;
        E = 1; LH = 1; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 1; LH = 0; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 0; LH = 0; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 1; LH = 0; FunSel = 2'b00; I = 8'b00000000; #25;
        E = 1; LH = 0; FunSel = 2'b01; I = 8'b00000000; #25;
        E = 1; LH = 1; FunSel = 2'b00; I = 8'b00000000; #25;
        E = 1; LH = 0; FunSel = 2'b10; I = 8'b10101000; #25;        
        E = 1; LH = 1; FunSel = 2'b10; I = 8'b11110100; #25;
        E = 0; LH = 0; FunSel = 2'b11; I = 8'b11110100; #25;
        E = 1; LH = 0; FunSel = 2'b11; I = 8'b11110100; #25;      
    end
endmodule