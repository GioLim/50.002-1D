/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boole_test_15 (
    input clk,
    input rst,
    input [7:0] alu,
    input [2:0] test,
    output reg [7:0] testA,
    output reg [7:0] testB,
    output reg [5:0] alufn,
    input reset
  );
  
  
  
  
  localparam ANDTEST0_state = 4'd0;
  localparam ANDTEST1_state = 4'd1;
  localparam ORTEST0_state = 4'd2;
  localparam ORTEST1_state = 4'd3;
  localparam XORTEST0_state = 4'd4;
  localparam XORTEST1_state = 4'd5;
  localparam ATEST0_state = 4'd6;
  localparam ATEST1_state = 4'd7;
  localparam END_state = 4'd8;
  
  reg [3:0] M_state_d, M_state_q = ANDTEST0_state;
  
  reg [27:0] M_counter_d, M_counter_q = 1'h0;
  
  reg getNextState;
  
  reg resetFSM;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    testA = 1'h0;
    testB = 1'h0;
    alufn = 1'h0;
    resetFSM = reset;
    M_counter_d = M_counter_q + 1'h1;
    if (M_counter_q == 28'hfffffff) begin
      getNextState = 1'h1;
    end else begin
      getNextState = 1'h0;
    end
    
    case (M_state_q)
      ANDTEST0_state: begin
        testA = 8'h0f;
        testB = 8'h0f;
        alufn = 6'h18;
        if (getNextState == 1'h1) begin
          if (alu == 8'h0f && test == 3'h0) begin
            M_state_d = ANDTEST1_state;
          end
        end else begin
          M_state_d = ANDTEST0_state;
        end
      end
      ANDTEST1_state: begin
        testA = 8'hff;
        testB = 8'haa;
        alufn = 6'h18;
        if (getNextState == 1'h1) begin
          if (alu == 8'haa && test == 3'h1) begin
            M_state_d = ORTEST0_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = ANDTEST1_state;
        end
      end
      ORTEST0_state: begin
        testA = 8'h0f;
        testB = 8'hf0;
        alufn = 6'h1e;
        if (getNextState == 1'h1) begin
          if (alu == 8'hff && test == 3'h1) begin
            M_state_d = ORTEST1_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = ORTEST0_state;
        end
      end
      ORTEST1_state: begin
        testA = 8'h33;
        testB = 8'h5a;
        alufn = 6'h1e;
        if (getNextState == 1'h1) begin
          if (alu == 8'h7b && test == 3'h3) begin
            M_state_d = XORTEST0_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = ORTEST1_state;
        end
      end
      XORTEST0_state: begin
        testA = 8'h0f;
        testB = 8'h0f;
        alufn = 6'h16;
        if (getNextState == 1'h1) begin
          if (alu == 8'h00 && test == 3'h0) begin
            M_state_d = XORTEST1_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = XORTEST0_state;
        end
      end
      XORTEST1_state: begin
        testA = 8'h33;
        testB = 8'h5a;
        alufn = 6'h16;
        if (getNextState == 1'h1) begin
          if (alu == 8'h69 && test == 3'h3) begin
            M_state_d = XORTEST1_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = XORTEST0_state;
        end
      end
      ATEST0_state: begin
        testA = 8'h0f;
        testB = 8'hcc;
        alufn = 6'h1a;
        if (getNextState == 1'h1) begin
          if (alu == 8'h0f && test == 3'h1) begin
            M_state_d = ATEST1_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = ATEST0_state;
        end
      end
      ATEST1_state: begin
        testA = 8'h33;
        testB = 8'hf0;
        alufn = 6'h1a;
        if (getNextState == 1'h1) begin
          if (alu == 8'hcc && test == 3'h0) begin
            M_state_d = END_state;
          end else begin
            if (resetFSM == 1'h1) begin
              M_state_d = ANDTEST0_state;
            end
          end
        end else begin
          M_state_d = ATEST1_state;
        end
      end
      END_state: begin
        testA = 8'h00;
        testB = 8'h00;
        alufn = 6'h00;
        if (getNextState == 1'h1) begin
          if (resetFSM == 1'h1) begin
            M_state_d = ANDTEST0_state;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
