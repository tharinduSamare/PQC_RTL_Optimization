set script_path [file dirname [file normalize [info script]]]

analyze -sv12 $script_path/rtl/keccak_pkg.v
analyze -sv12 $script_path/rtl/clog2.v
analyze -sv12 $script_path/rtl/onegen.v
analyze -sv12 $script_path/rtl/encrypt_parallel.v
analyze -sv12 $script_path/rtl/data_path.v
analyze -sv12 $script_path/rtl/onegen_ct.v
analyze -sv12 $script_path/rtl/barrett_red_gen.v
analyze -sv12 $script_path/rtl/keccak_top.v
analyze -sv12 $script_path/rtl/keccak_math.v
analyze -sv12 $script_path/rtl/gf_mul.v
analyze -sv12 $script_path/rtl/control_path.v
analyze -sv12 $script_path/rtl/concat_code.v
analyze -sv12 $script_path/rtl/encrypt.v
analyze -sv12 $script_path/rtl/karatsuba_small.v
analyze -sv12 $script_path/rtl/poly_mult.v
analyze -sv12 $script_path/rtl/hqc_barrett_red.v
analyze -sv12 $script_path/rtl/loc_based_adder.v
analyze -sv12 $script_path/rtl/mem_single.v
analyze -sv12 $script_path/rtl/cdw_xor_tmp.v
analyze -sv12 $script_path/rtl/state_ram.v
analyze -sv12 $script_path/rtl/fixed_weight.v
analyze -sv12 $script_path/rtl/fixed_weight_ct.v
analyze -sv12 $script_path/rtl/rc.v
analyze -sv12 $script_path/rtl/fixed_weight_cww.v
analyze -sv12 $script_path/rtl/xor_based_adder.v
analyze -sv12 $script_path/rtl/stateram_inference.v
analyze -sv12 $script_path/rtl/mem_dual.v
analyze -sv12 $script_path/rtl/transform.v
analyze -sv12 $script_path/rtl/rm_encoder.v
analyze -sv12 $script_path/rtl/reed_muller_encode.v
analyze -sv12 $script_path/rtl/reed_solomon_encode.v
analyze -sv12 $script_path/rtl/mod34.v
analyze -sv12  $script_path/encrypt_miter.sv
analyze -sv12  $script_path/upec-dit.sv
elaborate -top encrypt_miter

clock clk

reset -none

prove -property encrypt_miter.checker_bind.upec_dit_unrolled_p_a
prove -property encrypt_miter.checker_bind.upec_dit_unrolled_p_a:precondition1

