`timescale 1ns / 1ps
module mux_2x1(
input i0 , i1, sel,
output out);
assign out= sel?i1:i0;
endmodule

module tb;
reg i0,i1,sel;
wire out;
mux_2x1 uut(.i0(i0),.i1(i1),.sel(sel),.out(out));
initial begin
$monitor("time:%0t,sel:%b i0=%b i1=%b out:%b",$time,sel,i0,i1,out); 
sel=0; i0=0; i1=1; #10; // y should be 0 (i0)
        sel=0; i0=1; i1=0; #10; // y should be 1 (i0)

                                 // Case 2: Sel=1 (Should pick i1)
        sel=1; i0=0; i1=0; #10; // y should be 0 (i1)
        sel=1; i0=0; i1=1; #10;  // y should be 1 (i1)
$finish;
end
endmodule


