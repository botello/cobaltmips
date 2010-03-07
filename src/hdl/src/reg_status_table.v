`ifndef RST_V
`define RST_V

module reg_status_table(
   input             clk,
   input             rst,
   input      [ 6:0] wdata0_rst,
   input      [ 4:0] waddr0_rst,
   input             wen0_rst,
   input      [ 6:0] wdata_rst1,
   input      [31:0] wen_rst1,
   input      [ 4:0] rsaddr_rst,
   output reg [ 5:0] rstag_rst,
   output reg        rsvalid_rst,
   input      [ 4:0] rtaddr_rst,
   output reg [ 5:0] rttag_rst,
   output reg        rtvalid_rst,
   input             cdb_valid,
   input      [ 5:0] cdb_tag_rst,
   output reg [31:0] wen_regfile_rst
);

   reg [6:0] reg_status_table   [0:31];
   reg [6:0] reg_status_table_r [0:31];

   always @(*) begin : reg_status_table_wrport1
      integer i; 
      for (i=0; i<32; i=i+1) begin
          reg_status_table[i] = (wen_rst1 == i) ? wdata_rst1 : reg_status_table_r[i];
      end  
   end

   always @(*) begin : reg_status_table_wrport0
       reg_status_table[waddr0_rst] = (wen0_rst) ? wdata0_rst : reg_status_table_r[waddr0_rst];
   end

   always @(posedge clk) begin : reg_status_table_reg
	integer i;
	for (i=0; i<32; i= i+1) begin
	   reg_status_table_r[i] <= (rst) ? 'h0: reg_status_table[i];
	end
   end

   always @(*) begin : reg_status_table_reg_rdproc

       rstag_rst       = reg_status_table_r [rsaddr_rst][5:0];
       rsvalid_rst     = reg_status_table_r [rsaddr_rst][6]; 
       rttag_rst       = reg_status_table_r [rtaddr_rst][5:0];
       rtvalid_rst     = reg_status_table_r [rtaddr_rst][6]; 
   end

   always @(*) begin : reg_status_table_wen_proc
     integer i;
     for (i=0; i<32; i=i+1) begin
        reg_status_table[i]= reg_status_table_r[i];
        wen_regfile_rst[i]  = 1'b0;
     end

     for (i=0; i<32; i=i+1) begin
	     if (reg_status_table [i][6] && cdb_valid && cdb_tag_rst == reg_status_table[i]) begin
            reg_status_table[i] = 32'h0;	   
            wen_regfile_rst[i]  = 1'b1;
	     end	
	  end
   end  
endmodule

`endif

