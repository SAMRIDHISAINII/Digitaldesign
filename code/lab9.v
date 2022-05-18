

Testbench_1 
module digitaldesign;
reg j, k, clk;
wire q, qbar;

jk_flipflop j1 (j,k, clk, q, qbar);
initial
begin
$dumpfile("dump.vcd") ;
$dumpvars (1) ;
clk=0; j <= 1'60; k <= 1'b1;#10;

clk=1; j <= 1'60; k <= 1'b1;#10;
clk=0;j <= 1'b1; k <= 1'60;#10;
clk=1; j <= 1'b1; k <= 1'60;#10;
$finish;

end
initial
$monitor ("j=%0d k=%0d q=%0d
qbar=%0d", j, k, q, qbar);
endmodule


Design_1
module jk_flipflop(j, k, clk, q, qbar);
input j, k, clk;
output q, qbar;
reg q, qbar;

always @(negedge clk)
begin
if(j==1 & k==0)
begin
q<=1;

qbar <=0;
end
else if(j==0 & k==1)
begin

q<=0;
qbar <=1;

end

else if(j==0 & k==0)
begin

q<=q;
qbar <=qbar;
end
else if(j==1 & k==1)
begin

q <=qbar;
qbar <=q;
end
end
endmodule

waveform_1
 
Testbench _2
module designl;
reg d, clk;
wire q, qbar;

d_flipflop j2(d, clk, q, qbar);
initial
begin
$dumpfile ("dump . vcd");

$dumpvars (1);
clk=0;d <= 1'60;#5;
clk=1; d <= 1'b1;#5;

clk=0; d <= 1'b1;#5;
clk=1; d <= 1'b0;#5;
$finish;
end

initial
$monitor ("d=%0d q=%0d
qbar=%0d", d, q, qbar);
endmodule

Design_2 
module jk_flipflop(j, k, clk, q, qbar);
input j, k, clk;
output q, qbar;
reg q, qbar;

always @(negedge clk)
begin
if(j==1 & k==0)
begin
q <=1;

qbar <=0;
end
else if(j==0 & k==1)
begin
q <=0;

qbar <=1;
end
else if(j==0 & k==0)
begin
q <=q;

qbar <=qbar;
end
else if(j==1 & k==1)
begin
q <=qbar;
qbar <=q;

end
end
endmodule
module d_flipflop(d, clk, q, qbar) ;
input d, clk;
output q, qbar;
jk_flipflop ff(d, ~d, clk, q, qbar) ;
endmodule

waveform_2
 

Testbench_3
module design0;
reg t, clk;
wire q, qbar;

t_flipflop j3(t, clk, q, qbar);
initial
begin
$dumpfile( "dump. vcd");
$dumpvars (1);

clk=1;t <= 1'b1;#5;
clk=0;t <= 1'60;#5;
clk=1;t <= 0'60;#5;
clk=0;t <= 0'b1;#5;
$finish;

end
initial
$monitor ("t=%0d q=%0d
qbar=%0d", t, q, qbar) ;
endmodule

Design_3
module jk_flipflop(jk,clk,q,qbar);
input [1:0] jk;
input clk;

output q,qbar;
reg q,qbar;
always@(negedge clk)
begin
case(jk)

2'b00:q= q;
2'b01:q= 0;
2'b10:q=1;
2'b11:q= ~q;

endcase
qbar = ~q;
end
endmodule

module t_flipflop(t,clk,q,qbar);
input t,clk;
output q,qbar;
jk_flipflop ff(t,clk,q,qbar);
endmodule

waveform_3
 

