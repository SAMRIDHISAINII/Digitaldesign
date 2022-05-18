
o	Verilog
module not_gate (input in, output out);
 assign out = ~in;
 endmodule
 module three_and (input ex1, input ex2, input ex3, output ex_out);
 assign ex_out = ex1 & ex2 & ex3;
endmodule

module two_and_gate(input ex1, ex2, output ex_out2);
 assign ex_out2 = ex1 & ex2;
 endmodule
 module or_gate (input x, y, output z);
 assign z = x | y;
endmodule

module x_instance (a, b, c, out2);
 input a, b, c;
 output out2;
 wire a_not, b_not, c_not, x_not, y_not, temp1, temp2;
 not gate not1 (.in(a), .out(a_not));
 not_gate not2 (.in(b), out(b_not));
 not_gate not3 {.in(c), .out(c_not));
 three_and and1 (.ex1(a), .ex2(b_not), .ex3(c), .ex_out(temp1));
 three_and and2 (.ex1(a_not), .ex2(b), .ex3(c_not), .ex_out(temp2));
 or_gate x_out3 (.x(temp1), .y(temp2), -z(out2));
endmodule

module y_instance (a, b, c, out);
 input a, b, c;
 output out;
 wire a_not, b_not, c_not, temp3, temp4;
 not_gate not1 (.in(a), .out(a_not));
 not_gate not2 (.in(b), .out(b_not));
 not_gate not3 (.in(c), .out(c_not));
 two_and_gate and3 (.ex1(a_not), .ex2(b_not),.ex_out2(temp3));
 two_and_gate and4 (.ex1(b), .ex2(c_not),.ex_out2(temp4));
 or_gate y_out (.x(temp3), .y(temp4), .z(out));
endmodule

module z_instance (input A, B, C, output Z);
 wire x_not, y_not, temp1, temp2, x_out, y_out;
 x_instance x_ins (.a(A), .b(B), .c(C), .out2(x_out));
 y_instance y_ins (.a(A), .b(B), .c(C), .out(y_out));
 not_gate n4 (.in(x_out), .out(x_not]);
 not_gate n5 (.in(y_out), out(y_not));
 two_and_gate and (.ex1(x_not), .ex2(y_out),.ex_out2(temp1));
 two_and_gate an9 (.ex1(y_not), .ex2(x_out),.ex_out2(temp2));
 or_gate final_out (.x(temp1), .y(temp2), .z(Z));
endmodule
o	TestBench
module tb_Z_str; 
 reg A,B,C; 
  wire Z; 
  z_instance x1 (.A(A) ,.B(B),.C(C),.Z(Z));

initial 
  begin 
  A = 0; B =0; C=0; #5;
  A = 0; B =0; C=1; #5;
  A = 0; B =1; C=0; #5; 
  A = 0; B =1; C=1; #5; 
  A = 1; B =0; C=0; #5;
  A = 1; B =0; C=1; #5; 
  A = 1; B =1; C=0; #5;
  A = 1; B =1; C=1; #5;
 end 
initial
  begin 
   $dumpfile("dump.vcd"); 
  $dumpvars(1); 
 end
o	WaveForm:
 






Question2
A	B	C	Output
0	0	0	0  
0	0	1	1 
0	1	0	0 
0	1	1	1 
1	0	0	0 
1	0	1	0
1	1	0	1
1	1	1	0

*For the given truth table, Boolean expression: (A.B.C’)+(A’.C)   
*In the form of NAND gate: ((A&B&C’)’ & (A’&C)’)’

o	Verilog
       module X_gate( input a,b,c, output y); 
            assign y =~(~(a&b&~c) & ~(~a&c));
          endmodule

o	TestBench
module tb_XNOR_gate; 
  reg A,B,C; 
  wire Y; X_gate a1 (.a(A) ,.b(B),.c(C),.y(Y)); 
 initial 
  begin 
   A = 0; B =0; C=0; #5;
   A = 0; B =0; C=1; #5;
   A = 0; B =1; C=0; #5; 
   A = 0; B =1; C=1; #5; 
   A = 1; B =0; C=0; #5;
   A = 1; B =0; C=1; #5; 
   A = 1; B =1; C=0; #5;
   A = 1; B =1; C=1; #5;
  end 
 initial
  begin 
   $dumpfile("dump.vcd");

   $dumpvars(1); 
  end
 endmodule
o	WaveForm:
 


 Question3

o	Verilog

module not_gate(input in, output out);
 assign out = ~in;
endmodule

module and_gate(input in1, in2, output out);
 assign out = in1 & in2;
endmodule

module two_or (input in1, in2, output out);
 assign out = in1 | in2;
endmodule

module three_or (input in1, in2, in3, output out);
 assign out = in1 | in2 | in3;
endmodule

module four_or (input in1, in2, in3, in4, output out);
 assign out = in1 | in2 | in3 |in4 ;
endmodule

module a_segment (input A, B, D, output out_a);
 wire BD, BD_not, D_not, B_not;
 and_gate a1 (.in1(B), .in2(D), .out(BD));
 not_gate d_ (.in(D), .out(D_not));
 not_gate b_ (.in(B), .out(B_not));
 and_gate a2 (.in1(B_not), .in2(D_not), .out(BD_not));
  four_or g8 (.in1(A),.in2(B),.in3(BD), .in4(BD_not), .out(out_a));
