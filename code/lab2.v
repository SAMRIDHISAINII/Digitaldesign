module an_g(
  input a,b,
  output y);
  assign y=a&b;
endmodule




                                                      testbench_no_1
module tb_an_g;
  reg A,B;
  wire Y;
  an_g a1 (.a(A) ,.b(B),.y(Y));
 initial
  begin
  A=0;B=0;#5;
    A=0;B=1;#5;
    A=1;B=0;#5;
    A=1;B=1;#5;
    
 end
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule



																Verilog_no_2
// Code your design here
module or_g(
  input a,b,
  output y);
  assign y=a|b;
endmodule

                                         











testbench_no_2
module tb_or_g;
  reg A,B;
  wire Y;
  
  or_g a1(.a(A) ,.b(B),.y(Y));
  
 initial
   
  begin
  A=0;B=0;#5;
    A=0;B=1;#5;
    A=1;B=0;#5;
    A=1;B=1;#5;
    
 end
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule


                                                Verilog_no_3
module xor_g(
  input a,b,
  output y);
  assign y=(~a)&b|a&(~b);
endmodule


                                            


 testbench_no_3
module tb_xor_g;
  reg A,B;
  wire Y;
  
  xor_g a1(.a(A) ,.b(B),.y(Y));
  
 initial
   
  begin
  A=0;B=0;#5;
    A=0;B=1;#5;
    A=1;B=0;#5;
    A=1;B=1;#5;
    
 end
initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule


