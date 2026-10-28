# Poly_mult module UPEC-DIT verification

## `poly_mult` I/O Description

- Control Inputs
  - add_addr    
  - add_wr_en   
  - addr_result 
  - rd_dout     
  - start       
  - weight      

- Control Outputs
  - loc_addr 
  - valid    

| Signal | Direction | Classification | Description |
|---|---|---|---|
| `clk` | Input | Control | Clock |
| `rst` | Input | Control | Reset  |
| `start` | Input | Control | Starts the polynomial multiplication operation. |
| `loc_in` | Input | data | Location of a nonzero coefficient (`1`) in the fixed-weight polynomial. |
| `weight` | Input | Control | Number of nonzero coefficients to process.|
| `loc_addr` | Output | Control | Counter indicating the current location index. |
| `mux_word_0` | Input | data | First word of the dense polynomial data supplied to the multiplier. |
| `mux_word_1` | Input | data | Second word of the dense polynomial data supplied to the multiplier. |
| `addr_0` | Output | data | Memory address calculated to access the first polynomial data word. |
| `addr_1` | Output | data | Memory address calculated to access the second polynomial data word. |
| `valid` | Output | Control | Indicates that the multiplication result is valid. |
| `rd_dout` | Input | Control | Read enable result (internal memory) |
| `addr_result` | Input | Control | Address of intermediate values from internal memory |
| `dout` | Output | data | Output data word containing the multiplication result / intermediate result from internal memory |
| `add_wr_en` | Input | Control | Enables writes (intermediate values) directly to internal memory |
| `add_addr` | Input | Control | Address for a write (intermediate values) directly to internal memory |
| `add_in` | Input | data | Data word (intermediate values)  supplied directly to internal memory  |
