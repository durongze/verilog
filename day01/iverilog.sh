#!/bin/bash

function InstallVerilog()
{
    #安装iverilog：
    which iverilog
    if [ $? -ne 0 ];then
        sudo apt-get install iverilog
    else
        which vvp
    fi
    #安装GTKWave：
    which gtkwave
    if [ $? -ne 0 ];then
        sudo apt-get install gtkwave
    fi
}

function CompileLedDemo()
{
    file_name=$1
    v_file="$file_name.v"
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
    file_name=$1
    v_file="$file_name.v"
    vhd_file="$file_name.vhd"
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
    file_name=$1
    FileList="wave wave.vcd $file_name.vhd a.out ivl_vhdl_work"
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

function ShowTime()
{
    echo -e "1 s \t= 1000 ms \n\t= 1000 000 us \n\t= 1000 000 000 ns \n\t= 1000 000 000 000 ps\n"
}

InstallVerilog
CompileLedDemo "led_demo_tb"
TransVhdlLedDemo "led_demo"
CleanLedDemo "led_demo"
ShowTime
