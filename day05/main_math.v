`timescale 1ns/100ps
 
module main_math ;
    reg  ai, bi ;
    reg SYSCLK;
	reg counter = 'b1;
    parameter SYSCLK_PERIOD = 10;

    initial begin
        bi = 'b1 ;
        ai = 'b1 ;
        while (counter<=3) begin
            #10 ;
            ai = ai + 1;
            bi = bi + 2;
            counter = counter + 1;
        end
        #5
        SYSCLK = 1'b0;
    end

    initial begin
        #1000
            $finish;
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
