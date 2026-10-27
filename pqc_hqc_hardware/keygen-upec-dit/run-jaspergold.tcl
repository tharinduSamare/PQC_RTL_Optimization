set script_path [file dirname [file normalize [info script]]]

analyze -sv12 $script_path/rtl/keccak_pkg.v
analyze -sv12 $script_path/rtl/keygen.v
analyze -sv12 $script_path/rtl/clog2.v
analyze -sv12 $script_path/rtl/onegen.v
analyze -sv12 $script_path/rtl/data_path.v
analyze -sv12 $script_path/rtl/onegen_ct.v
analyze -sv12 $script_path/rtl/keccak_top.v
analyze -sv12 $script_path/rtl/keccak_math.v
analyze -sv12 $script_path/rtl/control_path.v
analyze -sv12 $script_path/rtl/poly_mult.v
analyze -sv12 $script_path/rtl/hqc_barrett_red.v
analyze -sv12 $script_path/rtl/loc_based_adder.v
analyze -sv12 $script_path/rtl/mem_single.v
analyze -sv12 $script_path/rtl/state_ram.v
analyze -sv12 $script_path/rtl/fixed_weight.v
analyze -sv12 $script_path/rtl/fixed_weight_ct.v
analyze -sv12 $script_path/rtl/rc.v
analyze -sv12 $script_path/rtl/xor_based_adder.v
analyze -sv12 $script_path/rtl/stateram_inference.v
analyze -sv12 $script_path/rtl/mem_dual.v
analyze -sv12 $script_path/rtl/transform.v
analyze -sv12 $script_path/rtl/vect_set_random.v
analyze -sv12  $script_path/keygen_miter.sv
analyze -sv12  $script_path/upec-dit.sv
elaborate -top keygen_miter

clock clk

reset -none

prove -property keygen_miter.checker_bind.upec_dit_unrolled_p_a
prove -property keygen_miter.checker_bind.upec_dit_unrolled_p_a:precondition1

