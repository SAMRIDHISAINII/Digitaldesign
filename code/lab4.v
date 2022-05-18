


 1_Verilog 
module not_g (input e, output f); 
assign t = ~u; 
endmodule 
module and_g (input a, b, output c); 
assign c = a & b; 
endmodule 
module or_g (input p, q, output r); 
assign r = p | q; 
endmodule 
module build_xor (input m, n, output o); 
wire x, y, a_not, b_not; 
not_g n1 (.t(m),.u(a_not)); 
not_g n2 (.t(n),.u(b_not)); 
and_g a1 (.a(a_not),.b(n),.c(x)); 
and_g a2 (.a(m),.b(b_not),.c(y)); 
or_g o1 (.p(x),.q(y),.r(o)); 
endmodule 

1_TestBench 
module tb_xor_str; 
reg A,B; 
wire Y; 
build_xor x1 (.m(A), .n(B), .o(Y)); 
initial 
begin 
A = 0; B =0; #5; 
A = 0; B =1; #5; 
A = 1; B =0; #5; 
A = 1; B =1; #5; 
end 
initial 
begin 
$dumpfile("dump.vcd"); 
$dumpvars(1); 
end 
endmodule

1_Waveform
 

2_Verilog 
module not_gate (input a, output f); 
assign f = ~a; 
endmodule 
module and_gate (input a, b,c, output d); 
assign d = a & b & c; 
endmodule 
module or_gate (input p, q,r,s, output t); 
assign t = p | q | r | s; 
endmodule 
module build_xeon (input m, n,o, output p); 
wire x, y,x1,y1, a_not, b_not,c_not; 
not_gate n1 (.a(m),.f(a_not)); 
not_gate n2 (.a(n),.f(b_not)); 
not_gate n3 (.a(o),.f(c_not)); 
and_gate a1 (.a(a_not),.b(b_not),.c(c_not),.d(x)); 
and_gate a2 (.a(a_not),.b(n),.c(c_not),.d(y)); 
and_gate a3 (.a(m),.b(b_not),.c(c_not),.d(x1)); 
and_gate a4 (.a(m),.b(b_not),.c(o),.d(y1)); 
or_gate o1 (.p(x),.q(y),.r(x1),.s(y1),.t(p)); 
endmodule 

2_TestBench 
module tb_xor_str; 
reg A,B,C; 
wire D; 
build_xeon x1 (.m(A), .n(B), .o(C),.p(D)); 
initial 
begin 
A = 0;B = 0;C = 0; #5; //TruthTable A = 0;B = 0;C = 1; #5; 
A = 0;B = 1;C = 0; #5; 
A = 0;B = 1;C = 1; #5; 
A = 1;B = 0;C = 0; #5; //TruthTable A = 1;B = 0;C = 1; #5; 
A = 1;B = 1;C = 0; #5; 
A = 1;B = 1;C = 1; #5; 
end 
initial 
begin $dumpfile("dump.vcd"); 
$dumpvars(1); 
end 
endmodule

2_Waveform
 
 
 

2_(iv)Verilog 
module not_gate (input a, output f); 
assign f = ~a; 
endmodule 
module and_gate (input a, b, output d); 
assign d = a & b; 
endmodule 
module or_gate (input p, q, output t); 
assign t = p | q; 
endmodule 
module build_xeon (input m, n,o, output p); 
wire x, y, a_not, b_not,c_not; 
not_gate n1 (.a(m),.f(a_not)); 
not_gate n2 (.a(n),.f(b_not)); 
not_gate n3 (.a(o),.f(c_not)); 
and_gate a1 (.a(m),.b(c_not),.d(x)); 
and_gate a2 (.a(a_not),.b(b_not),.d(y)); 
or_gate o1 (.p(x),.q(y),.t(p)); 
endmodule 

2_(iv)TestBench 
module tb_xor_str; 
reg A,B,C; 
wire D; 
build_xeon x1 (.m(A), .n(B), .o(C),.p(D)); initial 
begin 
A = 0;B = 0;C = 0; #5; //TruthTable A = 0;B = 0;C = 1; #5; 
A = 0;B = 1;C = 0; #5; 
A = 0;B = 1;C = 1; #5; 
A = 1;B = 0;C = 0; #5; //TruthTable A = 1;B = 0;C = 1; #5; 
A = 1;B = 1;C = 0; #5; 
A = 1;B = 1;C = 1; #5; 
end 
initial 
begin 
$dumpfile("dump.vcd"); $dumpvars(1); 
end 
endmodule

2(iv)_Waveform
 



3_Verilog 
module nand_gate (input p, q, output t); assign t = ~(p & q); 
endmodule 
module build_xeon (input m, n,o, output p); 
wire x, y, a_not, b_not,c_not; 
nand_gate o5 (.p(m),.q(n),.t(x)); 
nand_gate o1 (.p(n),.q(o),.t(y)); 
nand_gate o2 (.p(x),.q(y),.t(p)); 
endmodule 

3_TestBench 
module tb_nan_str; 
reg A,B,C; 
wire D; 
build_xeon x1 (.m(A), .n(B), .o(C),.p(D)); 
initial 
begin 
A = 0;B = 0;C = 0; #5; //TruthTable 
A = 0;B = 0;C = 1; #5; 
A = 0;B = 1;C = 0; #5; 
A = 0;B = 1;C = 1; #5; 
A = 1;B = 0;C = 0; #5; //TruthTable 
A = 1;B = 0;C = 1; #5; 
A = 1;B = 1;C = 0; #5; 
A = 1;B = 1;C = 1; #5; 
end 
initial 
begin 
$dumpfile("dump.vcd"); 
$dumpvars(1); 
end 
endmodule

3_Waveform

 
 
 




4_Verilog 
module nor_gate (input p, q, output t); assign t = ~(p | q); 
endmodule 
module build_xeon (input m, n, output p); 
wire x, y,x1, a_not, b_not,c_not; 
nor_gate o1 (.p(n),.q(n),.t(x)); 
nor_gate o2 (.p(m),.q(x),.t(y)); 
nor_gate o3 (.p(m),.q(n),.t(x1)); 
nor_gate o4 (.p(y),.q(x1),.t(p)); 
endmodule 

4_TestBench 
module tb_nan_str; 
reg A,B; 
wire C; 
build_xeon x1 (.m(A), .n(B),.p(C)); initial 
begin 
A = 0; B =0; #5; //Inputs A = 0; B =1; #5; 
A = 1; B =0; #5; 
A = 1; B =1; #5; 
end 
initial 
begin $dumpfile("dump.vcd"); $dumpvars(1); 
end 
endmodule

4_Waveform

 
 
 


\ 
