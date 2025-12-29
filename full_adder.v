`timescale 1ns / 1ps
module full_adder(
input a,b,c,
output sum , cout);
assign sum=a^b^c;
assign cout=(a&b)|(b&c)|(c&a);
endmodule

module tb;
reg a,b,c;
wire sum , cout;
full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.cout(cout));

initial begin 
$monitor("time=%0t A=%b B=%0b C=%b SUM=%0b Cout=%b",$time,a,b,c,sum,cout);
 
a=0; b=0; c=0; #10; // 0+0+0 = 00
        a=0; b=0; c=1; #10; // 0+0+1 = 01
        a=0; b=1; c=0; #10; // 0+1+0 = 01
        a=0; b=1; c=1; #10; // 0+1+1 = 10 (Carry)
        a=1; b=0; c=0; #10; // 1+0+0 = 01
        a=1; b=0; c=1; #10; // 1+0+1 = 10 (Carry)
        a=1; b=1; c=0; #10; // 1+1+0 = 10 (Carry)
        a=1; b=1; c=1; #10; // 1+1+1 = 11 (Sum=1, Carry=1)
        $finish; 
    end
endmodule
