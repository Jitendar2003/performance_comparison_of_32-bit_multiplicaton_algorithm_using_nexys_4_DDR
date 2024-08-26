`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2024 16:40:36
// Design Name: 
// Module Name: booth_tb
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


module booth_tb();
parameter N = 8;
reg [N-1:0] data_inM,data_inQ;
reg start,clk_100MHz;
wire [N+N-1:0] ans;
booth bt(start,clk_100MHz,data_inM,data_inQ,ans);
initial 
begin
start = 1'b1;
clk_100MHz = 1'b0;
end
always #5 clk_100MHz=~clk_100MHz;
initial 
begin
#15 data_inM=8'b00011111;data_inQ=8'b00100111;
 $display($time,"data_inM=%b,data_inQ=%b,ans=%b",data_inM,data_inQ,ans);
#500 $finish;
end
endmodule
