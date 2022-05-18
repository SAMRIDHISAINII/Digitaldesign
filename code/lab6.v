Verilog_1

module nor_g (input a,b,output f);
assign f = ~(a|b);
endmodule
module hadder(input p,q,output s,c);
wire k,w,e,r,t,y;
nor_g p1 (.a(p),.b(q),.f(k));
nor_g p2 (.a(p),.b(k),.f(w));
nor_g p3 (.a(k),.b(q),.f(e));
nor_g p4 (.a(w),.b(e),.f(r));
nor_g p5 (.a(r),.b(r),.f(s));
nor_g p6 (.a(p),.b(p),.f(t));
nor_g p7 (.a(q),.b(q),.f(y));
nor_g p8 (.a(t),.b(y),.f(c));
endmodule

TestBench_1

module tb_z_str;
reg A,B;
wire su,cr;
hadder x1 (.p(A), .q(B), .s(su),.c(cr));
initial
begin
A = 0;B = 0; #5; //TruthTable
A = 0;B = 1; #5;
A = 1;B = 0; #5;
A = 1;B = 1; #5;
end
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
endmodule
Waveform_1 


Question-2

Verilog_2

module fadder(input p,q,r,output s,c);
assign s = (p^q)^r;
assign c = p&q | (p^q)&r;
endmodule

TestBench_2


module tb_z_str;
reg A,B,C;
wire su,cr;
fadder x1 (.p(A), .q(B),.r(C),.s(su),.c(cr));
initial
begin
A = 0;B = 0;C = 0; #5; //TruthTable
A = 1;B = 0;C = 0; #5;
A = 0;B = 1;C = 0; #5;
A = 1;B = 1;C = 0; #5;
A = 0;B = 0;C = 1; #5; //TruthTable
A = 1;B = 0;C = 1; #5;
A = 0;B = 1;C = 1; #5;
A = 1;B = 1;C = 1; #5;
end
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
endmodule
Waveform_2
 

Question-3

Verilog_3

module fadder(input p,q,r,output s,c);
assign s = (p^q)^r;
assign c = p&q | (p^q)&r;
endmodule
module radder(p,q,r,s,c);
input r;
input [3:0] p,q;
output [3:0]s;
output c;
wire x1,x2,x3;
fadder p1 (p[0],q[0],r,s[0],x1);
fadder p2 (p[1],q[1],x1,s[1],x2);
fadder p3 (p[2],q[2],x2,s[2],x3);
fadder p4 (p[3],q[3],x3,s[3],c);
endmodule

TestBench_3

module tb_z_str;
reg [3:0]A,B;
reg C;
wire [3:0]su;
wire cr;
radder x1 (A,B,C,su,cr);
initial
begin
A = 4'b1101;B = 4'b1011;C = 0; #5; //TruthTable
A = 4'b0001;B = 4'b0011;C = 0; #5; //TruthTable
end
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
endmodule A = 1;B = 0;C = 0;D = 1; #5; //TruthTable
end
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
endmodule

Waveform_3

 

Question-4

Verilog_4

module xor_g(input a,b, output f);
assign f = a&~b | ~a&b;
endmodule
module fadder(input p,q,r,output s,c);
assign s = (p^q)^r;
assign c = p&q | (p^q)&r;
endmodule
module radder(p,q,r,s,c);
input r;
input [3:0] p,q;
output [3:0]s;
output c;
wire x1,x2,x3;
wire [3:0]k;
xor_g k1(q[0],r,k[0]);
xor_g k2(q[1],r,k[1]);
xor_g k3(q[2],r,k[2]);
xor_g k4(q[3],r,k[3]);
fadder p1 (p[0],k[0],r,s[0],x1);
fadder p2 (p[1],k[1],x1,s[1],x2);
fadder p3 (p[2],k[2],x2,s[2],x3);
fadder p4 (p[3],k[3],x3,s[3],c);
endmodule

TestBench_4


module tb_z_str;
reg [3:0]A,B;
reg C;
wire [3:0]su;
wire cr;
radder x1 (A,B,C,su,cr);
initial
begin
A = 4'b1011;B = 4'b1001;C = 1; #5; //TruthTable
A = 4'b1110;B = 4'b1010;C = 1; #5; //TruthTable
end
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1);
end
endmodule

Waveform_4
 


----------X----------
