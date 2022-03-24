 
module lib_math(
    input a,
    input b,
    output sum,
    output c
);

assign {c, sum} = b + a;
//$display("c=%d, %d", c, sum);

endmodule
