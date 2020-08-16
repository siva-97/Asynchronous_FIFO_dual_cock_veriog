module fifo_ram #(parameter ADDRESS_SIZE=4,
                  parameter DATASIZE = 8) (
  
  input [DATASIZE-1:0] wdata,
  input [ADDRESS_SIZE-1:0] raddr,
  input [ADDRESS_SIZE-1:0] waddr,
  input wclken,wclk,wfull,
  output [DATASIZE-1:0] rdata
);
  
  localparam DEPTH= 1<< ADDRESS_SIZE;
  reg[DATASIZE-1] reg_mem[DEPTH-1];

  assign rdata = reg_mem[raddr];
  
  always @(posedge wclk) begin
    
    if(!wfull & wclken) reg_mem[waddr] <=wdata;
  end
  
  
endmodule
