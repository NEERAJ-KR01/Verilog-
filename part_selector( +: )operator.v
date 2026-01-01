`timescale 1ns / 1ps
module revise1;
reg [15:0]data;
initial begin
data= 16'habcd; // 1010 1011 1100 1101  
$display("selected = %H %b",data[4+:4],data[4+:4]); // expected op= "c" "1100" 
end
endmodule
