module  read_empty #(parameter ADDRESS_SIZE =4) (
  input [ADDRESS_SIZE:0] wptr,
input rclk,
input rreset_n,
  input rinc,
  output reg [ADDRESS_SIZE-1:0] rbin,
  output reg [ADDRESS_SIZE:0] rptr,
output reg rempty);
  
  assign rbin_reg = rbin + (!rempty & rinc);
  assign rgray_next = (rbin_reg >> 1) ^ rbin_reg;
  assign empty= (rptr==wptr);
  
  always @(posedge rclk or negedge rreset_n) begin
    if(!rreset_n) begin
      rbin<=0;
      rptr<=0;
      rempty<=1'b0;
    end
    else begin
      rbin <= rbin_reg;
      rptr<=rgray_next;
      rempty<=empty;
      
    end
  end
    
endmodule
