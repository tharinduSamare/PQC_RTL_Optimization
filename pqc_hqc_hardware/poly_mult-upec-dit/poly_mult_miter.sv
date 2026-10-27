`default_nettype wire

module poly_mult_miter (
  input  logic         clk,
  input  logic         rst,
  input  logic [7:0]   add_addr_1,    add_addr_2,
  input  logic [127:0] add_in_1,      add_in_2,
  input  logic         add_wr_en_1,   add_wr_en_2,
  output logic [8:0]   addr_0_1,      addr_0_2,
  output logic [8:0]   addr_1_1,      addr_1_2,
  input  logic [7:0]   addr_result_1, addr_result_2,
  output logic [127:0] dout_1,        dout_2,
  output logic [15:0]  loc_addr_1,    loc_addr_2,
  input  logic [14:0]  loc_in_1,      loc_in_2,
  input  logic [127:0] mux_word_0_1,  mux_word_0_2,
  input  logic [127:0] mux_word_1_1,  mux_word_1_2,
  input  logic         rd_dout_1,     rd_dout_2,
  input  logic         start_1,       start_2,
  output logic         valid_1,       valid_2,
  input  logic [7:0]   weight_1,      weight_2
);

  poly_mult U1 (
    .clk         (clk          ),
    .rst         (rst          ),
    .add_addr    (add_addr_1   ),
    .add_in      (add_in_1     ),
    .add_wr_en   (add_wr_en_1  ),
    .addr_0      (addr_0_1     ),
    .addr_1      (addr_1_1     ),
    .addr_result (addr_result_1),
    .dout        (dout_1       ),
    .loc_addr    (loc_addr_1   ),
    .loc_in      (loc_in_1     ),
    .mux_word_0  (mux_word_0_1 ),
    .mux_word_1  (mux_word_1_1 ),
    .rd_dout     (rd_dout_1    ),
    .start       (start_1      ),
    .valid       (valid_1      ),
    .weight      (weight_1     )
  );

  poly_mult U2 (
    .clk         (clk          ),
    .rst         (rst          ),
    .add_addr    (add_addr_2   ),
    .add_in      (add_in_2     ),
    .add_wr_en   (add_wr_en_2  ),
    .addr_0      (addr_0_2     ),
    .addr_1      (addr_1_2     ),
    .addr_result (addr_result_2),
    .dout        (dout_2       ),
    .loc_addr    (loc_addr_2   ),
    .loc_in      (loc_in_2     ),
    .mux_word_0  (mux_word_0_2 ),
    .mux_word_1  (mux_word_1_2 ),
    .rd_dout     (rd_dout_2    ),
    .start       (start_2      ),
    .valid       (valid_2      ),
    .weight      (weight_2     )
  );

endmodule
