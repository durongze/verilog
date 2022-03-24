`timescale 1ns/100ps
 
module main_math ;
    reg  ai, bi ;
    reg SYSCLK;
	reg counter;
    parameter SYSCLK_PERIOD = 10;

    initial begin
        bi = 'd1 ;
        ai = 'd0 ;
        counter = 'd0 ;
        #5
        SYSCLK = 1'b0;   
        while (counter<=3) begin
            #10 ;
            ai = ai + 1;
            bi = bi + 1;
            counter = counter + 1;
        end
    end

    initial begin
        #1000
            $finish;
    end

    always @(SYSCLK)
        #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

    lib_math lib_math_ut0 (
        // Inputs
        .a(ai),
        .b(bi),

        // Outputs
        .sum(sum),
        .c(c)
    );

    /*iverilog */
    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0, main_math);
    end
    /*iverilog */

endmodule
