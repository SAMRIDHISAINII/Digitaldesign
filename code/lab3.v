							
TESTBENCH_1
module tb_xor_str;
    reg A,B;
    wire C;
  build_xor a1 (.a(A) ,.b(B),.c(C));
//Above style is connecting by names
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

VERILOG_1

module build_xor (a, b, c);  
           input a, b; 
           output c;  
         wire x, y, a_not, b_not; 
            not a_inv (a_not, a);      
            not b_inv (b_not, b);      
           and a1 (x, a_not, b);     
            and a2 (y, b_not, a);     
           or out (c, x, y);  
          endmodule
WAVEFORM NO_1
 



TESTBENCHNO_2
module tb_xor_str;
    reg A,B;
    wire C;
  build_xor a1 (.a(A) ,.b(B),.c(C));
//Above style is connecting by names
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

VERILOG_2
          module build_xor (a, b, c);  
           input a, b; 
           output c;  
         wire x, y, a_not, b_not; 
            not a_inv (a_not, a);  
            not b_inv (b_not, b);  
           and a1 (x, a, b);  
           and a2 (y, b_not, a_not);  
           or out (c, x, y);  
        endmodule

WAVEFORM_NO_2
 

TEST BENCH_3
module tb_xor_str;
    reg A,B,C;
    wire O;
  build_xor a1 (.a(A)            ,.b(B),.c(C),.o(O));
//Above style is connecting by names
  initial
    begin
    A = 0; B =0; C=0; #5;  
    A = 0; B =0; C=1; #5;  
    A = 0; B =1; C=1; #5;  
    A = 0; B =1; C=0; #5;
    A = 1; B =1; C=0; #5;  
    A = 1; B =0; C=0; #5;  
    A = 1; B =0; C=1; #5;  
    A = 1; B =1; C=1; #5;
    end
  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end  
endmodule

VERILOG_3  BEHAVIORAL
module and_gate(
      input a,b,c
    output y);
   assign y = a&b&C| (~a)&b&c| (~a)&(~b)&c| (~a)&(~b)&(~c)| a&(~b);
 endmodule

VERILOG_3_STRUCTURAL
module build_xor (a, b, c, o);  
input a,b,c;  
output o;  
 wire v,w,x,y,z,a_not,b_not,c_not;  
   not a_inv (a_not, a);  
   not b_inv (b_not, b);
   not c_inv (c_not, c);  
    and a1 (v, a,b,c);  
    and a2 (w, a_not,b,c);  
    and a3 (x, a_not,b_not,c);  
    and a4 (y, a_not,b_not,c_not);  
    and a5 (z, a,b_not);  
    or out (o,v,w,x,y,z);  
  endmodule

WAVEFORM_NO_3
 
