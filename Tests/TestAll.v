module TestAll();
reg [2:0] A;
wire [7:0] Cout; 

SignExt_3to8 Behavioral_extender (
.a(A),
.out(Cout)
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

SignExt_5to8 Behavioral_extender1 (
.a(B),
.out(Cout2)
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

reg [7:0] E;
wire [7:0] Cout4; 

Addr Behavioral_addr (
.a(E),
.out(Cout4)
);
initial begin
E=11110011;
#5;
E=10110111;
#5;
E=00100001;
#5;
E=10000001;
#5;
E=01110000;
#5;
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

reg H;
reg [7:0] I, J;
wire [7:0] Cout6; 

DestMux Behavioral_DMux (
.destination(H),
.a(I),
.b(J),
.out(Cout6)
);
initial begin
H=1;
I=11110011;
J=00101010;
#5;
H=1;
I=00000011;
J=00001010;
#5;
H=1;
I=11111111;
J=10101010;
#5;
H=0;
I=10010001;
J=01111110;
#5;
H=0;
I=01111111;
J=01000110;
#5;
H=0;
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
.immeadiate(O),
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
