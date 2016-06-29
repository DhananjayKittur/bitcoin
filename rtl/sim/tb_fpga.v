`timescale 1ns/10ps
module tb_fpga();

reg clk;
reg resetn;

always@*
#1 clk <= ~clk;

initial begin
    $dumpfile("tb_fpga.vcd");
    $dumpvars;
    clk = 'b0;
    resetn = 'b0;
#10;
    @(posedge clk) resetn = 1'b1;
#1000 $finish;
end

my_counter counter (
    .clk(clk),
    .resetn(resetn)
);

endmodule
