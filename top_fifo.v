// Code your testbench here
// or browse Examples
module top_fifo #(parameter ADDRESS_SIZE=4,
                  parameter DATASIZE=8)(
  input wclk,rclk,
  input [DATASIZE-1:0] wdata,
  input wclken,ren,
  input wreset_n,rrest_n,winc,rinc,
  output [DATASIZE-1:0] rdata,
  output wfull,rempty
  
);
  
  
  fifo_ram  #(.ADDRESS_SIZE(ADDRESS_SIZE), .DATASIZE(DATASIZE)) fifo_mem  (
    .wdata(wdata),
    .raddr(rbin),
    .waddr(wbin),
    .wclk(wclk),
    .winc(winc),
    .wfull(wfull),
    .rdata(rdata));
  
  write_domain_synchronizer #(.ADDRESS_SIZE(ADDRESS_SIZE)) write_sync(
    .rptr(rptr),
    .wclk(wclk),
    .wreset_n(wreset_n),
    .rptr_q(rptr_q));
    
    read_domain_synchronizer #(.ADDRESS_SIZE(ADDRESS_SIZE)) read_sync (
      .wptr(wptr),
      .wptr_q(wptr_q),
      .rclk(rclk),
      .rreset_n(rreset_n));
    
    write_full #(.ADDRESS_SIZE (ADDRESS_SIZE)) w_full(
      .wclk(wclk),
      .wreset_n(wreset_n),
      .winc(winc),
      .rptr(rptr_q),
      .wbin(wbin),
      .wptr(wptr),
      .wfull(wfull));
  
    
    read_empty #(.ADDRESS_SIZE(ADDRESS_SIZE)) r_empty(
      .wptr(wptr_q),
      .rclk(rclk),
      .rreset_n(rreset_n),
      .rinc(rinc),
      .rbin(rbin),
      .rptr(rptr),
      .rempty(rempty));

endmodule
