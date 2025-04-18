module ALU (
    input [3:0] opcode,    
    input [3:0] operandA,  
    input [3:0] operandB,  
    output reg [3:0] result,
    output reg mem_write, // Memory write enable
    output reg mem_read,  // Memory read enable
    input [3:0] memory_in, // Data from memory
    output reg [3:0] memory_out // Data to memory
);

always @(*) begin
    mem_write = 0;
    mem_read = 0;
    memory_out = 4'b0000; // Default memory output to prevent undefined states

    case (opcode)
        4'b0000: result = operandA + operandB;  // ADD
        4'b0001: result = operandA - operandB;  // SUB
        4'b0010: result = operandA & operandB;  // AND
        4'b0011: result = operandA | operandB;  // OR
        4'b0100: result = operandA ^ operandB;  // XOR
        4'b0101: result = operandA << operandB; // SLL
        4'b0110: result = operandA >> operandB; // SRL
        4'b0111: result = (operandA < operandB) ? 4'b0001 : 4'b0000; // SLT
        4'b1000: result = ~(operandA | operandB); // NOR
        4'b1001: result = $signed(operandA) >>> operandB; // SRA
       
        4'b1010: begin // LW (Load Word)
            mem_read = 1;
	    result = memory_in; // Fetch memory data into result
        end
       
        4'b1011: begin // SW (Store Word)
            mem_write = 1;
            memory_out = operandA; // Store operandA into memory
        end
       
        default: result = 4'b0000;
    endcase
end

endmodule
