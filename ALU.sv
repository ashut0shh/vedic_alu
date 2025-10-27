module ALU #(
  parameter ADDER_WIDTH = 4,
  parameter MULTIPLIER_WIDTH = 4
)(
  input logic [1:0] opcode,
  input logic [ADDER_WIDTH-1:0] a,
  input logic [MULTIPLIER_WIDTH-1:0] b,
  output logic [2*ADDER_WIDTH-1:0] result
);
  logic [ADDER_WIDTH-1:0] adder_out;
  logic [2*ADDER_WIDTH-1:0] multiplier_out;

  BinaryVedicAdder_4bit adder_inst (
    .A(a),
    .B(b),
    .Sum(adder_out)
  );

  fourb_vm multiplier_inst (
    .A(a),
    .B(b),
    .P(multiplier_out)
  );

  always_comb begin
    case (opcode)
      2'b00: result = adder_out;           // Addition
      2'b01: result = multiplier_out;     // Multiplication
      // Add more cases for other operations if needed
      default: result = 0;                 // Default case, no operation
    endcase
  end
endmodule