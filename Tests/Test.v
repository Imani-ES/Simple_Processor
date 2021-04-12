module Test();

reg [2:0] A;
wire [7:0] Cout; 

SignExt_3to8 Behavioral_extender (
.a(A),
.out(Cout)
);
initial begin
A=000;
#5;
A=010;
#5;
A=100;
#5;
A=111;
#5;
end
endmodule
