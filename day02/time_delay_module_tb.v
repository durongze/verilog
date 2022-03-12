`timescale 1ns/1ns

module time_delay_module_tb ;
    reg  ai, bi ;
    wire so_lose, so_get, so_normal ;
 
    initial begin
        ai        = 0 ;
        #25 ;      ai        = 1 ;
        #35 ;      ai        = 0 ;        //60ns
        #40 ;      ai        = 1 ;        //100ns
        #10 ;      ai        = 0 ;        //110ns
    end
 
    initial begin
        bi        = 1 ;
        #70 ;      bi        = 0 ;
        #20 ;      bi        = 1 ;
    end
 
    time_delay_module  u_wire_delay(
        .ai              (ai),
        .bi              (bi),
        .so_lose         (so_lose),
        .so_get          (so_get),
        .so_normal       (so_normal));
 
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
        $dumpvars(0, time_delay_module_tb);    //tb模块名称
    end
    /*iverilog */
endmodule
