
`ifndef TB_EQUEUE_ISSUE_V
`define TB_EQUEUE_ISSUE_V

`timescale 1ns/1ps

module tb_equeue_issue();
      reg                  clk;
      reg                  reset;
     // equeue int inputs
      reg [ 5:0]              dispatch_equeueint_opcode;
      reg [ 5:0]              dispatch_equeueint_rdtag;
      reg [ 5:0]              dispatch_equeueint_rstag;
      reg [ 5:0]              dispatch_equeueint_rttag;
      reg [31:0]              dispatch_equeueint_rsdata;
      reg [31:0]              dispatch_equeueint_rtdata;
      reg                     dispatch_equeueint_rsvalid;
      reg                     dispatch_equeueint_rtvalid;
      reg                     dispatch_equeueint_en;

      reg                     dispatch_equeue_rdtag;
      reg                     dispatch_equeue_rstag;

      reg [15:0]              dispatch_equeue_imm;
      reg                     dispatch_equeuediv_en;
      reg                     dispatch_equeuels_en;
      reg                     dispatch_equeuemult_en;

      
      wire                     equeueint_dispatch_ready;

      wire                    dispatch_equeueint_ready;

      //equeue outputs -> issue unit inputs
      wire  [ 5:0]             equeueint_issueint_opcode;
      wire  [31:0]             equeueint_issueint_rsdata;
      wire  [31:0]             equeueint_issueint_rtdata;
      wire  [ 5:0]             equeueint_issueint_rdtag;

      wire                     equeuels_issuels_opcode;
      wire  [31:0]             equeuels_issuels_rsdata;
      wire  [31:0]             equeuels_issuels_rtdata;
      wire  [ 5:0]             equeuels_issuels_rttag;

      wire  [31:0]             equeuediv_issuediv_rsdata;
      wire  [31:0]             equeuediv_issuediv_rtdata;
      wire  [ 5:0]             equeuediv_issuediv_rdtag;

      wire  [31:0]             equeuemult_issuemult_rsdata;
      wire  [31:0]             equeuemult_issuemult_rtdata;
      wire  [ 5:0]             equeuemult_issuemult_rdtag;
      // issue outputs -> equeue input
      wire                    equeueint_issueint_ready;
      wire                    equeuemult_issuemult_ready;
      wire                    equeuediv_issuediv_ready;
      wire                    equeuels_issuels_ready;

      wire                    issueint_carryout;
      wire                    issueint_overflow;

      wire                    issueint_equeueint_done;
      wire                    issuediv_equeuediv_done;
      wire                    issuemult_equeuemult_done;
      wire                    issuels_equeuels_done;

      wire [31:0]             cdb_data;
      wire [ 5:0]             cdb_tag;
      wire                    cdb_valid;
      wire                    cdb_branch;
      wire                    cdb_branch_taken;


   initial begin
      clk <= 1'b0;
      forever #5 clk <= ~clk;
   end

   initial begin
      integer i;
      cb.reset <= 1'b1; #10; cb.reset <= 1'b0;
      reset_tb_signals;
      @(posedge clk);
      cb.dispatch_equeueint_en      <= 1;
      cb.dispatch_equeueint_opcode  <=6'h20;
      cb.dispatch_equeueint_rdtag   <= 6'h1;
      cb.dispatch_equeueint_rstag   <= 6'h2;
      cb.dispatch_equeueint_rttag   <= 6'h3;
      cb.dispatch_equeueint_rsdata  <= 32'h2;
      cb.dispatch_equeueint_rtdata  <= 32'h2;
      cb.dispatch_equeueint_rsvalid <= 1;
      cb.dispatch_equeueint_rtvalid <= 1;
      @(posedge clk);
      cb.dispatch_equeueint_en      <= 1;
      cb.dispatch_equeueint_opcode  <= 6'h0;
      cb.dispatch_equeueint_rdtag   <= 6'h3;
      cb.dispatch_equeueint_rstag   <= 6'h4;
      cb.dispatch_equeueint_rttag   <= 6'h5;
      cb.dispatch_equeueint_rsdata  <= 32'h4;
      cb.dispatch_equeueint_rtdata  <= 32'h4;
      cb.dispatch_equeueint_rsvalid <= 1;
      cb.dispatch_equeueint_rtvalid <= 1;

   end

   task reset_tb_signals;
      begin
      cb.dispatch_equeueint_opcode<=0;
      cb.dispatch_equeueint_rdtag<=0;
      cb.dispatch_equeueint_rstag<=0;
      cb.dispatch_equeueint_rttag<=0;
      cb.dispatch_equeueint_rsdata<=0;
      cb.dispatch_equeueint_rtdata<=0;
      cb.dispatch_equeueint_rsvalid<=0;
      cb.dispatch_equeueint_rtvalid<=0;
      cb.dispatch_equeuediv_en<=0;
      cb.dispatch_equeuels_en<=0;
      cb.dispatch_equeuemult_en<=0;
      cb.dispatch_equeueint_en<=0;
      end
   endtask

   clocking cb @(posedge clk);
      default input #1 output #2;
      output reset;
      output dispatch_equeueint_opcode;
      output dispatch_equeueint_rdtag;
      output dispatch_equeueint_rstag;
      output dispatch_equeueint_rttag;
      output dispatch_equeueint_rsdata;
      output dispatch_equeueint_rtdata;
      output dispatch_equeueint_rsvalid;
      output dispatch_equeueint_rtvalid;
      output dispatch_equeueint_en;
      output dispatch_equeuediv_en;
      output dispatch_equeuels_en;
      output dispatch_equeuemult_en;
      input  dispatch_equeueint_ready;

      //equeue outputs -> issue unit inputs
      input  equeueint_issueint_opcode;
      input  equeueint_issueint_rsdata;
      input  equeueint_issueint_rtdata;
      input  equeueint_issueint_rdtag;

      input  equeuels_issuels_opcode;
      input  equeuels_issuels_rsdata;
      input  equeuels_issuels_rtdata;
      input  equeuels_issuels_rttag;

      input  equeuediv_issuediv_rsdata;
      input  equeuediv_issuediv_rtdata;
      input  equeuediv_issuediv_rdtag;

      input  equeuemult_issuemult_rsdata;
      input  equeuemult_issuemult_rtdata;
      input  equeuemult_issuemult_rdtag;
      // issue outputs -> equeue input
      input  equeueint_issueint_ready;
      input  equeuemult_issuemult_ready;
      input  equeuediv_issuediv_ready;
      input  equeuels_issuels_ready;

      input  issueint_carryout;
      input  issueint_overflow;

      input  issueint_equeueint_done;
      input  issuediv_equeuediv_done;
      input  issuemult_equeuemult_done;
      input  issuels_equeuels_done;

      input  cdb_data;
      input  cdb_tag;
      input  cdb_valid;
      input  cdb_branch;
      input  cdb_branch_taken;

   endclocking

   equeueint equeueint (
      .clk              ( clk                       ),
      .reset            ( reset                     ),
      .dispatch_opcode  ( dispatch_equeueint_opcode ),
      .dispatch_en      ( dispatch_equeueint_en     ),
      .dispatch_ready   ( equeueint_dispatch_ready  ),
      .dispatch_rdtag   ( dispatch_equeueint_rdtag  ),
      .dispatch_rstag   ( dispatch_equeueint_rstag     ),
      .dispatch_rttag   ( dispatch_equeueint_rttag     ),
      .dispatch_rsdata  ( dispatch_equeueint_rsdata    ),
      .dispatch_rtdata  ( dispatch_equeueint_rtdata    ),
      .dispatch_rsvalid ( dispatch_equeueint_rsvalid   ),
      .dispatch_rtvalid ( dispatch_equeueint_rtvalid   ),
      .cdb_tag          ( cdb_tag                   ),
      .cdb_valid        ( cdb_valid                 ),
      .cdb_data         ( cdb_data                  ),
      .issueint_opcode  ( equeueint_issueint_opcode ),
      .issueint_rdtag   ( equeueint_issueint_rdtag  ),
      .issueint_rsdata  ( equeueint_issueint_rsdata ),
      .issueint_rtdata  ( equeueint_issueint_rtdata ),
      .issueint_ready   ( equeueint_issueint_ready  ),
      .issueint_done    ( issueint_equeueint_done   )
   );

   equeuels equeuels (
      .clk              ( clk                      ),
      .reset            ( reset                    ),
      .dispatch_opcode  ( dispatch_equeuels_opcode ),
      .dispatch_en      ( dispatch_equeuels_en     ),
      .dispatch_ready   ( equeuels_dispatch_ready  ),
      .dispatch_offset  ( dispatch_equeue_imm      ),
      .dispatch_rttag   ( dispatch_equeue_rttag    ),
      .dispatch_rstag   ( dispatch_equeue_rstag    ),
      .dispatch_rsdata  ( dispatch_equeue_rsdata   ),
      .dispatch_rtdata  ( dispatch_equeue_rtdata   ),
      .dispatch_rsvalid ( dispatch_equeue_rsvalid  ),
      .dispatch_rtvalid ( dispatch_equeue_rtvalid  ),
      .cdb_tag          ( cdb_tag               ),
      .cdb_valid        ( cdb_valid                ),
      .cdb_data         ( cdb_data                  ),
      .issuels_opcode   ( equeuels_issuels_opcode  ),
      .issuels_rttag    ( equeuels_issuels_rttag   ),
      .issuels_addr     ( equeuels_issuels_addr    ),
      .issuels_data     ( equeuels_issuels_data    ),
      .issuels_ready    ( equeuels_issuels_ready   ),
      .issuels_done     ( issuels_equeuels_done    )
   );

   equeuediv equeuediv (
      .clk              ( clk                       ),
      .reset            ( reset                     ),
      .dispatch_en      ( dispatch_equeuediv_en     ),
      .dispatch_ready   ( equeuediv_dispatch_ready  ),
      .dispatch_rdtag   ( dispatch_equeue_rdtag     ),
      .dispatch_rstag   ( dispatch_equeue_rstag     ),
      .dispatch_rttag   ( dispatch_equeue_rttag     ),
      .dispatch_rsdata  ( dispatch_equeue_rsdata    ),
      .dispatch_rtdata  ( dispatch_equeue_rtdata    ),
      .dispatch_rsvalid ( dispatch_equeue_rsvalid   ),
      .dispatch_rtvalid ( dispatch_equeue_rtvalid   ),
      .cdb_tag          ( cdb_tag                ),
      .cdb_valid        ( cdb_valid                 ),
      .cdb_data         ( cdb_data                   ),
      .issuediv_rdtag   ( equeuediv_issuediv_rdtag  ),
      .issuediv_rsdata  ( equeuediv_issuediv_rsdata ),
      .issuediv_rtdata  ( equeuediv_issuediv_rtdata ),
      .issuediv_ready   ( equeuediv_issuediv_ready  ),
      .issuediv_done    ( issuediv_equeuediv_done   )
   );

   equeuemult equeuemult (
      .clk              ( clk                         ),
      .reset            ( reset                       ),
      .dispatch_en      ( dispatch_equeuemult_en      ),
      .dispatch_ready   ( equeuemult_dispatch_ready   ),
      .dispatch_rdtag   ( dispatch_equeue_rdtag       ),
      .dispatch_rstag   ( dispatch_equeue_rstag       ),
      .dispatch_rttag   ( dispatch_equeue_rttag       ),
      .dispatch_rsdata  ( dispatch_equeue_rsdata      ),
      .dispatch_rtdata  ( dispatch_equeue_rtdata      ),
      .dispatch_rsvalid ( dispatch_equeue_rsvalid     ),
      .dispatch_rtvalid ( dispatch_equeue_rtvalid     ),
      .cdb_tag          ( cdb_tag                  ),
      .cdb_valid        ( cdb_valid                   ),
      .cdb_data         ( cdb_data                     ),
      .issuemult_rdtag  ( equeuemult_issuemult_rdtag  ),
      .issuemult_rsdata ( equeuemult_issuemult_rsdata ),
      .issuemult_rtdata ( equeuemult_issuemult_rtdata ),
      .issuemult_ready  ( equeuemult_issuemult_ready  ),
      .issuemult_done   ( issuemult_equeuemult_done   )
   );


   issue issue(
      .clk              (clk                          ),
      .reset            (reset                        ),

      .issueint_opcode  (equeueint_issueint_opcode    ),
      .issueint_rsdata  (equeueint_issueint_rsdata    ),
      .issueint_rtdata  (equeueint_issueint_rtdata    ),
      .issueint_rdtag   (equeueint_issueint_rdtag     ),

      .issuels_opcode   (equeuels_issuels_opcode      ),
      .issuels_data    (equeuels_issuels_rsdata      ),
      .issuels_addr    (equeuels_issuels_rtdata      ),
      .issuels_rttag    (equeuels_issuels_rttag       ),

      .issuediv_rsdata  (equeuediv_issuediv_rsdata    ),
      .issuediv_rtdata  (equeuediv_issuediv_rtdata    ),
      .issuediv_rdtag   (equeuediv_issuediv_rdtag     ),

      .issuemult_rsdata (equeuemult_issuemult_rsdata ),
      .issuemult_rtdata (equeuemult_issuemult_rtdata ),
      .issuemult_rdtag  (equeuemult_issuemult_rdtag  ),

      .issueint_ready   (equeueint_issueint_ready     ),
      .issuemult_ready  (equeuemult_issuemult_ready   ),
      .issuediv_ready   (equeuediv_issuediv_ready     ),
      .issuels_ready    (equeuels_issuels_ready       ),

      .issueint_carryout(issueint_carryout            ),
      .issueint_overflow(issueint_overflow            ),

      .issueint_equeueint_done    (issueint_equeueint_done        ),
      .issuediv_equeuediv_done    (issuediv_equeuediv_done        ),
      .issuemult_equeuemult_done  (issuemult_equeuemult_done      ),
      .issuels_equeuels_done      (issuels_equeuels_done          ),

      .cdb_data         (cdb_data                      ),
      .cdb_tag          (cdb_tag                      ),
      .cdb_valid        (cdb_valid                    ),
      .cdb_branch       (cdb_branch                   ),
      .cdb_branch_taken (cdb_branch_taken             )
   );



endmodule

`endif
