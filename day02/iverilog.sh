#!/bin/bash

function CompileLedDemo()
{
    v_file="time_delay_module_tb.v"
    vcd_file="wave.vcd"
    ls
    echo -e "\033[32m iverilog -o wave -y ./ $v_file \033[0m"
    iverilog -o wave -y ./ $v_file
    ls
    echo -e "\033[32m vvp -n wave -lxt2 \033[0m"
    vvp -n wave -lxt2
    ls
    echo "gtkwave $vcd_file"
    gtkwave $vcd_file
    #SST -> Signals -> Insert -> Zoom fit
}

function TransVhdlLedDemo()
{
    v_file="time_delay_module.v"
    vhd_file="time_delay_module.vhd"
    ls
    echo -e "\033[32m iverilog -tvhdl -o $vhd_file $v_file \033[0m"
    iverilog -tvhdl -o $vhd_file $v_file
    ls
    echo -e "\033[32m iverilog -g2012 $vhd_file \033[0m"
    iverilog -g2012 $vhd_file
    ls
}

function CleanLedDemo()
{
    FileList="wave wave.vcd time_delay_module.vhd a.out ivl_vhdl_work"
    for f in $FileList
    do
        if [[ -f $f ]];then
            echo -e "\033[32m rm $f\033[0m"
            rm $f
        elif [[ -d $f ]];then
            echo -e "\033[32m rmdir $f\033[0m"
            rmdir $f
        fi
    done
}

CompileLedDemo
#TransVhdlLedDemo
CleanLedDemo
