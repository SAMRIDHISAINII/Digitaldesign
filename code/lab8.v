	 
module srlatc(input s,r,output q, qbar);  Prog1   wire w1, w2; 
     nor(w1, s, w2);   nor(w2, r, w1); 
     assign q = w2;   assign qbar = w1; endmodule 
  
 
1_TestBench 
module TestModule;   reg s,r;   wire q,qbar;   srlatc ad (s,r,q,qbar);   initial      begin       s = 0;r = 0; #50;       s = 1;r = 0; #50;       s = 0;r = 1;#50;       s = 1;r = 1;#50;   end   initial     begin 
      $dumpfile("dump.vcd");       $dumpvars(1);     end endmodule 
 
 
 
1_Waveform 
  
  
  
     
   
   
  
 
 
 
 
 
 
 
2_Verilog  
module srflip(input s,r,clk,output q, qbar); //Samridhi Prog2 
 wire w1,w2,w3,w4; 
 nand(w1, s, clk); 
 nand(w2, r, clk); 
 nand(w3, w1, w4); 
 nand(w4, w2, w3); 
 
 assign q = w3; 
 assign qbar = w4; 
endmodule  
2_TestBench 
module TestModule;   reg s,r,cl;   wire q,qbar;   srflip ad (s,r,cl,q,qbar);   initial      begin       s = 0;r = 0;cl=1; #50;       s = 1;r = 0;cl=1; #50;       s = 0;r = 1;cl=1; #50;       s = 1;r = 1;cl=1; #50;       s = 0;r = 0;cl=0; #50;       s = 1;r = 0;cl=0; #50;       s = 0;r = 1;cl=0; #50;       s = 1;r = 1;cl=0; #50;   end   initial     begin 
      $dumpfile("dump.vcd");       $dumpvars(1);     end endmodule 
 
 
 
2_Waveform 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
3_Verilog 
  
module srlat(input s,r,output reg q, qbar); //Samridhi Prog3 
 always@(s,r) 
 begin 
 if(s==0) 
 begin 
 if(r==0) 
 begin 
 q <= q; 
 qbar <=qbar; 
 end 
 else 
 begin 
 q <=0; 
 qbar <=1; 
 end 
 end 
 else 
 begin 
 if(r==0) 
 begin 
 q<=1; 
 qbar<=0; 
 end 
 else 
 begin 
 q<=0; 
 qbar<=0; 
 end 
 end 
 end 
endmodule
 
 	 
 
3_TestBench 
module TestModule;   reg s,r;   wire q,qbar;   srlat ad (s,r,q,qbar);   initial      begin 
      s = 0;r = 0; #50;       s = 1;r = 0; #50;       s = 0;r = 1; #50;       s = 1;r = 1; #50;   end   initial     begin 
      $dumpfile("dump.vcd");       $dumpvars(1);     end endmodule 
  
3_Waveform 
 
  
 
 
 
 
 
  
 
 4_Verilog 	 
 
	module srflip(input s,r,clk,output reg q, qbar); //samridhi Prog4 
 always@(clk,s,r) 
 begin 
 if(clk==1) 
 begin 
 if(s==0) 
 begin 
 if(r==0) 
 begin 
 q <= q; 
 qbar <=qbar; 
 end 
 else 
 begin 
 q <=0; 
 qbar <=1; 
 end 
 end 
 else 
 begin 
 if(r==0) 
 begin 
 q<=1; 
 qbar<=0; 
 end 
 else 
 begin 
 q<=0; 
 qbar<=0; 
 end 
 end 
 end 
 else 
 begin 
 q<=q; 
 qbar<=qbar;  end 
 end 
endmodule
4_TestBench 
 
module TestModule;   reg s,r,cl;   wire q,qbar; 
  srflip ad (s,r,cl,q,qbar);   initial      begin 
      s = 0;r = 0;cl=1; #50;       s = 1;r = 0;cl=1; #50;       s = 0;r = 1;cl=1; #50;       s = 1;r = 1;cl=1; #50;       s = 0;r = 0;cl=0; #50;       s = 1;r = 0;cl=0; #50;       s = 0;r = 1;cl=0; #50;       s = 1;r = 1;cl=0; #50;   end   initial     begin 
      $dumpfile("dump.vcd");       $dumpvars(1);     end endmodule 
 
4_Waveform 
 
  
 
 
 
