`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 21:08:47
// Design Name: 
// Module Name: vedicmultiplier_8_bit
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


//module vedicmultiplier_8_bit();
//endmodule

module half_adder(a,b,carry,sum);
input a,b;
output carry,sum;
assign carry = a&b;
assign sum = a ^ b;
endmodule


module vedicmultiplier_2_bit(a,b,result);
input [1:0] a,b;
output [3:0] result;
wire w1,w2,w3,w4;
assign result[0] = a[0] & b[0];
assign w1 = a[0] & b[1];
assign w2 = a[1] & b[0];
assign w3 = a[1] & b[1];
half_adder h1(w1,w2,w4,result[1]);
half_adder h2(w3,w4,result[3],result[2]); 
endmodule

module vedicmultiplier_4_bit(a,b,result);
input [3:0] a,b;
output [7:0] result;
wire [3:0] q0,q1,q2,q3;
vedicmultiplier_2_bit dum1(a[1:0],b[1:0],q0);
vedicmultiplier_2_bit dum2(a[3:2],b[1:0],q1);
vedicmultiplier_2_bit dum3(b[3:2],a[1:0],q2);
vedicmultiplier_2_bit dum4(a[3:2],b[3:2],q3);
wire [7:0] temp1,temp2,temp3;
assign temp1 = {q3,4'b0000};
assign temp2 =  {2'b00,q2,2'b00} + {2'b00,q1,2'b00};
assign temp3 =  {4'b0000,q0};
assign result = temp1 + temp2 + temp3;
endmodule


module vedicmultiplier_8_bit(a,b,result);
input [7:0] a,b;
output [15:0] result;
wire [7:0] q0,q1,q2,q3;
vedicmultiplier_4_bit dumm1(a[3:0],b[3:0],q0);
vedicmultiplier_4_bit dumm2(a[3:0],b[7:4],q1);
vedicmultiplier_4_bit dumm3(a[7:4],b[3:0],q2);
vedicmultiplier_4_bit dumm4(a[7:4],b[7:4],q3);
wire [15:0] temp1,temp2,temp3;
assign temp1 = {q3,8'b00000000};
assign temp2 = {4'b0000,q2,4'b0000} + {4'b0000,q1,4'b0000};  
assign temp3 = {8'b00000000,q0};
assign result = temp1 + temp2 + temp3;
endmodule





