module read_domain_synchronizer #(parameter ADDRESS_SIZE=4) (
  input [ADDRESS_SIZE:0] wptr,
  output  reg [ADDRESS_SIZE:0] wptr_q,
  input rclk,
  input rreset_n);
  
  reg [ADDRESS_SIZE:0] wptr_q1;
  
  always @(posedge rclk or negedge rreset_n) begin
    if(!rreset_n) begin
      wptr_q1 <= 0;
      wptr_q <= 0;
    end
    else begin
      wptr_q1<=wptr;
      wptr_q<=wptr_q1;
    end
  end
endmodule
