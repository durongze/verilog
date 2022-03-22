`timescale 1ns/100ps
 
module main_math ;
    reg  ai, bi ;
    reg SYSCLK;
    parameter SYSCLK_PERIOD = 10;

    initial
    begin
        ai = 10;
        bi = 5;
        #5
        SYSCLK = 1'b0;
        #1000
            $stop;
    end

    always @(SYSCLK)
        #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

    lib_math lib_math_ut0 (
        // Inputs
        .clk(SYSCLK),
        .a(ai),
        .b(bi),

        // Outputs
        .sum(sum)
    );

    /*iverilog */
    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0, main_math);
    end
    /*iverilog */

endmodule