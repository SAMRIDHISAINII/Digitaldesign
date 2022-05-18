		 
Expression for Generators and Propagators
 p0 = a0 xor b0,
 p1 = a1 xor b1,
 p2 = a2 xor b2
, p3 = a3 xor b3,
 g0 = a0 and b0, 
g1 = a1 and b1,
 g2 = a2 and b2, 
g3 = a3 and b3


1_Verilog
module cla_adder(a, b,cin, sum,cout);
 input[3:0] a,b;
 input cin;
 output [3:0] sum;
 output cout;
 wire p0,p1,p2,p3,g0,g1,g2,g3;
 wire c0,c1,c2,c3,c4;
 assign
 p0=(a[0]^b[0]),
 p1=(a[1]^b[1]),
 p2=(a[2]^b[2]),
 p3=(a[3]^b[3]);
 assign
 g0=(a[0]&b[0]),
 g1=(a[1]&b[1]),
 g2=(a[2]&b[2]),
 g3=(a[3]&b[3]);
 assign
 c0=cin,
 c1=g0| (p0&cin),
 c2=g1|(p1&g0)|(p1&p0&cin),
 c3=g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
 assign
 sum[0]=p0^c0,
 sum[1]=p1^c1,
 sum[2]=p2^c2,
 sum[3]=p3^c3;
 assign
 cout=c4;
endmodule  
1_TestBench
module TestModule;
 reg [3:0] a;
 reg [3:0] b;
 reg cin;
 wire [3:0] sum;
 wire cout;
 cla_adder ad (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
 initial
 begin
 a = 0; b = 0; cin = 0;#100;
 a = 4'b1100;b = 4'b0011;cin = 0; #50;
 a = 4'b1000;b = 4'b0001;cin = 0; #50;
 end
 initial
 begin
 $dumpfile("dump.vcd");
 $dumpvars(1);
 end
endmodule

1_Waveform
 

2_Verilog(A)
module dec3_8(in, out); 
 input[2:0] in; 
 output [7:0] out; 
 assign out[0]= ~in[2] & ~in[1] & ~in[0]; 
 assign out[1]= ~in[2] & ~in[1] & in[0]; 
 assign out[2]= ~in[2] & in[1] & ~in[0]; 
 assign out[3]= ~in[2] & in[1] & in[0]; 
 assign out[4]= in[2] & ~in[1] & ~in[0]; 
 assign out[5]= in[2] & ~in[1] & in[0]; 
 assign out[6]= in[2] & in[1] & ~in[0]; 
 assign out[7]= in[2] & in[1] & in[0]; 
endmodule


2_Verilog(B)
module dec3_8(data, out); 
 input [2:0]data; 
 output [7:0]out; 
 reg [7:0] out; 
 always @ (data) 
 begin 
 if(data==7) 
 out=128; 
 else if(data==6) 
 out=64; 
 else if(data==5) 
 out=32; 
 else if(data==4) 
 out=16; 
 else if(data==3) 
 out=8; 
 else if(data==2) 
 out=4; 
 else if(data==1)  out=2; 
 else if(data==0) 
 out=1; 
 else 
 out=0; 
 end 
endmodule 
2_TestBench 
module TestModule; 
 reg [2:0] a; 
 wire [7:0] outp; 
 dec3_8 ad (a,outp); 
 initial 
 begin 
 #100; 
 a = 3'b000; #50; 
 a = 3'b001; #50; 
 a = 3'b010; #50; 
 a = 3'b011; #50; 
 a = 3'b100; #50; 
 a = 3'b101; #50; 
 a = 3'b110; #50; 
 a = 3'b111; #50; 
 end 
 always @ (a) begin 
#10; 
// gives a tiny delay after "in" changes 
 $display ("in = %b, outl = %b", a, outp); 
end 
 initial 
 begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
 end 
endmodule

 2_Waveform
 
3_Verilog 
module dec3_8(data, out); 
 input [2:0]data; 
 output [7:0]out; 
 reg [7:0] out; 
 always @(data) 
 case (data) 
 3'b000 : out = 8'b00000001; 
 3'b001 : out = 8'b00000010; 
 3'b010 : out = 8'b00000100; 
 3'b011 : out = 8'b00001000; 
 3'b100 : out = 8'b00010000; 
 3'b101 : out = 8'b00100000; 
 3'b110 : out = 8'b01000000; 
 3'b111 : out = 8'b10000000; 
 default : out = 8'b00000000; 
 endcase 
endmodule 

3_TestBench 

module TestModule; 
 reg [2:0] a; 
 wire [7:0] outp; 
 dec3_8 ad (a,outp); 
 initial 
 begin 
 #100; 
 a = 3'b000; #50; 
 a = 3'b001; #50; 
 a = 3'b010; #50; 
 a = 3'b011; #50; 
 a = 3'b100; #50; 
 a = 3'b101; #50;  a = 3'b110; #50; 
 a = 3'b111; #50; 
 end 
 always @ (a) begin 
#10; 
// gives a tiny delay after "in" changes 
 $display ("in = %b, outl = %b", a, outp); 
end 
 initial 
 begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
 end 
endmodule 
3_Waveform
 


4_Verilog 
module mult4_1 ( a, b, c, d, s0, s1, out); 
 input wire a, b, c, d; 
 input wire s0, s1; 
 output reg out; 
 always @ (a or b or c or d or s0, s1) 
 begin 
 case (s0 | s1) 
 2'b00 : out <= a; 
 2'b01 : out <= b; 
 2'b10 : out <= c; 
 2'b11 : out <= d; 
 endcase 
end 
module

4_TestBench 

module TestModule; 
 reg a,b,c,d,s0,s1; 
 wire outp; 
 mult4_1 ad (a,b,c,d,s0,s1,outp); 
 initial 
 begin 
 #50; 
 a = 1'b1;b = 1'b0;c =1'b1;d =1'b1;s0 = 1'b1;s1=1'b1; #50; 
 a = 1'b0;b = 1'b1;c =1'b0;d =1'b0;s0 = 1'b1;s1=1'b0; #50; 
 a = 1'b0;b = 1'b0;c =1'b1;d =1'b0;s0 = 1'b0;s1=1'b1; #50; 
 a = 1'b1;b = 1'b1;c =1'b0;d =1'b1;s0 = 1'b0;s1=1'b0; #50; 
 end 
 initial 
 begin 
 $dumpfile("dump.vcd"); 
 $dumpvars(1); 
 end 
endmodule


4_Waveform
 
