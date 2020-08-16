
module write_domain_synchronizer #(parameter ADDRESS_SIZE=4) (
  input [ADDRESS_SIZE:0] rptr,
input wclk,
input wreset_n,
  output reg [ADDRESS_SIZE:0] rptr_q);
  
  reg [ADDRESS_SIZE:0] rptr_q1;
  always @(posedge wclk or negedge wreset_n) begin
    
    if(!wreset_n) {rptr_q,rptr_q1} <= 0;
    else begin
      rptr_q<=rptr;
      rptr_q1<=rptr_q;
    end
    
  end
  
  
endmodule
