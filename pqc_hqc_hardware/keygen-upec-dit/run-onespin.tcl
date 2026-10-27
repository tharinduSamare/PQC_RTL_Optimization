#################################
# Design Setup and Verification #
#################################

set script_path [file dirname [file normalize [info script]]]

read_verilog -golden -version sv2012 {
  $script_path/rtl/keccak_pkg.v
  $script_path/rtl/keygen.v
  $script_path/rtl/clog2.v
  $script_path/rtl/onegen.v
  $script_path/rtl/data_path.v
  $script_path/rtl/onegen_ct.v
  $script_path/rtl/keccak_top.v
  $script_path/rtl/keccak_math.v
  $script_path/rtl/control_path.v
  $script_path/rtl/poly_mult.v
  $script_path/rtl/hqc_barrett_red.v
  $script_path/rtl/loc_based_adder.v
  $script_path/rtl/mem_single.v
  $script_path/rtl/state_ram.v
  $script_path/rtl/fixed_weight.v
  $script_path/rtl/fixed_weight_ct.v
  $script_path/rtl/rc.v
  $script_path/rtl/xor_based_adder.v
  $script_path/rtl/stateram_inference.v
  $script_path/rtl/mem_dual.v
  $script_path/rtl/transform.v
  $script_path/rtl/vect_set_random.v
  }

read_verilog -golden -version sv2012 {$script_path/keygen_miter.sv}

set_elaborate_option -top verilog!work.keygen_miter

elaborate -golden

compile -golden

set_mode mv

read_sva -version {sv2012} {$script_path/upec-dit.sv}

check checker_bind.upec_dit_unrolled_p_a
check -pass checker_bind.upec_dit_unrolled_p_a

