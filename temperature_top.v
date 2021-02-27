`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:23 11/14/2020 
// Design Name: 
// Module Name:    temperature_top 
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
module temperature_top(
led_output_o,
alert_o,
sensors_data_i,
sensors_en_i);



parameter width = 200;

output [7:0] led_output_o;
output alert_o;
input [ 8*width-1 : 0 ] sensors_data_i;
input [ width-1 : 0 ] sensors_en_i ;



wire [15:0] temp_sum_o;
wire [7:0] nr_active_sensors_o;
wire [15:0] Q;
wire [15:0] R;

sensors_input a1(temp_sum_o, nr_active_sensors_o, sensors_data_i, sensors_en_i);

wire [15:0]  N;
assign N = nr_active_sensors_o;

division a2( Q, R, temp_sum_o, N );

output_display a3( led_output_o, alert_o, Q, R, nr_active_sensors_o);

endmodule