// -------------------------------------------------------------
// 
// File Name: C:\Users\user\Documents\MATLAB\Test\lab2\lab2_fixp\comp_fixpoint_tb.v
// Created: 2022-11-30 08:05:39
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// O_valid                       ce_out        1
// O_magnitude                   ce_out        1
// O_phase                       ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: comp_fixpoint_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module comp_fixpoint_tb;



  reg  clk;
  reg  reset;
  wire clk_enable;
  wire rawData_I_valid;
  wire O_phase_done;  // ufix1
  wire rdEnb;
  wire O_phase_done_enb;  // ufix1
  reg [3:0] O_valid_addr;  // ufix4
  wire O_phase_lastAddr;  // ufix1
  wire resetn;
  reg  check3_done;  // ufix1
  wire O_magnitude_done;  // ufix1
  wire O_magnitude_done_enb;  // ufix1
  wire O_magnitude_lastAddr;  // ufix1
  reg  check2_done;  // ufix1
  wire O_valid_done;  // ufix1
  wire O_valid_done_enb;  // ufix1
  wire O_valid_active;  // ufix1
  wire [3:0] Data_Type_Conversion_out1_addr_delay;  // ufix4
  reg  tb_enb_delay;
  reg signed [31:0] fp_I_complex_value_im;  // sfix32
  reg [31:0] rawData_I_complex_value_im;  // ufix32_En22
  reg signed [31:0] status_I_complex_value_im;  // sfix32
  reg [31:0] holdData_I_complex_value_im;  // ufix32_En22
  reg [31:0] I_complex_value_im_offset;  // ufix32_En22
  wire [31:0] I_complex_value_im;  // ufix32_En22
  reg [3:0] Constant_out1_addr;  // ufix4
  wire Constant_out1_active;  // ufix1
  wire Constant_out1_enb;  // ufix1
  reg signed [31:0] fp_I_complex_value_re;  // sfix32
  reg [31:0] rawData_I_complex_value_re;  // ufix32_En22
  reg signed [31:0] status_I_complex_value_re;  // sfix32
  reg [31:0] holdData_I_complex_value_re;  // ufix32_En22
  reg [31:0] I_complex_value_re_offset;  // ufix32_En22
  wire [31:0] I_complex_value_re;  // ufix32_En22
  reg  holdData_I_valid;
  reg  I_valid_offset;
  wire I_valid_1;
  wire snkDone;
  wire snkDonen;
  wire tb_enb;
  wire ce_out;
  wire O_valid;
  wire [32:0] O_magnitude;  // ufix33_En21
  wire [15:0] O_phase;  // ufix16_En13
  wire O_valid_enb;  // ufix1
  wire O_valid_lastAddr;  // ufix1
  reg  check1_done;  // ufix1
  wire O_valid_expected_1;
  wire O_valid_ref;
  reg  O_valid_testFailure;  // ufix1
  wire [32:0] O_magnitude_expected_1;  // ufix33_En21
  wire [32:0] O_magnitude_ref;  // ufix33_En21
  reg  O_magnitude_testFailure;  // ufix1
  wire [15:0] O_phase_expected_1;  // ufix16_En13
  wire [15:0] O_phase_ref;  // ufix16_En13
  reg  O_phase_testFailure;  // ufix1
  wire testFailure;  // ufix1


  // Data source for I_valid
  assign rawData_I_valid = 1'b1;



  assign O_phase_done_enb = O_phase_done & rdEnb;



  assign O_phase_lastAddr = O_valid_addr >= 4'b1010;



  assign O_phase_done = O_phase_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_3
      if (reset) begin
        check3_done <= 0;
      end
      else begin
        if (O_phase_done_enb) begin
          check3_done <= O_phase_done;
        end
      end
    end

  assign O_magnitude_done_enb = O_magnitude_done & rdEnb;



  assign O_magnitude_lastAddr = O_valid_addr >= 4'b1010;



  assign O_magnitude_done = O_magnitude_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_2
      if (reset) begin
        check2_done <= 0;
      end
      else begin
        if (O_magnitude_done_enb) begin
          check2_done <= O_magnitude_done;
        end
      end
    end

  assign O_valid_done_enb = O_valid_done & rdEnb;



  assign O_valid_active = O_valid_addr != 4'b1010;



  // Data source for I_complex_value_im
  initial
    begin : I_complex_value_im_fileread
      fp_I_complex_value_im = $fopen("I_complex_value_im.dat", "r");
      status_I_complex_value_im = $rewind(fp_I_complex_value_im);
    end

  always @(Data_Type_Conversion_out1_addr_delay, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_I_complex_value_im <= 32'bx;
      end
      else if (rdEnb == 1) begin
        status_I_complex_value_im = $fscanf(fp_I_complex_value_im, "%h", rawData_I_complex_value_im);
      end
    end

  // holdData reg for Data_Type_Conversion_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion_out1
      if (reset) begin
        holdData_I_complex_value_im <= 32'bx;
      end
      else begin
        holdData_I_complex_value_im <= rawData_I_complex_value_im;
      end
    end

  always @(rawData_I_complex_value_im or rdEnb)
    begin : stimuli_Data_Type_Conversion_out1_1
      if (rdEnb == 1'b0) begin
        I_complex_value_im_offset <= holdData_I_complex_value_im;
      end
      else begin
        I_complex_value_im_offset <= rawData_I_complex_value_im;
      end
    end

  assign #2 I_complex_value_im = I_complex_value_im_offset;

  assign Constant_out1_active = Constant_out1_addr != 4'b1010;



  assign Constant_out1_enb = Constant_out1_active & (rdEnb & tb_enb_delay);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 10
  always @(posedge clk or posedge reset)
    begin : Constant_process
      if (reset == 1'b1) begin
        Constant_out1_addr <= 4'b0000;
      end
      else begin
        if (Constant_out1_enb) begin
          if (Constant_out1_addr >= 4'b1010) begin
            Constant_out1_addr <= 4'b0000;
          end
          else begin
            Constant_out1_addr <= Constant_out1_addr + 4'b0001;
          end
        end
      end
    end



  assign #1 Data_Type_Conversion_out1_addr_delay = Constant_out1_addr;

  // Data source for I_complex_value_re
  initial
    begin : I_complex_value_re_fileread
      fp_I_complex_value_re = $fopen("I_complex_value_re.dat", "r");
      status_I_complex_value_re = $rewind(fp_I_complex_value_re);
    end

  always @(Data_Type_Conversion_out1_addr_delay, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_I_complex_value_re <= 32'bx;
      end
      else if (rdEnb == 1) begin
        status_I_complex_value_re = $fscanf(fp_I_complex_value_re, "%h", rawData_I_complex_value_re);
      end
    end

  // holdData reg for Data_Type_Conversion_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Data_Type_Conversion_out1_2
      if (reset) begin
        holdData_I_complex_value_re <= 32'bx;
      end
      else begin
        holdData_I_complex_value_re <= rawData_I_complex_value_re;
      end
    end

  always @(rawData_I_complex_value_re or rdEnb)
    begin : stimuli_Data_Type_Conversion_out1_3
      if (rdEnb == 1'b0) begin
        I_complex_value_re_offset <= holdData_I_complex_value_re;
      end
      else begin
        I_complex_value_re_offset <= rawData_I_complex_value_re;
      end
    end

  assign #2 I_complex_value_re = I_complex_value_re_offset;

  // holdData reg for Constant_out1
  always @(posedge clk or posedge reset)
    begin : stimuli_Constant_out1
      if (reset) begin
        holdData_I_valid <= 1'bx;
      end
      else begin
        holdData_I_valid <= rawData_I_valid;
      end
    end

  always @(rawData_I_valid or rdEnb)
    begin : stimuli_Constant_out1_1
      if (rdEnb == 1'b0) begin
        I_valid_offset <= holdData_I_valid;
      end
      else begin
        I_valid_offset <= rawData_I_valid;
      end
    end

  assign #2 I_valid_1 = I_valid_offset;

  assign snkDonen =  ~ snkDone;



  assign resetn =  ~ reset;



  assign tb_enb = resetn & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge clk or posedge reset)
    begin : u_enable_delay
      if (reset) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (snkDone == 1'b0 ? tb_enb_delay :
              1'b0);



  assign #2 clk_enable = rdEnb;

  initial
    begin : reset_gen
      reset <= 1'b1;
      # (20);
      @ (posedge clk)
      # (2);
      reset <= 1'b0;
    end

  always 
    begin : clk_gen
      clk <= 1'b1;
      # (5);
      clk <= 1'b0;
      # (5);
      if (snkDone == 1'b1) begin
        clk <= 1'b1;
        # (5);
        clk <= 1'b0;
        # (5);
        $stop;
      end
    end

  comp_fixpoint u_comp_fixpoint (.clk(clk),
                                 .reset(reset),
                                 .clk_enable(clk_enable),
                                 .I_valid(I_valid_1),
                                 .I_complex_value_re(I_complex_value_re),  // ufix32_En22
                                 .I_complex_value_im(I_complex_value_im),  // ufix32_En22
                                 .ce_out(ce_out),
                                 .O_valid(O_valid),
                                 .O_magnitude(O_magnitude),  // ufix33_En21
                                 .O_phase(O_phase)  // ufix16_En13
                                 );

  assign O_valid_enb = ce_out & O_valid_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 10
  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        O_valid_addr <= 4'b0000;
      end
      else begin
        if (O_valid_enb) begin
          if (O_valid_addr >= 4'b1010) begin
            O_valid_addr <= 4'b0000;
          end
          else begin
            O_valid_addr <= O_valid_addr + 4'b0001;
          end
        end
      end
    end



  assign O_valid_lastAddr = O_valid_addr >= 4'b1010;



  assign O_valid_done = O_valid_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk or posedge reset)
    begin : checkDone_1
      if (reset) begin
        check1_done <= 0;
      end
      else begin
        if (O_valid_done_enb) begin
          check1_done <= O_valid_done;
        end
      end
    end

  assign snkDone = check3_done & (check1_done & check2_done);



  // Data source for O_valid_expected
  assign O_valid_expected_1 = 1'b0;



  assign O_valid_ref = O_valid_expected_1;

  always @(posedge clk or posedge reset)
    begin : O_valid_checker
      if (reset == 1'b1) begin
        O_valid_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && O_valid !== O_valid_ref) begin
          O_valid_testFailure <= 1'b1;
          $display("ERROR in O_valid at time %t : Expected '%h' Actual '%h'", $time, O_valid_ref, O_valid);
        end
      end
    end

  // Data source for O_magnitude_expected
  assign O_magnitude_expected_1 = 33'h000000000;



  assign O_magnitude_ref = O_magnitude_expected_1;

  always @(posedge clk or posedge reset)
    begin : O_magnitude_checker
      if (reset == 1'b1) begin
        O_magnitude_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && O_magnitude !== O_magnitude_ref) begin
          O_magnitude_testFailure <= 1'b1;
          $display("ERROR in O_magnitude at time %t : Expected '%h' Actual '%h'", $time, O_magnitude_ref, O_magnitude);
        end
      end
    end

  // Data source for O_phase_expected
  assign O_phase_expected_1 = 16'b0000000000000000;



  assign O_phase_ref = O_phase_expected_1;

  always @(posedge clk or posedge reset)
    begin : O_phase_checker
      if (reset == 1'b1) begin
        O_phase_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && O_phase !== O_phase_ref) begin
          O_phase_testFailure <= 1'b1;
          $display("ERROR in O_phase at time %t : Expected '%h' Actual '%h'", $time, O_phase_ref, O_phase);
        end
      end
    end

  assign testFailure = O_phase_testFailure | (O_valid_testFailure | O_magnitude_testFailure);



  always @(posedge clk)
    begin : completed_msg
      if (snkDone == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // comp_fixpoint_tb

