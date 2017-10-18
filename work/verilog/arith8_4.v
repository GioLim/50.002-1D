/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module arith8_4 (
    input [7:0] a,
    input [7:0] b,
    input [1:0] alufn,
    output reg [7:0] out,
    output reg z,
    output reg n,
    output reg v
  );
  
  
  
  wire [8-1:0] M_adder8_sum;
  wire [1-1:0] M_adder8_z;
  wire [1-1:0] M_adder8_n;
  wire [1-1:0] M_adder8_v;
  reg [8-1:0] M_adder8_a;
  reg [8-1:0] M_adder8_b;
  reg [1-1:0] M_adder8_alufn;
  adder_11 adder8 (
    .a(M_adder8_a),
    .b(M_adder8_b),
    .alufn(M_adder8_alufn),
    .sum(M_adder8_sum),
    .z(M_adder8_z),
    .n(M_adder8_n),
    .v(M_adder8_v)
  );
  
  wire [8-1:0] M_mul8_p;
  reg [8-1:0] M_mul8_a;
  reg [8-1:0] M_mul8_b;
  mul_12 mul8 (
    .a(M_mul8_a),
    .b(M_mul8_b),
    .p(M_mul8_p)
  );
  
  always @* begin
    M_adder8_a = a;
    M_adder8_b = b;
    M_adder8_alufn = alufn[0+0-:1];
    M_mul8_a = a;
    M_mul8_b = b;
    z = M_adder8_z;
    n = M_adder8_n;
    v = M_adder8_v;
    if (alufn[1+0-:1] == 1'h1) begin
      out = M_mul8_p;
    end else begin
      out = M_adder8_sum;
    end
  end
endmodule
