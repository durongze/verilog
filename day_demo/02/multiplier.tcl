#setup library
set_attribute lib_search_path ../lib
set_attribute library

#read_rtl
set_attribute hdl_search_path ../src
read_hdl multiplier.v
elaborate multiplier

#timing constraints
define_clock -name clk -preiod 3000 clk
external_delay -clock clk -input 0 reset
external_delay -clock clk -input 0 mula*
external_delay -clock clk -input 0 mulb*

external_delay -clock clk -output 0 result*

#synthesize
synthesize -to_mapped

#output netlist
write -mapped > multiplier_netlist.v

#report
report timing > multiplier_timing.rpt
report area > multiplier_area.rpt
write_sdc > multiplier_constraints.sdc
write_script > multiplier_script.tcl

#output sdf
write_sdf -edges check_edge -setuphold split > multiplier.sdf
quit