module TestAll();
reg [2:0] A;
wire [7:0] Cout; 

SignExt3to8 Behavioral_extender (
.a(A),
.immediate(Cout)
);
initial begin
A=001;
#5;
A=000;
#5;
A=100;
#5;
A=111;
#5;
A=101;
#5;
A=011;
#5;
end



reg [4:0] B;
wire [7:0] Cout2; 

SignExt5to8 Behavioral_extender1 (
.address(B),
.pc_holder(Cout2)
);
initial begin
B=00000;
#5;
B=01110;
#5;
B=10110;
#5;
B=11111;
#5;
B=10101;
#5;
B=01010;
#5;
end

reg [7:0] C, D;
reg OP;
wire [7:0] Cout3;

ALU Behavioral_ALU (
.a(C),
.b(D),
.out(Cout3),
.op(OP)
);
initial begin
C=01101101;
D=00001100;
OP=1;
#5;
C=00100001;
D=00000100;
OP=1;
#5;
C=01111101;
D=00101100;
OP=1;
#5;
C=00000001;
D=00000000;
OP=0;
#5;
C=01111101;
D=00001100;
OP=0;
#5;
C=00011001;
D=01000001;
OP=0;
#5;
end

reg CLK;
reg [7:0] E;
wire [7:0] Cout4; 

Addr Behavioral_addr (
.clock(CLK),
.a(E),
.out(Cout4)
);
initial begin
CLK=1;
E=11110011;
#5;
CLK=1;
E=10110111;
#5;
CLK=1;
E=00100001;
#5;
CLK=0;
E=10000001;
#5;
CLK=1;
E=01110000;
#5;
CLK=1;
E=00010110;
#5;
end

reg F;
reg [7:0] G;
wire [7:0] Cout5; 

ProgramCounter Behavioral_PC (
.clk(F),
.in(G),
.instruction(Cout5)
);
initial begin
F=1;
G=11110011;
#5;
F=1;
G=10110111;
#5;
F=1;
G=00100001;
#5;
F=0;
G=10000001;
#5;
F=0;
G=01110000;
#5;
F=1;
G=00010110;
#5;
end

reg H1, H2, H3;
reg [7:0] I, J;
wire [7:0] Cout6; 

DestMux Behavioral_DMux (
.Mem_to_Reg(H1),
.Mem_Write(H2),
.Jump(H3),
.alu(I),
.data(J),
.register(Cout6)
);
initial begin
H1=1;
H2=1;
H3=0;
I=11110011;
J=00101010;
#5;
H1=0;
H2=0;
H3=0;
I=00000011;
J=00001010;
#5;
H1=1;
H2=0;
H3=0;
I=11111111;
J=10101010;
#5;
H1=1;
H2=1;
H3=1;
I=10010001;
J=01111110;
#5;
H1=1;
H2=0;
H3=1;
I=01111111;
J=01000110;
#5;
H1=0;
H2=1;
H3=1;
I=00000011;
J=01110010;
#5;
end 

reg K;
reg [7:0] L, M;
wire [7:0] Cout7; 

JumpMux Behavioral_JMux (
.jump(K),
.a(L),
.b(M),
.out(Cout7)
);
initial begin
K=1;
L=11110011;
M=00101010;
#5;
K=1;
L=00000011;
M=00001010;
#5;
K=1;
L=11111111;
M=10101010;
#5;
K=0;
L=10010001;
M=01111110;
#5;
K=0;
L=01111111;
M=01000110;
#5;
K=0;
L=00000011;
M=01110010;
#5;
end  

reg O;
reg [7:0] P, Q;
wire [7:0] Cout8; 

ImmMux Behavioral_IMux (
.immeadiate_flag(O),
.a(P),
.b(Q),
.out(Cout8)
);
initial begin
O=1;
P=11110011;
Q=00101010;
#5;
O=1;
P=00000011;
Q=00001010;
#5;
O=1;
P=11111111;
Q=10101010;
#5;
O=0;
P=10010001;
Q=01111110;
#5;
O=0;
P=01111111;
Q=01000110;
#5;
O=0;
P=00000011;
Q=01110010;
#5;
end 

reg [2:0] a0;   
wire a1,a2,a3,a4,a5,a6,a7;

Control Behavioral_Control (
.a(a0),
.ALU_Op(a1),
.Reg_Dest(a2),
.Reg_Write(a3),
.Jump(a4),
.Mem_Read(a5),
.Mem_Write(a6),
.Mem_to_Reg(a7),
.imm_flag(a8)
);
initial begin
a0=000;
#5;
a0=001;
#5;
a0=010;
#5;
a0=011;
#5;
a0=100;
#5;
a0=101;
#5;
end

reg b0, b1;
reg [7:0] b2, b3;
wire [7:0] Cout9; 

DataMemory Behavioral_DataMemory (
.Mem_Write(b0),
.Mem_Read(b1),
.rs(b2),
.address(b3),
.data_out(Cout9)
);
initial begin
b0=0;
b1=1;
b2=10001000;
b3=8'b00000000;
#5;
b0=0;
b1=1;
b2=11111100;
b3=8'b00000100;
#5;
b0=1;
b1=0;
b2=10001100;
b3=8'b00000001;
#5;
b0=1;
b1=0;
b2=11111111;
b3=8'b00000010;
#5;
b0=0;
b1=1;
b2=10000000;
b3=8'b00000011;
#5;
b0=0;
b1=1;
b2=10111110;
b3=8'b00000111;
#5;
end

reg [7:0] c0, c1;
reg c2;
wire [7:0] rs, rt, rd, ins;
wire [4:0] jmp;
wire [2:0] imm, ctrl;
InstructionMemory Behavioral_InstructionMemory (
.give_instruction(c0),
.pc(c1),
.clk(c2),
.rs(rs),
.rt(rt),
.rd(rd),
.immediate(imm),
.instruction(ins),
.ctrl(ctrl),
.jmp_address(jmp)
);

initial begin
c0=1001010;
c1=8'b00000000;
c2=1;
#5;
c0=00011000;
c1=8'b00000001;
c2=1;
#5;
c0=01011010;
c1=8'b00000010;
c2=0;
#5;
c0=11100011;
c1=8'b00000011;
c2=1;
#5;
c0=10101010;
c1=8'b00000100;
c2=1;
#5;
c0=11011100;
c1=8'b00000101;
c2=1;
#5;
end

reg d0, d1, d2, d3;
reg [7:0] d4;
wire [7:0] Cout10, Cout11; 

RegisterFile Behavioral_RegisterFile (
.readReg1(d0),
.readReg2(d1),
.writeReg(d2),
.regWrite(d3),
.writeData(d4),
.readData1(Cout10),
.readData2(Cout11)
);
initial begin
d0=1;
d1=1;
d2=0;
d3=1;
d4=1001001;
#5; 
d0=1;
d1=0;
d2=1;
d3=1;
d4=1011101;
#5; 
d0=1;
d1=1;
d2=1;
d3=1;
d4=11111111;
#5;
d0=1;
d1=1;
d2=0;
d3=0;
d4=0000001;
#5;
d0=1;
d1=1;
d2=0;
d3=0;
d4=01010101;
#5;
d0=1;
d1=1;
d2=1;
d3=1;
d4=00000001;
#5;
end 
endmodule

