`default_nettype wire

module keygen_miter (
  input  logic         clk,
  input  logic         rst,
  output logic         done_1,             done_2,
  output logic [127:0] keygen_out_1,       keygen_out_2,
  input  logic [7:0]   keygen_out_addr_1,  keygen_out_addr_2,
  input  logic         keygen_out_en_1,    keygen_out_en_2,
  input  logic [1:0]   keygen_out_type_1,  keygen_out_type_2,
  input  logic [31:0]  pk_seed_1,          pk_seed_2,
  input  logic [3:0]   pk_seed_addr_1,     pk_seed_addr_2,
  input  logic         pk_seed_wen_1,      pk_seed_wen_2,
  output logic [31:0]  shake_din_1,        shake_din_2,
  input  logic         shake_din_ready_1,  shake_din_ready_2,
  output logic         shake_din_valid_1,  shake_din_valid_2,
  output logic         shake_dout_ready_1, shake_dout_ready_2,
  input  logic [31:0]  shake_dout_scram_1, shake_dout_scram_2,
  input  logic         shake_dout_valid_1, shake_dout_valid_2,
  output logic         shake_force_done_1, shake_force_done_2,
  input  logic [31:0]  sk_seed_1,          sk_seed_2,
  input  logic [3:0]   sk_seed_addr_1,     sk_seed_addr_2,
  input  logic         sk_seed_wen_1,      sk_seed_wen_2,
  input  logic         start_1,            start_2
);

  keygen U1 (
    .clk              (clk               ),
    .rst              (rst               ),
    .done             (done_1            ),
    .keygen_out       (keygen_out_1      ),
    .keygen_out_addr  (keygen_out_addr_1 ),
    .keygen_out_en    (keygen_out_en_1   ),
    .keygen_out_type  (keygen_out_type_1 ),
    .pk_seed          (pk_seed_1         ),
    .pk_seed_addr     (pk_seed_addr_1    ),
    .pk_seed_wen      (pk_seed_wen_1     ),
    .shake_din        (shake_din_1       ),
    .shake_din_ready  (shake_din_ready_1 ),
    .shake_din_valid  (shake_din_valid_1 ),
    .shake_dout_ready (shake_dout_ready_1),
    .shake_dout_scram (shake_dout_scram_1),
    .shake_dout_valid (shake_dout_valid_1),
    .shake_force_done (shake_force_done_1),
    .sk_seed          (sk_seed_1         ),
    .sk_seed_addr     (sk_seed_addr_1    ),
    .sk_seed_wen      (sk_seed_wen_1     ),
    .start            (start_1           )
  );

  keygen U2 (
    .clk              (clk               ),
    .rst              (rst               ),
    .done             (done_2            ),
    .keygen_out       (keygen_out_2      ),
    .keygen_out_addr  (keygen_out_addr_2 ),
    .keygen_out_en    (keygen_out_en_2   ),
    .keygen_out_type  (keygen_out_type_2 ),
    .pk_seed          (pk_seed_2         ),
    .pk_seed_addr     (pk_seed_addr_2    ),
    .pk_seed_wen      (pk_seed_wen_2     ),
    .shake_din        (shake_din_2       ),
    .shake_din_ready  (shake_din_ready_2 ),
    .shake_din_valid  (shake_din_valid_2 ),
    .shake_dout_ready (shake_dout_ready_2),
    .shake_dout_scram (shake_dout_scram_2),
    .shake_dout_valid (shake_dout_valid_2),
    .shake_force_done (shake_force_done_2),
    .sk_seed          (sk_seed_2         ),
    .sk_seed_addr     (sk_seed_addr_2    ),
    .sk_seed_wen      (sk_seed_wen_2     ),
    .start            (start_2           )
  );

endmodule
