 
module lib_math(
    input clk,
    input a,
    input b,
    output reg sum
);

always @ (posedge clk)
begin
    if (clk) begin
        sum <= b + a;
        $display("clk=%d, %d", clk, sum);
    end
    else begin
        sum <= a - b;
        $display("clk:%d, %d", clk, sum);
    end
end

endmodule
