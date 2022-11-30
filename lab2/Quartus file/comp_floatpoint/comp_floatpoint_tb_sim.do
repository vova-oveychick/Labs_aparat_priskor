onbreak resume
onerror resume
vsim -voptargs=+acc work.comp_floatpoint_tb

add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/clk
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/reset
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/clk_enable
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/I_valid
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/I_complex_value_re
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/I_complex_value_im
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/ce_out
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/O_valid
add wave sim:/comp_floatpoint_tb/O_valid_ref
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/O_magnitude
add wave sim:/comp_floatpoint_tb/O_magnitude_ref
add wave sim:/comp_floatpoint_tb/u_comp_floatpoint/O_phase
add wave sim:/comp_floatpoint_tb/O_phase_ref
run -all
