`timescale 1ns/1ns
 
module initial_test ;
    reg  ai, bi ;
 
    initial begin
        ai         = 0 ;
        #25 ;   ai = 1 ;
        #35 ;   ai = 0 ;        //absolute 60ns
        #40 ;   ai = 1 ;        //absolute 100ns
        #10 ;   ai = 0 ;        //absolute 110ns
    end
 
    initial begin
        bi       = 1 ;
        #70 ; bi = 0 ;        //absolute 70ns
        #20 ; bi = 1 ;        //absolute 90ns
    end
 
    // at proper time stop the simulation
    initial begin
        forever begin
            #100;
            $display("---time---%d", $time);
            if ($time >= 1000) begin
                $finish ;
            end
        end
   end

    /*iverilog */
    initial
    begin
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, initial_test);    //tb模块名称
    end
    /*iverilog */
 
endmodule