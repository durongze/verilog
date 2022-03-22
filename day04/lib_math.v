 
module lib_math(
    input clk,
    input a,
    input b,
    output reg sum
);

always @ (posedge clk)
begin
    if (clk)
        sum <= sum + a;
    else
        sum <= sum - b;
end

endmodule
