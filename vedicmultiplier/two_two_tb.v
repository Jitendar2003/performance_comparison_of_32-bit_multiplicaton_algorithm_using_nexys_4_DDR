`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 21:15:47
// Design Name: 
// Module Name: two_two_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module two_two_tb();
wire [15:0] result;
reg [7:0] a,b;
vedicmultiplier_8_bit dum(a,b,result);
initial
begin
a = 8'b11001101;
b=8'b00111001;
#10 $finish;
end
endmodule
