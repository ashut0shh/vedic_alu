module CarryLookaheadAdder_2bit(
  input logic [1:0] A,
  input logic [1:0] B,
  input logic Cin,
  output logic [2:0] Sum,
  output logic Cout
);

  logic P[1:0], G[1:0], C[2:0];

  // Generate P and G signals
  assign P[0] = A[0] ^ B[0];
  assign G[0] = A[0] & B[0];
  assign P[1] = A[1] ^ B[1];
  assign G[1] = A[1] & B[1];

  // Generate intermediate carry signals
  assign C[0] = P[0] | (G[0] & Cin);
  assign C[1] = P[1] | (G[1] & (P[0] | (G[0] & Cin)));
  
  // Generate Sum and Cout
  assign Sum = A + B + Cin;
  assign Cout = C[1];

endmodule