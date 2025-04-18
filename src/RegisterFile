module RegisterFile (
    input clk,
    input reg_write,
    input [3:0] read_reg1,
    input [3:0] read_reg2,
    input [3:0] write_reg,
    input [3:0] write_data,
    output reg [3:0] read_data1,
    output reg [3:0] read_data2
);

reg [3:0] registers [0:15];

always @(*) begin
    read_data1 = registers[read_reg1];
    read_data2 = registers[read_reg2];
end

always @(posedge clk) begin
    if (reg_write)
        registers[write_reg] <= write_data;
end

endmodule
