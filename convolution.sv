`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2022 11:43:16
// Design Name: 
// Module Name: convo
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

module convo(
    input clock,
    input reset,
    input [7:0] in [6:0][6:0],
    input wire [7:0] filter [2:0][2:0],
//    input [3:0] stride,
    output reg [7:0] out [2:0][2:0]
    );
    
parameter stride=2;
parameter m=7;
parameter k=2;

//reg [7:0] filter [2:0][2:0];
reg [7:0] window [2:0][2:0];
reg [7:0] kernel [2:0][2:0];
reg [7:0] mult;
integer row,col;
integer i=0,j=0;
reg [2:0] start_r;
reg [2:0] start_c ;
//always@(in) begin


//flip the filter matrix along row and column
//task flip_filter();
//    for (int i=0;i<=k;i+=1)begin
//        for (int j=0;j<=k;j+=1) begin
//            kernel[i][j]=filter[k-i][k-j];
//     end
//     end
//endtask


initial begin
flip_filter(filter,k,kernel);
$display ("Input Kernel:");
for (int i=0;i<=k;i++)
$display ("%d %d %d ", filter[i][0], filter[i][1], filter[i][2]); 

$display ("Flipped Kernel:");
for (int i=0;i<=k;i++)
$display ("%d %d %d ", kernel[i][0], kernel[i][1], kernel[i][2]); 
//get_window(0,0,window,in, 2);

$display ("Input matrix:");
for (int i=0;i<m;i++)
$display ("%d %d %d %d %d %d %d", in[i][0],in[i][1],in[i][2],in[i][3],in[i][4],in[i][5],in[i][6]);

$display("Convolution:");
for (int i=0;i<m-k;i+=stride)
for (int j=0;j<m-k;j+=stride) begin
get_window(i,j,window,in,k);
calculator(window, kernel, k, mult);
//$display ("window:%d Kernel:%d ", window[0][0], kernel[0][0]); 

end

end

assign out=window;
endmodule


task flip_filter(input [7:0] filter [2:0][2:0], k, output [7:0] flip [2:0][2:0]);
    for (int i=0;i<=k;i+=1)begin
        for (int j=0;j<=k;j+=1) begin
            flip[i][j]=filter[k-i][k-j];
//                $display ("filter is %d",filter[k-i][k-j]);
     end
     end
endtask

task get_window(input [2:0] start_r, input [2:0] start_c, output [7:0] window [2:0][2:0], input [7:0] in [6:0][6:0], k);
automatic int wi=0, wj=0;
//$display ("called");
//$display ("strart_r is %d, start_c is",start_r,start_c);

for (int i=start_r,wi=0;i<=start_r+k;i+=1,wi+=1) begin
    for (int j=start_c,wj=0;j<=start_c+k;j+=1,wj+=1) begin
        window[wi][wj]=in[i][j];
        //wj+=1;
//        $display ("wi is %d",wi);
//        $display ("wj is %d",wj);
//        $display ("win is %d",window[wi][wj]);
        end
        //wi+=1;
end
endtask

task calculator (input [7:0] window [2:0][2:0], input [7:0] kernel [2:0][2:0], k, output [7:0] mult);
mult=0;
for (int i=0;i<=k;i+=1)
for(int j=0;j<=k;j+=1) begin
mult+=window[i][j]*kernel[i][j];
//$display ("window:%d Kernel:%d ", window[i][j], kernel[i][j]); 
end
$display ("%d ", mult); 

endtask