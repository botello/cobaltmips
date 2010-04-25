`ifndef ISSUE_V
`define ISSUE_V

module issue (
   input              clk,
   input              reset,

   input [3:0]        opcode,
   input [31:0]       rsdata,
   input [31:0]       rtdata,
   input [ 5:0]       rdtag,

   input              ready_int,
   input              ready_mult,
   input              ready_div,
   input              ready_ld_buf,

   output reg         issue_int,
   output reg         issue_mult,
   output reg         issue_div,
   output reg         issue_ld_buf,
   output             issue_carryout,
   output             issue_overflow,
   output reg         issue_div_done,

   output reg [31:0]  cdb_out,
   output     [ 5:0]  cdb_tagout,
   output             cdb_valid,
   output             cdb_branch,
   output             cdb_branch_taken
);
   reg  [7:0] cdb_slot;
   wire [3:0] selector;
   reg        LRU;

   wire [31:0]   int_out;
   wire [31:0]   div_out;
   wire [31:0]   mult_out;
   wire [31:0]   ld_buf_out;

   wire div_exec_ready;

   //CDB reservation registers
   always @(posedge clk) begin : cdb_slots
      if (reset) begin
         cdb_slot <= 7'h0;
      end
      else begin
         cdb_slot [7] <= ready_div;
         cdb_slot [6] <= cdb_slot[7];
         cdb_slot [5] <= cdb_slot[6];
         cdb_slot [4] <= cdb_slot[5] | ready_mult;
         cdb_slot [3] <= cdb_slot[4];
         cdb_slot [2] <= cdb_slot[3];
         cdb_slot [1] <= cdb_slot[2] | (ready_int | ready_ld_buf);
         cdb_slot [0] <= cdb_slot[1];
      end
   end

   // ISSUE UNIT LOGIC
   //1. Check if ready signal is activated by the exec queues
   //   can be written into reservation table. 
   //   Check if prior locality entry point on the exec unit
   //   isn't 1.
   //2. In case of divisions: if div_exec_ready(busy) is active high
   //   can't write on the table and issue_div_done cannot be asserted
   //3. If the ready signals are present, the integer exec queue and
   //   memory access, we need to arbitrate using a bit of LRU
   always @(*) begin: issue_unit_logic
      if (reset) begin
         issue_int    = 1'b0;
         issue_mult   = 1'b0;
         issue_div    = 1'b0;
         issue_ld_buf = 1'b0;
      end
      else begin
         if (ready_int && cdb_slot[2] != 1'b1 ) begin
            issue_int = 1'b1;
         end
         else if (ready_mult && cdb_slot[5] != 1'b1) begin
            issue_mult = 1'b1;
         end
         else if (ready_div && div_exec_ready != 1'b1) begin
            issue_div = 1'b1;
         end
         else if (ready_ld_buf && cdb_slot[2] != 1'b1) begin
            issue_ld_buf = 1'b1;
         end
         else begin
            if (ready_int && ready_ld_buf) begin
                //LRU = 1'b0;
            end
            else begin
               //LRU = 1'b1;
            end
         end

      end
   end

   assign selector = {ready_int, ready_mult, ready_div, ready_ld_buf};

   always @(*) begin : mux_sel
      case (selector)
         4'b0001: begin
           cdb_out = ld_buf_out; 
         end
         4'b0010: begin
           cdb_out = div_out; 
         end
         4'b0100: begin
            cdb_out = mult_out;
         end
         4'b1000: begin
            cdb_out = int_out;
         end
         default: begin
            cdb_out = int_out;
         end
      endcase
   end

   // Module instantiations
   // integer exec unit
   issueint issueint (
      .clk                       (clk           ),
      .reset                     (reset         ),
      .issueint_ready            (ready_int     ),
      .issueint_opcode           (opcode        ),
      .issueint_rsdata           (rsdata        ),
      .issueint_rtdata           (rtdata        ),
      .issueint_rdtag            (rdtag         ),

      .issueint_out              (int_out       ),
      .issueint_rdtag_out        (cdb_tagout    ),

      .issueint_carryout         (issue_carryout),
      .issueint_overflow         (issue_overflow),
      .issueint_alubranch        (cdb_branch),
      .issueint_alubranch_taken  (cdb_branch_taken)
   );
   // divider exec unitt
  /* divider_wrapper divider_wrapper(
         .clk                 (clk       ),
         .reset               (reset     ),
         .issuediv_enable     (issue_div ),
         .issuediv_rsdata     (rsdata    ),
         .issuediv_rtdata     (rtdata    ),
         .issuediv_rdtag      (rdtag     ),

         .issuediv_busy       (div_exec_ready),
         .issuediv_out        (div_out   ),
         .issuediv_rdtag_out  (cdb_tagout)
   ); */
   //multiplier exec unit
  /* multiplier_wrapper multiplier_wrapper(
      .clk                 (clk        ),
      .reset               (reset      ),
      .issuemult_rsdata    (rsdata     ),
      .issuemult_rtdata    (rtdata     ),
      .issuemult_rdtag     (rdtag      ),

      .issuemult_out       (mult_out   ),
      .issuemult_rdtag_out (cdb_tagout )
   ); /*
   //load/store exec unit
   issuels issuels(
      .clk              (clk           ),
      .reset            (reset         ),
      .ls_ready_in      (ready_ld_buf  ),
      .ls_data          (rsdata        ),
      .ls_address       (rtdata        ),
      .ls_tag           (rdtag         ),
      .opcode           (opcode        ),

      .ls_done_out      (),
      .ls_data_out      (ld_buf_out    ),
      .ls_tag_out       (cdb_tagout    ),
      .ls_done          (),
      .ls_ready_out     ()
   ); */

endmodule

`endif
