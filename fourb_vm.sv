module fourb_vm(
  input logic [3:0] A,
  input logic [3:0] B,
  output logic [7:0] P
);

  // Intermediate products
  logic [7:0] P0, P1, P2, P3;

  // 2-bit Multipliers
  VedicMultiplier_2bit U0 (.A(A[1:0]), .B(B[1:0]), .P(P0[3:0]));
  VedicMultiplier_2bit U1 (.A(A[3:2]), .B(B[1:0]), .P(P1[3:0]));
  VedicMultiplier_2bit U2 (.A(A[1:0]), .B(B[3:2]), .P(P2[3:0]));
  VedicMultiplier_2bit U3 (.A(A[3:2]), .B(B[3:2]), .P(P3[3:0]));

 // Summation using Ripple Carry Adder
  logic [7:0] Sum;

  always_comb begin
    Sum = P0 + (P1 << 2) + (P2 << 4) + (P3 << 6);
  end

  // Output
  assign P = Sum;

endmodule