endmodule

module b_segment (input B, C, D, output out_b);
 wire CD, CD_not, C_not, B_not, D_not;
 and_gate a3 (.in1(C), .in2(D), .out(CD));
 not_gate c_(.in(C), .out(C_not));
 not_gate d_ (.in(D), .out(D_not));
  not_gate b_ (.in(B), .out(B_not));
  and_gate a2 (.in1(C_not), .in2(D_not), .out(CD_not));
 three_or g7 (.in1(B_not), .in2(CD), .in3(CD_not), .out(out_b));
endmodule

module c_segment (input B, C, D, output out_c);
 wire C_not;
 not_gate c_(.in(C), .out(C_not));
 three_or g6 (.in1(B), .in2(C_not), .in3(D), .out(out_c));
endmodule

module d_segment (input A, B, C, D, output out_d);
 wire BD_not, CD_not, BCD_not, BC_not, A_not, B_not, C_not, D_not, temp, temp1;
 not_gate a_ (.in(A), .out(A_not));
 not_gate c_ (.in(C), .out(C_not));
 not_gate d_ (.in(D), .out(D_not));
 not_gate b_ (.in(B), .out(B_not));
 and_gate a5 (.in1(B_not), .in2(D_not), .out(BD_not));
 and_gate a6 (.in1(C), .in2(D_not), .out(CD_not));
 and_gate a7 (.in1(B), .in2(C_not), .out(temp1));
 and_gate a8 (.in1(templ), .in2(D), .out(BCD_not));
 and_gate a9 (.in1(B_not), .in2(C), .out(BC_not));
 four_or g1 (.in1(BD_not), .in2(CD_not), .in3(BCD_not), .in4(BC_not), .out(temp));
 two_or g2 (.in1(temp), .in2(A), .out(out_d));
endmodule

o	TestBench
module tb_xor_str;
  reg A,B,C,D;
  wire out_d;
 d_segment x1 (.A(A) ,.B(B),.C(C),.D(D),. out_d(out_d));
//Above style is connecting by names
 initial
  begin
   A = 0; B =0; C=0; D=0;  #5; 
   A = 0; B =0; C=0; D=1; #5; 
   A = 0; B =0; C=1; D=0;  #5; 
   A = 0; B =0; C=1; D=1;  #5;
   A = 0; B =1; C=0; D=0;  #5; 
   A = 0; B =1; C=0; D=1;  #5; 
   A = 0; B =1; C=1; D=0;  #5; 
   A = 0; B =1; C=1; D=1;  #5; 
   A = 1; B =0; C=0; D=0;  #5; 
   A = 1; B =0; C=0; D=1;  #5;
  end
  initial
  begin
   $dumpfile("dump.vcd");
   $dumpvars(1);
  end 
endmodule
o	WaveForm:
 

Question4

Truth Table
	Input	BCD			 	Output	Excess3	
A	B	C	D		W	X	Y	Z
0	0	0	0		0	0	1	1
0	0	1	1		0	1	0	0
0	0	0	0		0	1	0	1
0	0	1	1		0	1	1	0
0	1	0	0		0	1	1	1
0	1	1	1		1	0	0	0
0	1	0	0		1	0	0	1
0	1	1	1		1	0	1	0
1	0	0	0		1	0	1	1
1	0	0	1		1	1	0	0

W	
   CD AB	00	01	11	10
    00				
01		1	1	1
11	X	X	X	X
   10	1	1	X	X
   X
   CD AB	00	01	11	10
    00		1	1	1
01	1			
11	X	X	X	X
   10		1	X	X
                  



 Y      
   CD AB	00	01	11	10
    00	1		1	
01	1		1	
11	X	X	X	X
   10	1		X	X
       Z
   CD AB	00	01	11	10
    00	1			1
01	1			1
11	X	X	X	X
   10	1		X	X



o	Verilog
module bcd_ex3_Dataflow(
input a,
input b,
input c,
input d,
output w,
output x,
output y,
outpul z

assign w = (a | (b & c) | (b & d));
assign x = (((~b) & c) | ((~b) & d) | (b & (~c) & (~d)));
assign y = ((c & d) | ((~c) & (~d)));
assign z = ~d;
endmodule
o	TestBench
module tb_and_gate;
 reg A,B,C,D;
 wire W,X,Y,Z;
  bcd_ex3_Dataflow x1 (.a(A) ,.b(B),.c(C),.d(D),.w(W),.x(X),.y(Y),.z(Z));
 initial
 begin
   A = 0; B =0; C=0; D=0;  #5; 
   A = 0; B =0; C=1; D=0;  #5; 
   A = 0; B =0; C=1; D=1;  #5;
   A = 0; B =1; C=0; D=0;  #5; 
   A = 0; B =1; C=0; D=1;  #5; 
   A = 0; B =1; C=1; D=0;  #5; 
   A = 0; B =1; C=1; D=1;  #5; 
   A = 1; B =0; C=0; D=0;  #5; 
   A = 1; B =0; C=0; D=1;  #5;
 end
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1);
 end 
 endmodule
o	WaveForm:
 

