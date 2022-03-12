`timescale 1ns/1ns
 
module always_test ;
 
    parameter CLK_FREQ   = 100 ;                      //100MHz
    parameter CLK_CYCLE  = 1e9 / (CLK_FREQ * 1e6) ;   //switch to ns
 
    reg  clk ;
    initial clk = 1'b0 ;                  //clk is initialized to "0"
    always  # (CLK_CYCLE/2) clk = ~clk ;  //generating a real clock by reversing
 
    always begin
        #10;
        if ($time >= 1000) begin
            $finish ;
        end
    end

    /*iverilog */
    initial
    begin
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, always_test);    //tb模块名称
    end
    /*iverilog */
 
endmodule