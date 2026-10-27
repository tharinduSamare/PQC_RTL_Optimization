set script_path [file dirname [file normalize [info script]]]

analyze -sv12 $script_path/rtl/poly_mult.v
analyze -sv12 $script_path/rtl/mem_dual.v
analyze -sv12  $script_path/poly_mult_miter.sv
analyze -sv12  $script_path/upec-dit.sv
elaborate -top poly_mult_miter

clock clk

reset -none

prove -property poly_mult_miter.checker_bind.upec_dit_unrolled_p_a
prove -property poly_mult_miter.checker_bind.upec_dit_unrolled_p_a:precondition1

