module TestSignExt();

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
D=01101100;
OP=0;
#5;
C=00000001;
D=00000000;
OP=0;
#5;
end
endmodule
