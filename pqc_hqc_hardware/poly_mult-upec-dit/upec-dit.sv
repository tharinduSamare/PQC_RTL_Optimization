module property_checker
  (
  input clk,
  input rst
  );

  default clocking default_clk @(posedge clk); endclocking

  localparam MAX_LATENCY = 10;
  `include "tidal.sv"

    // ======================== //
   // Control Input Constraint //
  // ======================== //

  property control_input_c;
    (U1.add_addr    == U2.add_addr   ) &&
    (U1.add_wr_en   == U2.add_wr_en  ) &&
    (U1.addr_result == U2.addr_result) &&
    (U1.rd_dout     == U2.rd_dout    ) &&
    (U1.start       == U2.start      ) &&
    (U1.weight      == U2.weight     );
  endproperty
  control_input_c_a: assume property (control_input_c);


    // ================= //
   // State Equivalence //
  // ================= //

  function automatic state_equivalence();
  state_equivalence = (
    (U1.addr_0_int_red_mem      == U2.addr_0_int_red_mem     ) &&
    (U1.addr_0_intermediate     == U2.addr_0_intermediate    ) &&
    (U1.addr_0_intermediate_reg == U2.addr_0_intermediate_reg) &&
    (U1.addr_0_reg              == U2.addr_0_reg             ) &&
    (U1.addr_1_int_red_mem      == U2.addr_1_int_red_mem     ) &&
    (U1.addr_1_reg              == U2.addr_1_reg             ) &&
    (U1.count_chunks            == U2.count_chunks           ) &&
    (U1.count_chunks_inter_mem  == U2.count_chunks_inter_mem ) &&
    (U1.din_0_intermediate      == U2.din_0_intermediate     ) &&
    (U1.din_1_intermediate      == U2.din_1_intermediate     ) &&
    (U1.dshift_reg              == U2.dshift_reg             ) &&
    (U1.dshift_reg_reg          == U2.dshift_reg_reg         ) &&
    (U1.inter_mem_wr_delay      == U2.inter_mem_wr_delay     ) &&
    (U1.loc_addr                == U2.loc_addr               ) &&
    (U1.loc_in_reg              == U2.loc_in_reg             ) &&
    (U1.qout_1_reg              == U2.qout_1_reg             ) &&
    (U1.state                   == U2.state                  ) &&
    (U1.valid                   == U2.valid                  ) &&
    (U1.wren_0_intermediate     == U2.wren_0_intermediate    ) &&
    (U1.wren_1_intermediate     == U2.wren_1_intermediate    ) &&
    (U1.INTERLEAVED_RED_MEM.mem == U2.INTERLEAVED_RED_MEM.mem) &&
    (U1.INTERLEAVED_RED_MEM.q_0 == U2.INTERLEAVED_RED_MEM.q_0) &&
    (U1.INTERLEAVED_RED_MEM.q_1 == U2.INTERLEAVED_RED_MEM.q_1)
  );
  endfunction

    // ================= //
   // Control State Equivalence //
  // ================= //

  function automatic control_state_equivalence();
  control_state_equivalence = (
    // (U1.addr_0_int_red_mem      == U2.addr_0_int_red_mem     ) &&
    // (U1.addr_0_intermediate     == U2.addr_0_intermediate    ) &&
    // (U1.addr_0_intermediate_reg == U2.addr_0_intermediate_reg) &&
    // (U1.addr_0_reg              == U2.addr_0_reg             ) &&
    // (U1.addr_1_int_red_mem      == U2.addr_1_int_red_mem     ) &&
    // (U1.addr_1_reg              == U2.addr_1_reg             ) &&
    (U1.count_chunks            == U2.count_chunks           ) &&
    (U1.count_chunks_inter_mem  == U2.count_chunks_inter_mem ) &&
    // (U1.din_0_intermediate      == U2.din_0_intermediate     ) &&
    // (U1.din_1_intermediate      == U2.din_1_intermediate     ) &&
    // (U1.dshift_reg              == U2.dshift_reg             ) &&
    // (U1.dshift_reg_reg          == U2.dshift_reg_reg         ) &&
    (U1.inter_mem_wr_delay      == U2.inter_mem_wr_delay     ) &&
    (U1.loc_addr                == U2.loc_addr               ) &&
    // (U1.loc_in_reg              == U2.loc_in_reg             ) &&
    // (U1.qout_1_reg              == U2.qout_1_reg             ) &&
    (U1.state                   == U2.state                  ) &&
    (U1.valid                   == U2.valid                  ) &&
    (U1.wren_0_intermediate     == U2.wren_0_intermediate    ) &&
    (U1.wren_1_intermediate     == U2.wren_1_intermediate    )
    // (U1.INTERLEAVED_RED_MEM.mem == U2.INTERLEAVED_RED_MEM.mem) &&
    // (U1.INTERLEAVED_RED_MEM.q_0 == U2.INTERLEAVED_RED_MEM.q_0) &&
    // (U1.INTERLEAVED_RED_MEM.q_1 == U2.INTERLEAVED_RED_MEM.q_1)
  );
  endfunction



    // ========================== //
   // Control Output Equivalence //
  // ========================== //

  function automatic control_output_equivalence();
  control_output_equivalence = (
    (U1.loc_addr == U2.loc_addr) &&
    (U1.valid    == U2.valid   )
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

property dit_base_p;
  t ##0 reset_sequence
  implies
  t ##1 control_state_equivalence() and
  t ##1 control_output_equivalence();
endproperty
dit_base_p_a: assert property (dit_base_p);

property dit_step_p;
  t ##0 control_state_equivalence()
  implies
  t ##1 control_state_equivalence() and 
  t ##1 control_output_equivalence()
endproperty
dit_step_p_a: assert property (disable iff (rst) dit_step_p);

endmodule

bind poly_mult_miter property_checker checker_bind(.rst(rst), .clk(clk));

