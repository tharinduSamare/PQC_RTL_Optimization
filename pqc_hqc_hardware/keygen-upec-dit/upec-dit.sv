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
    (U1.keygen_out_en    == U2.keygen_out_en   ) &&
    (U1.keygen_out_type  == U2.keygen_out_type ) &&
    (U1.pk_seed_wen      == U2.pk_seed_wen     ) &&
    (U1.shake_din_ready  == U2.shake_din_ready ) &&
    (U1.shake_dout_valid == U2.shake_dout_valid) &&
    (U1.sk_seed_wen      == U2.sk_seed_wen     ) &&
    (U1.start            == U2.start           );
  endproperty
  control_input_c_a: assume property (control_input_c);


    // ================= //
   // State Equivalence //
  // ================= //

  function automatic state_equivalence();
  state_equivalence = (
    (U1.done                                                          == U2.done                                                         ) &&
    (U1.rand_out_addr_0_reg                                           == U2.rand_out_addr_0_reg                                          ) &&
    (U1.rand_out_addr_1_reg                                           == U2.rand_out_addr_1_reg                                          ) &&
    (U1.rand_out_rd                                                   == U2.rand_out_rd                                                  ) &&
    (U1.rd_x                                                          == U2.rd_x                                                         ) &&
    (U1.rd_y                                                          == U2.rd_y                                                         ) &&
    (U1.request_another_vector                                        == U2.request_another_vector                                       ) &&
    (U1.sel_fw                                                        == U2.sel_fw                                                       ) &&
    (U1.sel_x                                                         == U2.sel_x                                                        ) &&
    (U1.shake_din                                                     == U2.shake_din                                                    ) &&
    (U1.shake_din_valid                                               == U2.shake_din_valid                                              ) &&
    (U1.shake_force_done                                              == U2.shake_force_done                                             ) &&
    (U1.start_adder                                                   == U2.start_adder                                                  ) &&
    (U1.start_fw                                                      == U2.start_fw                                                     ) &&
    (U1.start_poly_mult                                               == U2.start_poly_mult                                              ) &&
    (U1.start_vec_random                                              == U2.start_vec_random                                             ) &&
    (U1.start_x_transfer                                              == U2.start_x_transfer                                             ) &&
    (U1.state                                                         == U2.state                                                        ) &&
    (U1.trx_state                                                     == U2.trx_state                                                    ) &&
    (U1.wen_x                                                         == U2.wen_x                                                        ) &&
    (U1.x_addr                                                        == U2.x_addr                                                       ) &&
    (U1.x_addr_reg                                                    == U2.x_addr_reg                                                   ) &&
    (U1.x_transfer_done                                               == U2.x_transfer_done                                              ) &&
    (U1.LOC_BASED_ADDER.add_out_addr_reg                              == U2.LOC_BASED_ADDER.add_out_addr_reg                             ) &&
    (U1.LOC_BASED_ADDER.add_out_valid_reg                             == U2.LOC_BASED_ADDER.add_out_valid_reg                            ) &&
    (U1.LOC_BASED_ADDER.done                                          == U2.LOC_BASED_ADDER.done                                         ) &&
    (U1.LOC_BASED_ADDER.done_reg                                      == U2.LOC_BASED_ADDER.done_reg                                     ) &&
    (U1.LOC_BASED_ADDER.done_reg_reg                                  == U2.LOC_BASED_ADDER.done_reg_reg                                 ) &&
    (U1.LOC_BASED_ADDER.loc_rd_addr                                   == U2.LOC_BASED_ADDER.loc_rd_addr                                  ) &&
    (U1.LOC_BASED_ADDER.loc_rd_en                                     == U2.LOC_BASED_ADDER.loc_rd_en                                    ) &&
    (U1.LOC_BASED_ADDER.pm_rd_en                                      == U2.LOC_BASED_ADDER.pm_rd_en                                     ) &&
    (U1.LOC_BASED_ADDER.state                                         == U2.LOC_BASED_ADDER.state                                        ) &&
    (U1.POLY_MULT.addr_0_int_red_mem                                  == U2.POLY_MULT.addr_0_int_red_mem                                 ) &&
    (U1.POLY_MULT.addr_0_intermediate                                 == U2.POLY_MULT.addr_0_intermediate                                ) &&
    (U1.POLY_MULT.addr_0_intermediate_reg                             == U2.POLY_MULT.addr_0_intermediate_reg                            ) &&
    (U1.POLY_MULT.addr_0_reg                                          == U2.POLY_MULT.addr_0_reg                                         ) &&
    (U1.POLY_MULT.addr_1_int_red_mem                                  == U2.POLY_MULT.addr_1_int_red_mem                                 ) &&
    (U1.POLY_MULT.addr_1_reg                                          == U2.POLY_MULT.addr_1_reg                                         ) &&
    (U1.POLY_MULT.count_chunks                                        == U2.POLY_MULT.count_chunks                                       ) &&
    (U1.POLY_MULT.count_chunks_inter_mem                              == U2.POLY_MULT.count_chunks_inter_mem                             ) &&
    (U1.POLY_MULT.din_0_intermediate                                  == U2.POLY_MULT.din_0_intermediate                                 ) &&
    (U1.POLY_MULT.din_1_intermediate                                  == U2.POLY_MULT.din_1_intermediate                                 ) &&
    (U1.POLY_MULT.dshift_reg                                          == U2.POLY_MULT.dshift_reg                                         ) &&
    (U1.POLY_MULT.dshift_reg_reg                                      == U2.POLY_MULT.dshift_reg_reg                                     ) &&
    (U1.POLY_MULT.inter_mem_wr_delay                                  == U2.POLY_MULT.inter_mem_wr_delay                                 ) &&
    (U1.POLY_MULT.loc_addr                                            == U2.POLY_MULT.loc_addr                                           ) &&
    (U1.POLY_MULT.loc_in_reg                                          == U2.POLY_MULT.loc_in_reg                                         ) &&
    (U1.POLY_MULT.qout_1_reg                                          == U2.POLY_MULT.qout_1_reg                                         ) &&
    (U1.POLY_MULT.state                                               == U2.POLY_MULT.state                                              ) &&
    (U1.POLY_MULT.valid                                               == U2.POLY_MULT.valid                                              ) &&
    (U1.POLY_MULT.wren_0_intermediate                                 == U2.POLY_MULT.wren_0_intermediate                                ) &&
    (U1.POLY_MULT.wren_1_intermediate                                 == U2.POLY_MULT.wren_1_intermediate                                ) &&
    (U1.VECTSETRAND.count_steps                                       == U2.VECTSETRAND.count_steps                                      ) &&
    (U1.VECTSETRAND.done                                              == U2.VECTSETRAND.done                                             ) &&
    (U1.VECTSETRAND.done_reg                                          == U2.VECTSETRAND.done_reg                                         ) &&
    (U1.VECTSETRAND.pk_rand_addr                                      == U2.VECTSETRAND.pk_rand_addr                                     ) &&
    (U1.VECTSETRAND.pk_rand_addr_reg                                  == U2.VECTSETRAND.pk_rand_addr_reg                                 ) &&
    (U1.VECTSETRAND.pk_state                                          == U2.VECTSETRAND.pk_state                                         ) &&
    (U1.VECTSETRAND.rand_out_rearrange                                == U2.VECTSETRAND.rand_out_rearrange                               ) &&
    (U1.VECTSETRAND.rand_out_rearrange_reg                            == U2.VECTSETRAND.rand_out_rearrange_reg                           ) &&
    (U1.VECTSETRAND.rmem_addr_rev                                     == U2.VECTSETRAND.rmem_addr_rev                                    ) &&
    (U1.VECTSETRAND.rmem_wen                                          == U2.VECTSETRAND.rmem_wen                                         ) &&
    (U1.VECTSETRAND.seed_addr                                         == U2.VECTSETRAND.seed_addr                                        ) &&
    (U1.VECTSETRAND.sel_rmem                                          == U2.VECTSETRAND.sel_rmem                                         ) &&
    (U1.VECTSETRAND.sel_rmem_reg                                      == U2.VECTSETRAND.sel_rmem_reg                                     ) &&
    (U1.VECTSETRAND.shake_din_valid                                   == U2.VECTSETRAND.shake_din_valid                                  ) &&
    (U1.VECTSETRAND.shake_dout_ready                                  == U2.VECTSETRAND.shake_dout_ready                                 ) &&
    (U1.VECTSETRAND.shake_dout_valid_reg                              == U2.VECTSETRAND.shake_dout_valid_reg                             ) &&
    (U1.VECTSETRAND.shake_force_done                                  == U2.VECTSETRAND.shake_force_done                                 ) &&
    (U1.VECTSETRAND.shake_input_type                                  == U2.VECTSETRAND.shake_input_type                                 ) &&
    (U1.VECTSETRAND.shake_result_ready                                == U2.VECTSETRAND.shake_result_ready                               ) &&
    (U1.VECTSETRAND.state_shake                                       == U2.VECTSETRAND.state_shake                                      ) &&
    (U1.VECTSETRAND.wr_en_rand                                        == U2.VECTSETRAND.wr_en_rand                                       ) &&
    (U1.x_mem.mem                                                     == U2.x_mem.mem                                                    ) &&
    (U1.x_mem.q                                                       == U2.x_mem.q                                                      ) &&
    (U1.genblk1.FIXEDWEIGHT.count_red                                 == U2.genblk1.FIXEDWEIGHT.count_red                                ) &&
    (U1.genblk1.FIXEDWEIGHT.count_steps                               == U2.genblk1.FIXEDWEIGHT.count_steps                              ) &&
    (U1.genblk1.FIXEDWEIGHT.ctx_state                                 == U2.genblk1.FIXEDWEIGHT.ctx_state                                ) &&
    (U1.genblk1.FIXEDWEIGHT.decrease_weight_count                     == U2.genblk1.FIXEDWEIGHT.decrease_weight_count                    ) &&
    (U1.genblk1.FIXEDWEIGHT.dout_shake_reg                            == U2.genblk1.FIXEDWEIGHT.dout_shake_reg                           ) &&
    (U1.genblk1.FIXEDWEIGHT.dout_valid_sh_internal_reg                == U2.genblk1.FIXEDWEIGHT.dout_valid_sh_internal_reg               ) &&
    (U1.genblk1.FIXEDWEIGHT.init_mem_onegen                           == U2.genblk1.FIXEDWEIGHT.init_mem_onegen                          ) &&
    (U1.genblk1.FIXEDWEIGHT.rd_addr_ctx                               == U2.genblk1.FIXEDWEIGHT.rd_addr_ctx                              ) &&
    (U1.genblk1.FIXEDWEIGHT.red_state                                 == U2.genblk1.FIXEDWEIGHT.red_state                                ) &&
    (U1.genblk1.FIXEDWEIGHT.seed_addr                                 == U2.genblk1.FIXEDWEIGHT.seed_addr                                ) &&
    (U1.genblk1.FIXEDWEIGHT.seed_is_loaded_in_shake                   == U2.genblk1.FIXEDWEIGHT.seed_is_loaded_in_shake                  ) &&
    (U1.genblk1.FIXEDWEIGHT.seed_valid_internal                       == U2.genblk1.FIXEDWEIGHT.seed_valid_internal                      ) &&
    (U1.genblk1.FIXEDWEIGHT.sel_ctx                                   == U2.genblk1.FIXEDWEIGHT.sel_ctx                                  ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_input_type                          == U2.genblk1.FIXEDWEIGHT.shake_input_type                         ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_out_capture_ready                   == U2.genblk1.FIXEDWEIGHT.shake_out_capture_ready                  ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_output_counter                      == U2.genblk1.FIXEDWEIGHT.shake_output_counter                     ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_result_ready                        == U2.genblk1.FIXEDWEIGHT.shake_result_ready                       ) &&
    (U1.genblk1.FIXEDWEIGHT.squeeze_ctrl                              == U2.genblk1.FIXEDWEIGHT.squeeze_ctrl                             ) &&
    (U1.genblk1.FIXEDWEIGHT.squeeze_more                              == U2.genblk1.FIXEDWEIGHT.squeeze_more                             ) &&
    (U1.genblk1.FIXEDWEIGHT.start_onegen                              == U2.genblk1.FIXEDWEIGHT.start_onegen                             ) &&
    (U1.genblk1.FIXEDWEIGHT.start_red                                 == U2.genblk1.FIXEDWEIGHT.start_red                                ) &&
    (U1.genblk1.FIXEDWEIGHT.state_shake                               == U2.genblk1.FIXEDWEIGHT.state_shake                              ) &&
    (U1.genblk1.FIXEDWEIGHT.weight_counter_init                       == U2.genblk1.FIXEDWEIGHT.weight_counter_init                      ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_addr_ctx                               == U2.genblk1.FIXEDWEIGHT.wr_addr_ctx                              ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_addr_ms                                == U2.genblk1.FIXEDWEIGHT.wr_addr_ms                               ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_addr_ms_reg_0                          == U2.genblk1.FIXEDWEIGHT.wr_addr_ms_reg_0                         ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_addr_ms_reg_1                          == U2.genblk1.FIXEDWEIGHT.wr_addr_ms_reg_1                         ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_en_ms                                  == U2.genblk1.FIXEDWEIGHT.wr_en_ms                                 ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_en_ms_reg_0                            == U2.genblk1.FIXEDWEIGHT.wr_en_ms_reg_0                           ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_en_ms_reg_1                            == U2.genblk1.FIXEDWEIGHT.wr_en_ms_reg_1                           ) &&
    (U1.genblk1.FIXEDWEIGHT.wr_en_shake_ctx                           == U2.genblk1.FIXEDWEIGHT.wr_en_shake_ctx                          ) &&
    (U1.POLY_MULT.INTERLEAVED_RED_MEM.mem                             == U2.POLY_MULT.INTERLEAVED_RED_MEM.mem                            ) &&
    (U1.POLY_MULT.INTERLEAVED_RED_MEM.q_0                             == U2.POLY_MULT.INTERLEAVED_RED_MEM.q_0                            ) &&
    (U1.POLY_MULT.INTERLEAVED_RED_MEM.q_1                             == U2.POLY_MULT.INTERLEAVED_RED_MEM.q_1                            ) &&
    (U1.VECTSETRAND.mem_pk_seed.mem                                   == U2.VECTSETRAND.mem_pk_seed.mem                                  ) &&
    (U1.VECTSETRAND.mem_pk_seed.q                                     == U2.VECTSETRAND.mem_pk_seed.q                                    ) &&
    (U1.VECTSETRAND.rand_mem.mem                                      == U2.VECTSETRAND.rand_mem.mem                                     ) &&
    (U1.VECTSETRAND.rand_mem.q_0                                      == U2.VECTSETRAND.rand_mem.q_0                                     ) &&
    (U1.VECTSETRAND.rand_mem.q_1                                      == U2.VECTSETRAND.rand_mem.q_1                                     ) &&
    (U1.genblk1.FIXEDWEIGHT.loca_mem.mem                              == U2.genblk1.FIXEDWEIGHT.loca_mem.mem                             ) &&
    (U1.genblk1.FIXEDWEIGHT.loca_mem.q                                == U2.genblk1.FIXEDWEIGHT.loca_mem.q                               ) &&
    (U1.genblk1.FIXEDWEIGHT.mem_single_seed.mem                       == U2.genblk1.FIXEDWEIGHT.mem_single_seed.mem                      ) &&
    (U1.genblk1.FIXEDWEIGHT.mem_single_seed.q                         == U2.genblk1.FIXEDWEIGHT.mem_single_seed.q                        ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.addr_0                    == U2.genblk1.FIXEDWEIGHT.onegen_instance.addr_0                   ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.addr_1                    == U2.genblk1.FIXEDWEIGHT.onegen_instance.addr_1                   ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg             == U2.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg            ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg_reg         == U2.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg_reg        ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg_reg_reg     == U2.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg_reg_reg    ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg_reg_reg_reg == U2.genblk1.FIXEDWEIGHT.onegen_instance.collision_reg_reg_reg_reg) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.count_reg                 == U2.genblk1.FIXEDWEIGHT.onegen_instance.count_reg                ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.count_sim_cycles          == U2.genblk1.FIXEDWEIGHT.onegen_instance.count_sim_cycles         ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.done_s                    == U2.genblk1.FIXEDWEIGHT.onegen_instance.done_s                   ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.init                      == U2.genblk1.FIXEDWEIGHT.onegen_instance.init                     ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.rd_addr                   == U2.genblk1.FIXEDWEIGHT.onegen_instance.rd_addr                  ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.rd_en                     == U2.genblk1.FIXEDWEIGHT.onegen_instance.rd_en                    ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.reading_out               == U2.genblk1.FIXEDWEIGHT.onegen_instance.reading_out              ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.ready_s                   == U2.genblk1.FIXEDWEIGHT.onegen_instance.ready_s                  ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.state                     == U2.genblk1.FIXEDWEIGHT.onegen_instance.state                    ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.valid_s                   == U2.genblk1.FIXEDWEIGHT.onegen_instance.valid_s                  ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.wren_0                    == U2.genblk1.FIXEDWEIGHT.onegen_instance.wren_0                   ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.wren_1                    == U2.genblk1.FIXEDWEIGHT.onegen_instance.wren_1                   ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_ctx.mem                             == U2.genblk1.FIXEDWEIGHT.shake_ctx.mem                            ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_ctx.q_0                             == U2.genblk1.FIXEDWEIGHT.shake_ctx.q_0                            ) &&
    (U1.genblk1.FIXEDWEIGHT.shake_ctx.q_1                             == U2.genblk1.FIXEDWEIGHT.shake_ctx.q_1                            ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.mem_dual_A.mem            == U2.genblk1.FIXEDWEIGHT.onegen_instance.mem_dual_A.mem           ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.mem_dual_A.q_0            == U2.genblk1.FIXEDWEIGHT.onegen_instance.mem_dual_A.q_0           ) &&
    (U1.genblk1.FIXEDWEIGHT.onegen_instance.mem_dual_A.q_1            == U2.genblk1.FIXEDWEIGHT.onegen_instance.mem_dual_A.q_1           ) &&
    (U1.genblk1.FIXEDWEIGHT.reduction.genblk1.a_r                     == U2.genblk1.FIXEDWEIGHT.reduction.genblk1.a_r                    ) &&
    (U1.genblk1.FIXEDWEIGHT.reduction.genblk1.c_temp                  == U2.genblk1.FIXEDWEIGHT.reduction.genblk1.c_temp                 ) &&
    (U1.genblk1.FIXEDWEIGHT.reduction.genblk1.t                       == U2.genblk1.FIXEDWEIGHT.reduction.genblk1.t                      )
  );
  endfunction


    // ========================== //
   // Control Output Equivalence //
  // ========================== //

  function automatic control_output_equivalence();
  control_output_equivalence = (
    (U1.done             == U2.done            ) &&
    (U1.shake_din_valid  == U2.shake_din_valid ) &&
    (U1.shake_dout_ready == U2.shake_dout_ready) &&
    (U1.shake_force_done == U2.shake_force_done)
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

bind keygen_miter property_checker checker_bind(.rst(rst), .clk(clk));

