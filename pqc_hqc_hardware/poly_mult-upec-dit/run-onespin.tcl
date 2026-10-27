#################################
# Design Setup and Verification #
#################################

set script_path [file dirname [file normalize [info script]]]

read_verilog -golden -version sv2012 {
  $script_path/rtl/poly_mult.v
  $script_path/rtl/mem_dual.v
  }

read_verilog -golden -version sv2012 {$script_path/poly_mult_miter.sv}

set_elaborate_option -top verilog!work.poly_mult_miter

elaborate -golden

compile -golden

set_mode mv

read_sva -version {sv2012} {$script_path/upec-dit.sv}

check checker_bind.upec_dit_unrolled_p_a
check -pass checker_bind.upec_dit_unrolled_p_a

