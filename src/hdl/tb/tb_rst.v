
`ifndef TB_RST_V
`define TB_RST_V

`timescale 1ns/1ps

module tb_rst();

   reg  clk;
   reg  reset;

   reg  [ 5:0] dispatch_tag;
   reg         dispatch_valid;
   reg  [ 4:0] dispatch_addr;
   reg         dispatch_wen;

   // Write port 1 (clear port), signaled by CDB.
   reg  [ 5:0] cdb_tag;
   reg         cdb_valid;

   // Write enable for Register File which value has
   // been published by the CDB.
   wire [31:0] regfile_wen_onehot;

   // Read port RS.
   wire [ 5:0] dispatch_rstag;
   wire        dispatch_rsvalid;
   reg  [ 4:0] dispatch_rsaddr;

   // Read port RT.
   wire [ 5:0] dispatch_rttag;
   wire        dispatch_rtvalid;
   reg  [ 4:0] dispatch_rtaddr;

   initial begin : main_proc
      integer i;

      reset_testbench(5);

      //-----------------------------------------------------------------------
      // Case 0: don't take anything.
      //-----------------------------------------------------------------------
      @(posedge clk);
      for (i = 0; i < 32; i = i + 1) begin
         // Write port 0.
         dispatch_tag       <= i;
         dispatch_valid     <= 1;
         dispatch_addr      <= i;
         dispatch_wen       <= 0;
         // Write port 1.
         cdb_tag            <= 0;
         cdb_valid          <= 0;
         // RS and RT read ports.
         dispatch_rsaddr    <= 0;
         dispatch_rtaddr    <= 0;
         @(posedge clk);
      end
      reset_testbench(5);

      //-----------------------------------------------------------------------
      // Case 1:
      //  a. Fill all entries from dispatch.
      //  b. Read all entries.
      //  c. Clear all entries from CDB.
      //  d. Read, again, all entries.
      //-----------------------------------------------------------------------
      @(posedge clk);
      cdb_tag            <= 0;
      cdb_valid          <= 0;
      dispatch_rsaddr    <= 0;
      dispatch_rtaddr    <= 0;
      for (i = 0; i < 32; i = i + 1) begin
         dispatch_tag    <= i;
         dispatch_valid  <= 1;
         dispatch_addr   <= i;
         dispatch_wen    <= 1;
         @(posedge clk);
      end
      dispatch_tag   <= 0;
      dispatch_valid <= 0;
      dispatch_addr  <= 0;
      dispatch_wen   <= 0;

      for (i = 0; i < 32; i = i + 1) begin
         dispatch_rsaddr <= i;
         dispatch_rtaddr <= i;
         @(posedge clk);
      end
      for (i = 0; i < 32; i = i + 1) begin
         // Write port 1.
         cdb_tag            <= i;
         cdb_valid          <= 1;
         @(posedge clk);
      end
      cdb_tag            <= 0;
      cdb_valid          <= 0;
      for (i = 0; i < 32; i = i + 1) begin
         // RS and RT read ports.
         dispatch_rsaddr <= i;
         dispatch_rtaddr <= i;
         @(posedge clk);
      end

      reset_testbench(5);

   end

   task reset_testbench(integer unsigned cycles = 5);
      cb.dispatch_tag    <= 0;
      cb.dispatch_valid  <= 0;
      cb.dispatch_addr   <= 0;
      cb.dispatch_wen    <= 0;
      cb.cdb_tag         <= 0;
      cb.cdb_valid       <= 0;
      cb.dispatch_rsaddr <= 0;
      cb.dispatch_rtaddr <= 0;
      cb.reset <= 1'b1;
      repeat (cycles) @(posedge clk);
      cb.reset <= 1'b0;
   endtask

   initial begin
      clk <= 1'b0;
      forever #5 clk = ~clk;
   end

   clocking cb @(posedge clk);
      default input #1 output #2;
      output reset;
      output dispatch_tag;
      output dispatch_valid;
      output dispatch_addr;
      output dispatch_wen;
      output dispatch_rsaddr;
      output dispatch_rtaddr;
      output cdb_tag;
      output cdb_valid;

      input regfile_wen_onehot;
      input dispatch_rstag;
      input dispatch_rttag;
      input dispatch_rsvalid;
      input dispatch_rtvalid;
   endclocking

   rst rst (
      .clk                ( clk                 ),
      .reset              ( reset               ),
      .dispatch_tag       ( dispatch_tag        ),
      .dispatch_valid     ( dispatch_valid      ),
      .dispatch_addr      ( dispatch_addr       ),
      .dispatch_wen       ( dispatch_wen        ),

      .cdb_tag            ( cdb_tag             ),
      .cdb_valid          ( cdb_valid           ),

      .regfile_wen_onehot ( regfile_wen_onehot  ),

      .dispatch_rstag     ( dispatch_rstag      ),
      .dispatch_rsvalid   ( dispatch_rsvalid    ),
      .dispatch_rsaddr    ( dispatch_rsaddr     ),

      .dispatch_rttag     ( dispatch_rttag      ),
      .dispatch_rtvalid   ( dispatch_rtvalid    ),
      .dispatch_rtaddr    ( dispatch_rtaddr     )
   );

endmodule

`endif

