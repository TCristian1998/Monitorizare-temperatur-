`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:08:20 11/14/2020 
// Design Name: 
// Module Name:    output_display 
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


module output_display (
output reg [7:0] coded_out_o,
output reg alert_o,
input [15:0] temp_Q_i,
input [15:0] temp_R_i,
input [7:0] active_sensors_nr);

reg [15:0] a;
always @(*) begin
a= temp_Q_i; // a este temperatura medie pe care o obtinem
if(temp_R_i*2 >=active_sensors_nr) begin
							                  a=a+1;  
											  end
//putem considera ca restul reprezinta un procent din deimpartit. Daca procentul este mai mare ca 0.5 
//atunci putem aproxima temperatura medie ca fiind urmatorul intreg
if(a  < 19 ) begin // pt a codifica temperatura medie o sa comparam a cu fiecare numar din tabelul dat
					coded_out_o =  8'b00000001;
					alert_o = 1;	
					end 
 
if(a  == 19 ) begin    
					coded_out_o =  8'b 00000001;
					alert_o = 0;	
					end 
 
if(a  == 20 ) begin    
					coded_out_o =  8'b 00000011;
					alert_o = 0;	
					end 
		
 
if(a  == 21 ) begin    
					coded_out_o =  8'b 00000111;
					alert_o = 0;	
					end 

 
if(a  == 22 ) begin    
					coded_out_o =  8'b 00001111;
					alert_o = 0;	
					end 

 
if(a  == 23 ) begin    
					coded_out_o =  8'b 00011111;
					alert_o = 0;	
					end 

 
if(a  == 24 ) begin    
					coded_out_o =  8'b 00111111;
					alert_o = 0;	
					end 
					
 
if(a  == 25 ) begin    
					coded_out_o =  8'b 01111111;
					alert_o = 0;	
					end 
					
 
if(a  == 26 ) begin   
					coded_out_o =  8'b 11111111;
					alert_o = 0;	
					end 
 
if(a  > 26 ) begin    
					coded_out_o =  8'b11111111;
					alert_o = 1;	
					end 
										
end							
										
endmodule



