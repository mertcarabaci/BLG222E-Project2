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

module PART3_test();
    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] FunSel;
    wire [7:0] OutALU;
    wire [3:0] OutFlag;
    reg CLK;
    
    PART3 uut(.A(A),.B(B),.FunSel(FunSel),.OutALU(OutALU),.OutFlag(OutFlag),.CLK(CLK));    
    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK;     
    end  
    
    initial begin
        A = 8'b11100100; B = 8'b11100100; FunSel = 4'b1010;#25;           
    end
endmodule

module Project1Test();
    //Input Registers of ALUSystem
    reg[1:0] RF_OutASel; 
    reg[1:0] RF_OutBSel; 
    reg[1:0] RF_FunSel;
    reg[3:0] RF_RegSel;
    reg[3:0] ALU_FunSel;
    reg[1:0] ARF_OutCSel; 
    reg[1:0] ARF_OutDSel; 
    reg[1:0] ARF_FunSel;
    reg[2:0] ARF_RegSel;
    reg      IR_LH;
    reg      IR_Enable;
    reg[1:0]      IR_Funsel;
    reg      Mem_WR;
    reg      Mem_CS;
    reg[1:0] MuxASel;
    reg[1:0] MuxBSel;
    reg[1:0] MuxCSel;
    reg      Clock;
    
    //Test Bench Connection of ALU System
    ALUSystem _ALUSystem(
    .RF_OutASel(RF_OutASel), 
    .RF_OutBSel(RF_OutBSel), 
    .RF_FunSel(RF_FunSel),
    .RF_RegSel(RF_RegSel),
    .ALU_FunSel(ALU_FunSel),
    .ARF_OutCSel(ARF_OutCSel), 
    .ARF_OutDSel(ARF_OutDSel), 
    .ARF_FunSel(ARF_FunSel),
    .ARF_RegSel(ARF_RegSel),
    .IR_LH(IR_LH),
    .IR_Enable(IR_Enable),
    .IR_Funsel(IR_Funsel),
    .Mem_WR(Mem_WR),
    .Mem_CS(Mem_CS),
    .MuxASel(MuxASel),
    .MuxBSel(MuxBSel),
    .MuxCSel(MuxCSel),
    .Clock(Clock)
    );
    
    //Test Vector Variables
    reg [31:0] VectorNum, Errors, TotalLine; 
    reg [35:0] TestVectors[10000:0];
    reg Reset, Operation;
    
    //Clock Signal Generation
    always 
    begin
        Clock = 1; #5; Clock = 0; #5; // 10ns period
    end
    
    //Read Test Bench Values
    initial begin
        $readmemb("alusystem_tb.mem", TestVectors); // Read vectors
        VectorNum = 0; Errors = 0; TotalLine=0; Reset=0;// Initialize
    end
    
    // Apply test vectors on rising edge of clock
    always @(posedge Clock)
    begin
        #1; 
        {Operation, RF_OutASel, RF_OutBSel, RF_FunSel, 
        RF_RegSel, ALU_FunSel, ARF_OutCSel, ARF_OutDSel, 
        ARF_FunSel, ARF_RegSel, IR_LH, IR_Enable, IR_Funsel, 
        Mem_WR, Mem_CS, MuxASel, MuxBSel, MuxCSel} = TestVectors[VectorNum];
    end
    
    // Check results on falling edge of clk
    always @(negedge Clock)
        if (~Reset) // skip during reset
        begin
            $display("Input Values:");
            $display("Operation: %d", Operation);
            $display("Register File: OutASel: %d, OutBSel: %d, FunSel: %d, Regsel: %d", RF_OutASel, RF_OutBSel, RF_FunSel, RF_RegSel);            
            $display("ALU FunSel: %d", ALU_FunSel);
            $display("Addres Register File: OutCSel: %d, OutDSel: %d, FunSel: %d, Regsel: %d", ARF_OutCSel, ARF_OutDSel, ARF_FunSel, ARF_RegSel);            
            $display("Instruction Register: LH: %d, Enable: %d, FunSel: %d", IR_LH, IR_Enable, IR_Funsel);            
            $display("Memory: WR: %d, CS: %d", Mem_WR, Mem_CS);
            $display("MuxASel: %d, MuxBSel: %d, MuxCSel: %d", MuxASel, MuxBSel, MuxCSel);
            
            $display("");
            $display("Ouput Values:");
            $display("Register File: AOut: %d, BOut: %d", _ALUSystem.AOut, _ALUSystem.BOut);            
            $display("ALUOut: %d, ALUOutFlag: %d, ALUOutFlags: Z:%d, C:%d, N:%d, O:%d,", _ALUSystem.ALUOut, _ALUSystem.ALUOutFlag, _ALUSystem.ALUOutFlag[3],_ALUSystem.ALUOutFlag[2],_ALUSystem.ALUOutFlag[1],_ALUSystem.ALUOutFlag[0]);
            $display("Address Register File: COut: %d, DOut (Address): %d", _ALUSystem.ARF_COut, _ALUSystem.Address);            
            $display("Memory Out: %d", _ALUSystem.MemoryOut);            
            $display("Instruction Register: IROut: %d", _ALUSystem.IROut);            
            $display("MuxAOut: %d, MuxBOut: %d, MuxCOut: %d", _ALUSystem.MuxAOut, _ALUSystem.MuxBOut, _ALUSystem.MuxCOut);
            
            // increment array index and read next testvector
            VectorNum = VectorNum + 1;
            if (TestVectors[VectorNum] === 4'bx)
            begin
                $display("%d tests completed.",
                VectorNum);
                $finish; // End simulation
            end
        end
endmodule