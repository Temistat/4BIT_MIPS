module Memory (
    input clk,
    input mem_read,
    input mem_write,
    input [3:0] address,
    input [3:0] write_data,
    output reg [3:0] read_data
);

reg [3:0] mem [0:15];  // 16-word memory

// Initialize memory to avoid undefined values
integer i;
initial begin
    for (i = 0; i < 16; i = i + 1)
        mem[i] = 4'b0000;  // Default values
end

// Write Operation (Triggered on Clock Edge)
always @(posedge clk) begin
    if (mem_write) begin
        mem[address] <= write_data;
    end
end

// Read Operation (Combinational Read)
always @(*) begin
    if (mem_read)
        read_data = mem[address];
    else
        read_data = 4'b0000; // Default to prevent undefined values
end

endmodule
