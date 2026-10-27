module property_checker
  (
  input clk,
  input rst
  );

  default clocking default_clk @(posedge clk); endclocking

  localparam MAX_LATENCY = 10;


    // ======================== //
   // Control Input Constraint //
  // ======================== //

  property control_input_c;
    (U1.sel_uv           == U2.sel_uv          ) &&
    (U1.shake_din_ready  == U2.shake_din_ready ) &&
    (U1.shake_dout_valid == U2.shake_dout_valid) &&
    (U1.start            == U2.start           ) &&
    (U1.u_v_in           == U2.u_v_in          ) &&
    (U1.u_v_in_wen       == U2.u_v_in_wen      ) &&
    (U1.u_v_out_en       == U2.u_v_out_en      );
  endproperty
  control_input_c_a: assume property (control_input_c);


    // ================= //
   // State Equivalence //
  // ================= //

  function automatic state_equivalence();
  state_equivalence = (
    (U1.copy_u                                                      == U2.copy_u                                                     ) &&
    (U1.done                                                        == U2.done                                                       ) &&
    (U1.done_fixed_weight                                           == U2.done_fixed_weight                                          ) &&
    (U1.done_fw_transfer                                            == U2.done_fw_transfer                                           ) &&
    (U1.en_e                                                        == U2.en_e                                                       ) &&
    (U1.en_r1                                                       == U2.en_r1                                                      ) &&
    (U1.en_r2                                                       == U2.en_r2                                                      ) &&
    (U1.fw_addr                                                     == U2.fw_addr                                                    ) &&
    (U1.fw_addr_reg                                                 == U2.fw_addr_reg                                                ) &&
    (U1.hs_addr_0_reg                                               == U2.hs_addr_0_reg                                              ) &&
    (U1.hs_addr_1_reg                                               == U2.hs_addr_1_reg                                              ) &&
    (U1.r2_done                                                     == U2.r2_done                                                    ) &&
    // (U1.rd_fw                                                       == U2.rd_fw                                                      ) &&
    (U1.request_another_vector                                      == U2.request_another_vector                                     ) &&
    (U1.sel_e                                                       == U2.sel_e                                                      ) &&
    (U1.sel_fw                                                      == U2.sel_fw                                                     ) &&
    (U1.sel_hs                                                      == U2.sel_hs                                                     ) &&
    (U1.sel_r1_hr2                                                  == U2.sel_r1_hr2                                                 ) &&
    (U1.sel_r2                                                      == U2.sel_r2                                                     ) &&
    (U1.sel_r2_sr2                                                  == U2.sel_r2_sr2                                                 ) &&
    (U1.shake_force_done                                            == U2.shake_force_done                                           ) &&
    (U1.start_adder_mG                                              == U2.start_adder_mG                                             ) &&
    (U1.start_adder_r1r2h                                           == U2.start_adder_r1r2h                                          ) &&
    (U1.start_adder_sr2_plus_e                                      == U2.start_adder_sr2_plus_e                                     ) &&
    (U1.start_encode                                                == U2.start_encode                                               ) &&
    (U1.start_fw                                                    == U2.start_fw                                                   ) &&
    (U1.start_fw_transfer                                           == U2.start_fw_transfer                                          ) &&
    (U1.start_poly_mult_r2h                                         == U2.start_poly_mult_r2h                                        ) &&
    (U1.start_poly_mult_sr2                                         == U2.start_poly_mult_sr2                                        ) &&
    (U1.state                                                       == U2.state                                                      ) &&
    (U1.trx_state                                                   == U2.trx_state                                                  ) &&
    (U1.u_cpy_addr                                                  == U2.u_cpy_addr                                                 ) &&
    (U1.u_cpy_addr_reg                                              == U2.u_cpy_addr_reg                                             ) &&
    (U1.u_done                                                      == U2.u_done                                                     ) &&
    (U1.u_state                                                     == U2.u_state                                                    ) &&
    (U1.v_state                                                     == U2.v_state                                                    ) &&
    (U1.wen_fw                                                      == U2.wen_fw                                                     ) &&
    (U1.wen_u                                                       == U2.wen_u                                                      ) &&
    (U1.LOC_BASED_ADDER.add_out_addr_reg                            == U2.LOC_BASED_ADDER.add_out_addr_reg                           ) &&
    (U1.LOC_BASED_ADDER.add_out_valid_reg                           == U2.LOC_BASED_ADDER.add_out_valid_reg                          ) &&
    (U1.LOC_BASED_ADDER.done                                        == U2.LOC_BASED_ADDER.done                                       ) &&
    (U1.LOC_BASED_ADDER.done_reg                                    == U2.LOC_BASED_ADDER.done_reg                                   ) &&
    (U1.LOC_BASED_ADDER.done_reg_reg                                == U2.LOC_BASED_ADDER.done_reg_reg                               ) &&
    (U1.LOC_BASED_ADDER.loc_rd_addr                                 == U2.LOC_BASED_ADDER.loc_rd_addr                                ) &&
    (U1.LOC_BASED_ADDER.loc_rd_en                                   == U2.LOC_BASED_ADDER.loc_rd_en                                  ) &&
    (U1.LOC_BASED_ADDER.pm_rd_en                                    == U2.LOC_BASED_ADDER.pm_rd_en                                   ) &&
    (U1.LOC_BASED_ADDER.state                                       == U2.LOC_BASED_ADDER.state                                      ) &&
    (U1.POLY_MULT.addr_0_int_red_mem                                == U2.POLY_MULT.addr_0_int_red_mem                               ) &&
    (U1.POLY_MULT.addr_0_intermediate                               == U2.POLY_MULT.addr_0_intermediate                              ) &&
    (U1.POLY_MULT.addr_0_intermediate_reg                           == U2.POLY_MULT.addr_0_intermediate_reg                          ) &&
    (U1.POLY_MULT.addr_0_reg                                        == U2.POLY_MULT.addr_0_reg                                       ) &&
    (U1.POLY_MULT.addr_1_int_red_mem                                == U2.POLY_MULT.addr_1_int_red_mem                               ) &&
    (U1.POLY_MULT.addr_1_reg                                        == U2.POLY_MULT.addr_1_reg                                       ) &&
    (U1.POLY_MULT.count_chunks                                      == U2.POLY_MULT.count_chunks                                     ) &&
    (U1.POLY_MULT.count_chunks_inter_mem                            == U2.POLY_MULT.count_chunks_inter_mem                           ) &&
    (U1.POLY_MULT.din_0_intermediate                                == U2.POLY_MULT.din_0_intermediate                               ) &&
    (U1.POLY_MULT.din_1_intermediate                                == U2.POLY_MULT.din_1_intermediate                               ) &&
    (U1.POLY_MULT.dshift_reg                                        == U2.POLY_MULT.dshift_reg                                       ) &&
    (U1.POLY_MULT.dshift_reg_reg                                    == U2.POLY_MULT.dshift_reg_reg                                   ) &&
    (U1.POLY_MULT.inter_mem_wr_delay                                == U2.POLY_MULT.inter_mem_wr_delay                               ) &&
    (U1.POLY_MULT.loc_addr                                          == U2.POLY_MULT.loc_addr                                         ) &&
    (U1.POLY_MULT.loc_in_reg                                        == U2.POLY_MULT.loc_in_reg                                       ) &&
    (U1.POLY_MULT.qout_1_reg                                        == U2.POLY_MULT.qout_1_reg                                       ) &&
    (U1.POLY_MULT.state                                             == U2.POLY_MULT.state                                            ) &&
    (U1.POLY_MULT.valid                                             == U2.POLY_MULT.valid                                            ) &&
    (U1.POLY_MULT.wren_0_intermediate                               == U2.POLY_MULT.wren_0_intermediate                              ) &&
    (U1.POLY_MULT.wren_1_intermediate                               == U2.POLY_MULT.wren_1_intermediate                              ) &&
    (U1.r1_mem.mem                                                  == U2.r1_mem.mem                                                 ) &&
    (U1.r1_mem.q                                                    == U2.r1_mem.q                                                   ) &&
    (U1.r2_mem.mem                                                  == U2.r2_mem.mem                                                 ) &&
    (U1.r2_mem.q                                                    == U2.r2_mem.q                                                   ) &&
    (U1.u_mem.mem                                                   == U2.u_mem.mem                                                  ) &&
    (U1.u_mem.q                                                     == U2.u_mem.q                                                    ) &&
    (U1.XOR_BASED_ADDER.add_out                                     == U2.XOR_BASED_ADDER.add_out                                    ) &&
    (U1.XOR_BASED_ADDER.add_out_addr                                == U2.XOR_BASED_ADDER.add_out_addr                               ) &&
    (U1.XOR_BASED_ADDER.add_out_addr_reg                            == U2.XOR_BASED_ADDER.add_out_addr_reg                           ) &&
    (U1.XOR_BASED_ADDER.add_out_valid                               == U2.XOR_BASED_ADDER.add_out_valid                              ) &&
    (U1.XOR_BASED_ADDER.add_out_valid_reg                           == U2.XOR_BASED_ADDER.add_out_valid_reg                          ) &&
    (U1.XOR_BASED_ADDER.done                                        == U2.XOR_BASED_ADDER.done                                       ) &&
    (U1.XOR_BASED_ADDER.done_reg                                    == U2.XOR_BASED_ADDER.done_reg                                   ) &&
    (U1.XOR_BASED_ADDER.in_addr                                     == U2.XOR_BASED_ADDER.in_addr                                    ) &&
    (U1.XOR_BASED_ADDER.in_rd_en                                    == U2.XOR_BASED_ADDER.in_rd_en                                   ) &&
    (U1.XOR_BASED_ADDER.state                                       == U2.XOR_BASED_ADDER.state                                      ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.cdw_in                            == U2.ENCODE.REED_MULLER_ENCODE.cdw_in                           ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.count_cdw_bytes                   == U2.ENCODE.REED_MULLER_ENCODE.count_cdw_bytes                  ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.done                              == U2.ENCODE.REED_MULLER_ENCODE.done                             ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.init                              == U2.ENCODE.REED_MULLER_ENCODE.init                             ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.shift_cdw                         == U2.ENCODE.REED_MULLER_ENCODE.shift_cdw                        ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.state                             == U2.ENCODE.REED_MULLER_ENCODE.state                            ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.wr_en                             == U2.ENCODE.REED_MULLER_ENCODE.wr_en                            ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.capture_cdw                        == U2.ENCODE.REED_SOLOMON_CODE.capture_cdw                       ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.cdw_bytes                          == U2.ENCODE.REED_SOLOMON_CODE.cdw_bytes                         ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.count_msg_bytes                    == U2.ENCODE.REED_SOLOMON_CODE.count_msg_bytes                   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.done                               == U2.ENCODE.REED_SOLOMON_CODE.done                              ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.init_msg                           == U2.ENCODE.REED_SOLOMON_CODE.init_msg                          ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.msg                                == U2.ENCODE.REED_SOLOMON_CODE.msg                               ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.shift_msg                          == U2.ENCODE.REED_SOLOMON_CODE.shift_msg                         ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.state                              == U2.ENCODE.REED_SOLOMON_CODE.state                             ) &&
    (U1.genblk1.FIXEDWEIGHT.addr_bc                                 == U2.genblk1.FIXEDWEIGHT.addr_bc                                ) &&
    (U1.genblk1.FIXEDWEIGHT.count                                   == U2.genblk1.FIXEDWEIGHT.count                                  ) &&
    (U1.genblk1.FIXEDWEIGHT.count_steps                             == U2.genblk1.FIXEDWEIGHT.count_steps                            ) &&
    (U1.genblk1.FIXEDWEIGHT.done                                    == U2.genblk1.FIXEDWEIGHT.done                                   ) &&
    (U1.genblk1.FIXEDWEIGHT.dout_shake_reg                          == U2.genblk1.FIXEDWEIGHT.dout_shake_reg                         ) &&
    (U1.genblk1.FIXEDWEIGHT.dout_valid_sh_internal_reg              == U2.genblk1.FIXEDWEIGHT.dout_valid_sh_internal_reg             ) &&
    (U1.genblk1.FIXEDWEIGHT.duplicate_detected                      == U2.genblk1.FIXEDWEIGHT.duplicate_detected                     ) &&
    (U1.genblk1.FIXEDWEIGHT.force_done_shake                        == U2.genblk1.FIXEDWEIGHT.force_done_shake                       ) &&
    (U1.genblk1.FIXEDWEIGHT.n_minus_i                               == U2.genblk1.FIXEDWEIGHT.n_minus_i                              ) &&
    (U1.genblk1.FIXEDWEIGHT.rd_addr                                 == U2.genblk1.FIXEDWEIGHT.rd_addr                                ) &&
    (U1.genblk1.FIXEDWEIGHT.seed_addr                               == U2.genblk1.FIXEDWEIGHT.seed_addr                              ) &&
    (U1.genblk1.FIXEDWEIGHT.seed_is_loaded_in_shake                 == U2.genblk1.FIXEDWEIGHT.seed_is_loaded_in_shake                ) &&
    (U1.genblk1.FIXEDWEIGHT.seed_valid_internal                     == U2.genblk1.FIXEDWEIGHT.seed_valid_internal                    ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_input_type                        == U2.genblk1.FIXEDWEIGHT.shake_input_type                       ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_out_capture_ready                 == U2.genblk1.FIXEDWEIGHT.shake_out_capture_ready                ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_result_ready                      == U2.genblk1.FIXEDWEIGHT.shake_result_ready                     ) &&
    (U1.genblk1.FIXEDWEIGHT.state                                   == U2.genblk1.FIXEDWEIGHT.state                                  ) &&
    (U1.genblk1.FIXEDWEIGHT.state_shake                             == U2.genblk1.FIXEDWEIGHT.state_shake                            ) &&
    (U1.genblk1.FIXEDWEIGHT.swap                                    == U2.genblk1.FIXEDWEIGHT.swap                                   ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_addr                                 == U2.genblk1.FIXEDWEIGHT.wr_addr                                ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_en_0                                 == U2.genblk1.FIXEDWEIGHT.wr_en_0                                ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_en_1                                 == U2.genblk1.FIXEDWEIGHT.wr_en_1                                ) &&
    (U1.POLY_MULT.INTERLEAVED_RED_MEM.mem                           == U2.POLY_MULT.INTERLEAVED_RED_MEM.mem                          ) &&
    (U1.POLY_MULT.INTERLEAVED_RED_MEM.q_0                           == U2.POLY_MULT.INTERLEAVED_RED_MEM.q_0                          ) &&
    (U1.POLY_MULT.INTERLEAVED_RED_MEM.q_1                           == U2.POLY_MULT.INTERLEAVED_RED_MEM.q_1                          ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.CODEWORD.mem                      == U2.ENCODE.REED_MULLER_ENCODE.CODEWORD.mem                     ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.CODEWORD.q                        == U2.ENCODE.REED_MULLER_ENCODE.CODEWORD.q                       ) &&
    (U1.ENCODE.REED_MULLER_ENCODE.ENCODER.en_matrix                 == U2.ENCODE.REED_MULLER_ENCODE.ENCODER.en_matrix                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_CONST.mem                             == U2.genblk1.FIXEDWEIGHT.B_CONST.mem                            ) &&
    (U1.genblk1.FIXEDWEIGHT.B_CONST.q                               == U2.genblk1.FIXEDWEIGHT.B_CONST.q                              ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_0                        == U2.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_0                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_1                        == U2.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_1                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_2                        == U2.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_2                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_3                        == U2.genblk1.FIXEDWEIGHT.B_RED.a_in_reg_3                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.c                                 == U2.genblk1.FIXEDWEIGHT.B_RED.c                                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.c_plus_n_in                       == U2.genblk1.FIXEDWEIGHT.B_RED.c_plus_n_in                      ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.c_reg                             == U2.genblk1.FIXEDWEIGHT.B_RED.c_reg                            ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.done_2                            == U2.genblk1.FIXEDWEIGHT.B_RED.done_2                           ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.done_3                            == U2.genblk1.FIXEDWEIGHT.B_RED.done_3                           ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_0                        == U2.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_0                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_1                        == U2.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_1                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_2                        == U2.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_2                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_3                        == U2.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_3                       ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_reg                      == U2.genblk1.FIXEDWEIGHT.B_RED.n_in_reg_reg                     ) &&
    (U1.genblk1.FIXEDWEIGHT.loca_mem.mem                            == U2.genblk1.FIXEDWEIGHT.loca_mem.mem                           ) &&
    (U1.genblk1.FIXEDWEIGHT.loca_mem.q_0                            == U2.genblk1.FIXEDWEIGHT.loca_mem.q_0                           ) &&
    (U1.genblk1.FIXEDWEIGHT.loca_mem.q_1                            == U2.genblk1.FIXEDWEIGHT.loca_mem.q_1                           ) &&
    (U1.genblk1.FIXEDWEIGHT.mem_single_seed.mem                     == U2.genblk1.FIXEDWEIGHT.mem_single_seed.mem                    ) &&
    (U1.genblk1.FIXEDWEIGHT.mem_single_seed.q                       == U2.genblk1.FIXEDWEIGHT.mem_single_seed.q                      ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[10].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[11].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[12].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[13].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[14].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[15].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[16].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[17].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[18].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[19].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[1].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[20].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[21].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[22].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[23].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[24].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[25].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[26].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[27].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[28].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[29].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[2].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[30].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[31].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[32].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[33].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[34].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[35].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[36].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[37].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[38].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[39].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[3].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[40].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[41].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[42].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[43].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[44].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[45].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[46].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[47].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[48].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[49].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[4].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[50].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[51].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[52].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[53].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[54].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[55].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[56].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[57].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[58].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[59].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[5].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.done_reg_1 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.done_reg_1) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.done_reg_2 == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.done_reg_2) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.in_1_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.in_1_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.in_2_reg   == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.in_2_reg  ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.out_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[60].GFMUL.out_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[6].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[7].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[8].GFMUL.out_reg    ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.done_reg_1  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.done_reg_1 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.done_reg_2  == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.done_reg_2 ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.in_1_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.in_1_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.in_2_reg    == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.in_2_reg   ) &&
    (U1.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.out_reg     == U2.ENCODE.REED_SOLOMON_CODE.GF_MUL_SERIES[9].GFMUL.out_reg    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a0b0                         == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a0b0                        ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a0b0_reg                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a0b0_reg                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a0b0_reg_reg                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a0b0_reg_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a1b1                         == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a1b1                        ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a1b1_reg                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a1b1_reg                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a1b1_reg_reg                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a1b1_reg_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg_out                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg_out                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg_reg                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg_reg_reg             == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.a_in_reg_reg_reg            ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.ab_out                       == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.ab_out                      ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.add_a0a1                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.add_a0a1                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.add_a0b0_a1b1                == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.add_a0b0_a1b1               ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.add_b0b1                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.add_b0b1                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.done                         == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.done                        ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.done_reg_0                   == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.done_reg_0                  ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.done_reg_1                   == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.done_reg_1                  ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.done_reg_2                   == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.done_reg_2                  ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.mul_a0a1_b0b1                == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.mul_a0a1_b0b1               ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_1.sub_mul_ab_add_ab            == U2.genblk1.FIXEDWEIGHT.B_RED.KM_1.sub_mul_ab_add_ab           ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a0b0                         == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a0b0                        ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a0b0_reg                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a0b0_reg                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a0b0_reg_reg                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a0b0_reg_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a1b1                         == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a1b1                        ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a1b1_reg                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a1b1_reg                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a1b1_reg_reg                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a1b1_reg_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg_out                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg_out                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg_reg                 == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg_reg_reg             == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.a_in_reg_reg_reg            ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.ab_out                       == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.ab_out                      ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.add_a0a1                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.add_a0a1                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.add_a0b0_a1b1                == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.add_a0b0_a1b1               ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.add_b0b1                     == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.add_b0b1                    ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.done                         == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.done                        ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.done_reg_0                   == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.done_reg_0                  ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.done_reg_1                   == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.done_reg_1                  ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.done_reg_2                   == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.done_reg_2                  ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.mul_a0a1_b0b1                == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.mul_a0a1_b0b1               ) &&
    (U1.genblk1.FIXEDWEIGHT.B_RED.KM_2.sub_mul_ab_add_ab            == U2.genblk1.FIXEDWEIGHT.B_RED.KM_2.sub_mul_ab_add_ab           )
  );
  endfunction


    // ========================== //
   // Control Output Equivalence //
  // ========================== //

  function automatic control_output_equivalence();
  control_output_equivalence = (
    (U1.done              == U2.done             ) &&
    (U1.done_fixed_weight == U2.done_fixed_weight) &&
    (U1.shake_din_valid   == U2.shake_din_valid  ) &&
    (U1.shake_dout_ready  == U2.shake_dout_ready ) &&
    (U1.shake_force_done  == U2.shake_force_done ) &&
    (U1.u_v_out           == U2.u_v_out          )
  );
  endfunction


    // ============== //
   // Reset Sequence //
  // ============== //

  sequence reset_sequence;
    (rst == 1'b1);
  endsequence


    // ================================ //
   // UPEC for Data-Independent Timing //
  // ================================ //

  property upec_dit_unrolled_p;
    state_equivalence()
  implies
    control_output_equivalence() [*MAX_LATENCY];
  endproperty
  upec_dit_unrolled_p_a: assert property (disable iff (rst) upec_dit_unrolled_p);


endmodule

bind encrypt_miter property_checker checker_bind(.rst(rst), .clk(clk));

