onbreak resume
onerror resume
vsim -voptargs=+acc work.comp_fixpoint_tb

add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/clk
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/reset
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/clk_enable
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/I_valid
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/I_complex_value_re
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/I_complex_value_im
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/ce_out
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/O_valid
add wave sim:/comp_fixpoint_tb/O_valid_ref
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/O_magnitude
add wave sim:/comp_fixpoint_tb/O_magnitude_ref
add wave sim:/comp_fixpoint_tb/u_comp_fixpoint/O_phase
add wave sim:/comp_fixpoint_tb/O_phase_ref
run -all
