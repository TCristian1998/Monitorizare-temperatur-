`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:18 11/14/2020 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input(
temp_sum_o,
nr_active_sensors_o,
sensors_data_i,
sensors_en_i
);

parameter width = 200;  // putem avea maxim 200 de senzori deci val parametruluieste 200

output reg [15:0] temp_sum_o;
output reg [7:0] nr_active_sensors_o;
input [ 8*width-1 : 0 ] sensors_data_i;
input [ width-1 : 0 ] sensors_en_i ;

integer i;

always @(*) begin

	nr_active_sensors_o = 0;
	temp_sum_o = 0;
	for (i = width - 1; i >= 0; i = i - 1) begin  // verificam fiecare bit a variabilei sensors_en_i
		if (sensors_en_i[i] == 1) begin  // daca bitul este 1(adica este activ) atunci vom mari numarul senzorilor activi si vom aduna 
		//temperatura senzoruluirespecti a suma totala a temperaturilor
			nr_active_sensors_o = nr_active_sensors_o + 1;
			temp_sum_o = temp_sum_o + sensors_data_i[( 8*(i + 1) - 1) -: 8]; // fiecarui bit din sensors_en_i corespund 8 biti din sensors_data_i
			// => pozitiei i din sensors_en_i ii corespund bitii de la 8(i+1)-1 pana la 8(i+1) - 8
		end
	end
end

endmodule



