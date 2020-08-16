
module write_full #(parameter ADDRESS_SIZE = 4)(
input wclk,
input wreset_n,
input winc,
  input [ADDRESS_SIZE-1:0] rptr,
  output reg [ADDRESS_SIZE-1:0] wbin,
  output reg [ADDRESS_SIZE:0] wptr,
output  reg wfull);
  
  
  assign full = (rptr[ADDRESS_SIZE] != wptr[ADDRESS_SIZE]) &&
    (rptr[ADDRESS_SIZE-1] != wptr[ADDRESS_SIZE-1]) &&
    (rptr[ADDRESS_SIZE-2:0] == wptr[ADDRESS_SIZE-2:0]);
  
  assign bin_reg = wbin + (winc && (!wfull));
  assign gray_next = (bin_reg >>1) ^ bin_reg;
  
  always @(posedge wclk or negedge wreset_n) begin
    
    if(!wreset_n) wbin<=0;
    else wbin<=bin_reg;
  end
  
   always @(posedge wclk or negedge wreset_n) begin
    
     if(!wreset_n) wptr<=0;
    else wptr<=gray_next;
  end
  
  always @(posedge wclk or negedge wreset_n) begin
    if(!wreset_n) wfull<=1'b0;
    else wfull <= full;
  end
endmodule

