
1_Verilog 
 
module tflip(input t,clk,output reg q,qb);   initial q=0;   always@(posedge clk)     begin       if (t==1)         begin           q=~q;         end       else         begin 
          q=q;                         end         qb=~q;           end endmodule 
 
 
1_TestBench 
module tff_tb;   reg t,cl;   wire q,qb;   tflip out(t,cl,q,qb);   initial     begin       t=0; cl=0; #100;       cl=1; #100;       t=1 ;cl=0 ; #100;       cl=1; #100;     end   initial     begin 
      $dumpfile("dump.vcd"); 
      $dumpvars(1);     end endmodule 
 
 
 
1_Waveform 
  
  
    
   
   
  
 
   
 
 
2_Verilog 
 
module tflip(input t,clk,output reg q,qb);   initial q=0;   always@(posedge clk)     begin       if (t==1)         begin           q=~q;         end       else         begin           q=q;                         end         qb=~q;           end endmodule  
module upcount(input clk, output u1,u2,u3,u4);   wire t,b1,b2,b3,b4;   assign t = 1'b1;      tflip f1(t,clk,u1,b1);   tflip f2(t,b1,u2,b2);   tflip f3(t,b2,u3,b3);   tflip f4(t,b3,u4,b4); 
   
endmodule 
 
 
2_TestBench 
module tff_tb;   reg t,cl;   wire u1,u2,u3,u4;   upcount ot(cl,u1,u2,u3,u4);   initial 
    begin       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;     end   initial     begin 
      $dumpfile("dump.vcd");       $dumpvars(1);     end 
endmodule 
 
 
 
2_Waveform 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
3_Verilog 
  
module tflip(input t,clk,output reg q,qb);   initial q=0;   always@(posedge clk)     begin       if (t==1)         begin           q=~q;         end       else         begin           q=q;                         end         qb=~q;           end endmodule  
module downcount(input clk, output u1,u2,u3,u4);   wire t,qb;   assign t = 1'b1;      tflip f1(t,clk,u1,qb);   tflip f2(t,u1,u2,qb);   tflip f3(t,u2,u3,qb);   tflip f4(t,u3,u4,qb); 
   endmodule 
 
 	 
 
3_TestBench 
module tff_tb;   reg t,cl;   wire u1,u2,u3,u4;   downcount ot(cl,u1,u2,u3,u4);   initial 
    begin       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;       cl=1; #20;       cl=0; #20;     end   initial     begin 
      $dumpfile("dump.vcd");       $dumpvars(1);     end 
endmodule 
 
 
3_Waveform 
 
 
  
 
 
 
 
 
 
