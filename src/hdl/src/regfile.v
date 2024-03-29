
`ifndef REGFILE_V
`define REGFILE_V

`timescale 1ns/1ps

module regfile #(
   parameter integer W_ADDR =  5,
   parameter integer W_DATA = 32
)(
   input                   clk,
   input                   reset,

   // Single write port, data comes from CDB and wen and address
   // is encoded as one-hot from Register Status Table. If one-hot
   // vector is all zeros then don't write anything.
   input      [W_DATA-1:0] cdb_wdata,
   input      [W_DATA-1:0] rst_wen_onehot,

   // 2 read ports for RS and RT registers.
   input      [W_ADDR-1:0] dispatch_rsaddr,
   input      [W_ADDR-1:0] dispatch_rtaddr,
   input      [W_ADDR-1:0] debug_addr,
   output reg [W_DATA-1:0] dispatch_rsdata,
   output reg [W_DATA-1:0] dispatch_rtdata,
   output reg [W_DATA-1:0] debug_data
);

   localparam integer N_ENTRY = 2 ** W_ADDR;

   reg  [W_DATA-1:0] mem   [N_ENTRY-1:0];
   reg  [W_DATA-1:0] mem_r [N_ENTRY-1:0];

   always @(*) begin: reg_file_write_proc
      integer i, count;
      for (i = 0; i < N_ENTRY; i = i + 1) begin
         mem[i] = (rst_wen_onehot[i]) ? cdb_wdata : mem_r[i];
      end

      // Make sure one-hot vector has one (or zero) active bits.
      //count = 0;
      //for (i = 0; i < N_ENTRY; i = i + 1) if (rst_wen_onehot[i]) count = count + 1;
      //if (count > 1) $display("@%p [REGFILE] FATAL: More than one write in one-hot vector 0b%b", $time, rst_wen_onehot);
   end

   always @(*) begin : reg_file_read_proc
      dispatch_rsdata = mem_r[dispatch_rsaddr];
      dispatch_rtdata = mem_r[dispatch_rtaddr];
      debug_data      = mem_r[debug_addr];
   end

   always @(posedge clk) begin : reg_file_mem_assign
      integer i;
      for (i = 0; i < N_ENTRY; i = i + 1) begin
         //mem_r[i] <= (reset) ? 'h0 : mem[i];
         mem_r[i] <= (reset) ? i : mem[i];
      end
   end

endmodule

`endif

