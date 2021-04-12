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
endmodule
