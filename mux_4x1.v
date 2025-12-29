`timescale 1ns / 1ps
module mux_4x1 #(parameter w=8)(input [w-1:0]in0,in1,in2,in3,
input[1:0]sel,
output reg[w-1:0]out );
always @(*)begin
        case(sel)
        2'b00: out=in0;
        2'b01: out=in1;
        2'b10: out=in2;
        2'b11: out=in3; 
        endcase
end
endmodule

module tb; parameter w=8;
reg[w-1:0]in0,in1,in2,in3;
reg[1:0]sel;
wire[w-1:0]out;
mux_4x1 dut(in0,in1,in2,in3,sel,out);
initial begin
$monitor("time:%0t,sel:%b, out:%h",$time,sel,out);
          in0=8'hAA;
          in1=8'hBB;
          in2=8'hCC;
          in3=8'hDD;
   sel=2'b00; #10; //expect aa
   sel=2'b01; #10; //expect bb
   sel=2'b10; #10; //expect cc
   sel=2'b11; #10; //expect dd
   $finish;
end
endmodule



