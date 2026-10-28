#################################
# Design Setup and Verification #
#################################

set script_path [file dirname [file normalize [info script]]]

read_verilog -golden -version sv2012 {
  $script_path/rtl/keccak_pkg.v
  $script_path/rtl/clog2.v
  $script_path/rtl/onegen.v
  $script_path/rtl/encrypt_parallel.v
  $script_path/rtl/data_path.v
  $script_path/rtl/fft_part1.v
  $script_path/rtl/fft_part2.v
  $script_path/rtl/onegen_ct.v
  $script_path/rtl/barrett_red_gen.v
  $script_path/rtl/keccak_top.v
  $script_path/rtl/encap.v
  $script_path/rtl/gfmul.v
  $script_path/rtl/keccak_math.v
  $script_path/rtl/gf_mul.v
  $script_path/rtl/control_path.v
  $script_path/rtl/concat_code.v
  $script_path/rtl/hqc_decod_top.v
  $script_path/rtl/decrypt.v
  $script_path/rtl/encrypt.v
  $script_path/rtl/hqc_rmdecod_findpeaks.v
  $script_path/rtl/hqc_rmdecod_top.v
  $script_path/rtl/hqc_rsdecod_elp.v
  $script_path/rtl/hqc_rsdecod_top.v
  $script_path/rtl/karatsuba_small.v
  $script_path/rtl/poly_mult.v
  $script_path/rtl/hqc_barrett_red.v
  $script_path/rtl/loc_based_adder.v
  $script_path/rtl/hqc_rsdecod_zpoly.v
  $script_path/rtl/mem_single.v
  $script_path/rtl/hqc_rmdecod_expnsum.v
  $script_path/rtl/cdw_xor_tmp.v
  $script_path/rtl/state_ram.v
  $script_path/rtl/fixed_weight.v
  $script_path/rtl/fixed_weight_ct.v
  $script_path/rtl/rc.v
  $script_path/rtl/fixed_weight_cww.v
  $script_path/rtl/xor_based_adder.v
  $script_path/rtl/hqc_rmdecod_ctrl.v
  $script_path/rtl/hqc_rsdecod_roots.v
  $script_path/rtl/stateram_inference.v
  $script_path/rtl/hqc_rsdecod_err_val.v
  $script_path/rtl/hqc_rmdecod_hadamard.v
  $script_path/rtl/fft_retrieve_error_poly.v
  $script_path/rtl/hqc_rsdecod_syndromes.v
  $script_path/rtl/add_fft.v
  $script_path/rtl/mem_dual.v
  $script_path/rtl/syncfifo.v
  $script_path/rtl/transform.v
  $script_path/rtl/rm_encoder.v
  $script_path/rtl/reed_muller_encode.v
  $script_path/rtl/reed_solomon_encode.v
  $script_path/rtl/fft_leaves_butterfly.v
  $script_path/rtl/mod34.v
  $script_path/rtl/v_minus_uy.v
  }

read_verilog -golden -version sv2012 {$script_path/decrypt_miter.sv}

set_elaborate_option -top verilog!work.decrypt_miter

elaborate -golden

compile -golden

set_mode mv

read_sva -version {sv2012} {$script_path/upec-dit.sv}

check checker_bind.upec_dit_unrolled_p_a
check -pass checker_bind.upec_dit_unrolled_p_a

