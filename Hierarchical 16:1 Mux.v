`timescale 1ns / 1ps
module mux_4x1(
input [3:0]i,input[1:0]s,output y);
assign y=  (s==00)? i[0]:
            (s==01)? i[1]:
            (s==10)? i[2]:i[3];          
endmodule 

module mux_16x1(input[15:0]in,input[3:0]sel,output out);
wire[3:0]temp;
mux_4x1 m0(.i(in[3:0]),.s(sel[1:0]),.y(temp[0]));
mux_4x1 m1(.i(in[7:4]),.s(sel[1:0]),.y(temp[1]));
mux_4x1 m2(.i(in[11:8]),.s(sel[1:0]),.y(temp[2]));
mux_4x1 m3(.i(in[15:12]),.s(sel[1:0]),.y(temp[3]));
//final
mux_4x1 final(.i(temp),.s(sel[3:2]),.y(out));
endmodule

module tb;
reg[15:0]in;
reg[3:0]sel;
wire out;
mux_16x1 dut(.in(in),.sel(sel),.out(out));
initial begin
$monitor("time:%0t,sel:%b %d,out:%b",$time,sel,sel,out); 
in=16'h0000;
in[2]=1;
in[5]=1;
in[15]=1;
sel=4'd0; #10;
sel=4'd2; #10;
sel=4'd15; #10;
sel=4'd5; #10;
sel=13; #10;
$finish;
end
endmodule
