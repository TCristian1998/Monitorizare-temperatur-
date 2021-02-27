`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:44 11/14/2020 
// Design Name: 
// Module Name:    division 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module division (
output reg[15:0] Q,
output reg[15:0] R,
input [15:0] N,
input [15:0] D);

integer i;
always @(*) begin

	Q = 0;
	R = 0;
	for (i = 15; i >= 0; i = i - 1) begin
		R = R << 1 ;         
		R[0] = N[i] ;         
		if (R >= D) begin
			R = R - D;
			Q[i] = 1;
		end
	end
end
endmodule

