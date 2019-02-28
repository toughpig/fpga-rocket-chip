module rocketTop( 
  input   clock100, 
  input   buttonresetn,
  
  output [15:0]LED,
  
  //----UART
  output  uart_TX,
  input   uart_RX,
  
  //----DDR
  inout  [15:0] ddr_dq,
  inout   [1:0] ddr_dqs_n,
  inout   [1:0] ddr_dqs_p,
  output [12:0] ddr_addr,
  output  [2:0] ddr_ba,
  output        ddr_ras_n,
  output        ddr_cas_n,
  output        ddr_we_n,
  output        ddr_ck_n,
  output        ddr_ck_p,
  output        ddr_cke,
  output        ddr_cs_n,
  output  [1:0] ddr_dm,
  output        ddr_odt
  
  // position for peris ... TBA
);
  wire  reset;
  wire  resetn;
  wire  clock; //30m
  wire  clock200; //200m
  
  //dut wires
  wire  dut_clock; 
  wire  dut_reset; 
  wire [1:0] dut_interrupts; 
  //debug module interface
  wire  dut_debug_clockeddmi_dmi_req_ready; 
  wire  dut_debug_clockeddmi_dmi_req_valid; 
  wire [6:0] dut_debug_clockeddmi_dmi_req_addr; 
  wire [31:0] dut_debug_clockeddmi_dmi_req_data; 
  wire [1:0] dut_debug_clockeddmi_dmi_req_op; 
  wire  dut_debug_clockeddmi_dmi_resp_ready; 
  wire  dut_debug_clockeddmi_dmi_resp_valid; 
  wire [31:0] dut_debug_clockeddmi_dmi_resp_data; 
  wire [1:0] dut_debug_clockeddmi_dmi_resp_resp; 
  wire  dut_debug_clockeddmi_dmiClock; 
  wire  dut_debug_clockeddmi_dmiReset; 
  wire  dut_debug_ndreset; 
  wire  dut_debug_dmactive; 
  //mem
  wire  dut_mem_axi4_0_aw_ready; 
  wire  dut_mem_axi4_0_aw_valid; 
  wire [3:0] dut_mem_axi4_0_aw_id; 
  wire [31:0] dut_mem_axi4_0_aw_addr; 
  wire [7:0] dut_mem_axi4_0_aw_len; 
  wire [2:0] dut_mem_axi4_0_aw_size; 
  wire [1:0] dut_mem_axi4_0_aw_burst; 
  wire  dut_mem_axi4_0_aw_lock; 
  wire [3:0] dut_mem_axi4_0_aw_cache; 
  wire [2:0] dut_mem_axi4_0_aw_prot; 
  wire [3:0] dut_mem_axi4_0_aw_qos; 
  wire  dut_mem_axi4_0_w_ready; 
  wire  dut_mem_axi4_0_w_valid; 
  wire [63:0] dut_mem_axi4_0_w_data; 
  wire [7:0] dut_mem_axi4_0_w_strb; 
  wire  dut_mem_axi4_0_w_last; 
  wire  dut_mem_axi4_0_b_ready; 
  wire  dut_mem_axi4_0_b_valid; 
  wire [3:0] dut_mem_axi4_0_b_id; 
  wire [1:0] dut_mem_axi4_0_b_resp; 
  wire  dut_mem_axi4_0_ar_ready; 
  wire  dut_mem_axi4_0_ar_valid; 
  wire [3:0] dut_mem_axi4_0_ar_id; 
  wire [31:0] dut_mem_axi4_0_ar_addr; 
  wire [7:0] dut_mem_axi4_0_ar_len; 
  wire [2:0] dut_mem_axi4_0_ar_size; 
  wire [1:0] dut_mem_axi4_0_ar_burst; 
  wire  dut_mem_axi4_0_ar_lock; 
  wire [3:0] dut_mem_axi4_0_ar_cache; 
  wire [2:0] dut_mem_axi4_0_ar_prot; 
  wire [3:0] dut_mem_axi4_0_ar_qos; 
  wire  dut_mem_axi4_0_r_ready; 
  wire  dut_mem_axi4_0_r_valid; 
  wire [3:0] dut_mem_axi4_0_r_id; 
  wire [63:0] dut_mem_axi4_0_r_data; 
  wire [1:0] dut_mem_axi4_0_r_resp; 
  wire  dut_mem_axi4_0_r_last; 
  //mmio
  wire  dut_mmio_axi4_0_aw_ready; 
  wire  dut_mmio_axi4_0_aw_valid; 
  wire [3:0] dut_mmio_axi4_0_aw_id; 
  wire [30:0] dut_mmio_axi4_0_aw_addr; 
  wire [7:0] dut_mmio_axi4_0_aw_len; 
  wire [2:0] dut_mmio_axi4_0_aw_size; 
  wire [1:0] dut_mmio_axi4_0_aw_burst; 
  wire  dut_mmio_axi4_0_aw_lock; 
  wire [3:0] dut_mmio_axi4_0_aw_cache; 
  wire [2:0] dut_mmio_axi4_0_aw_prot; 
  wire [3:0] dut_mmio_axi4_0_aw_qos; 
  wire  dut_mmio_axi4_0_w_ready; 
  wire  dut_mmio_axi4_0_w_valid; 
  wire [63:0] dut_mmio_axi4_0_w_data; 
  wire [7:0] dut_mmio_axi4_0_w_strb; 
  wire  dut_mmio_axi4_0_w_last; 
  wire  dut_mmio_axi4_0_b_ready; 
  wire  dut_mmio_axi4_0_b_valid; 
  wire [3:0] dut_mmio_axi4_0_b_id; 
  wire [1:0] dut_mmio_axi4_0_b_resp; 
  wire  dut_mmio_axi4_0_ar_ready; 
  wire  dut_mmio_axi4_0_ar_valid; 
  wire [3:0] dut_mmio_axi4_0_ar_id; 
  wire [30:0] dut_mmio_axi4_0_ar_addr; 
  wire [7:0] dut_mmio_axi4_0_ar_len; 
  wire [2:0] dut_mmio_axi4_0_ar_size; 
  wire [1:0] dut_mmio_axi4_0_ar_burst; 
  wire  dut_mmio_axi4_0_ar_lock; 
  wire [3:0] dut_mmio_axi4_0_ar_cache; 
  wire [2:0] dut_mmio_axi4_0_ar_prot; 
  wire [3:0] dut_mmio_axi4_0_ar_qos; 
  wire  dut_mmio_axi4_0_r_ready; 
  wire  dut_mmio_axi4_0_r_valid; 
  wire [3:0] dut_mmio_axi4_0_r_id; 
  wire [63:0] dut_mmio_axi4_0_r_data; 
  wire [1:0] dut_mmio_axi4_0_r_resp; 
  wire  dut_mmio_axi4_0_r_last; 
  //l2
  wire  dut_l2_frontend_bus_axi4_0_aw_ready; 
  wire  dut_l2_frontend_bus_axi4_0_aw_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_id; 
  wire [31:0] dut_l2_frontend_bus_axi4_0_aw_addr; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_aw_len; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_size; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_aw_burst; 
  wire  dut_l2_frontend_bus_axi4_0_aw_lock; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_cache; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_aw_prot; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_aw_qos; 
  wire  dut_l2_frontend_bus_axi4_0_w_ready; 
  wire  dut_l2_frontend_bus_axi4_0_w_valid; 
  wire [63:0] dut_l2_frontend_bus_axi4_0_w_data; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_w_strb; 
  wire  dut_l2_frontend_bus_axi4_0_w_last; 
  wire  dut_l2_frontend_bus_axi4_0_b_ready; 
  wire  dut_l2_frontend_bus_axi4_0_b_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_b_id; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_b_resp; 
  wire  dut_l2_frontend_bus_axi4_0_ar_ready; 
  wire  dut_l2_frontend_bus_axi4_0_ar_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_id; 
  wire [31:0] dut_l2_frontend_bus_axi4_0_ar_addr; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_ar_len; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_size; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_ar_burst; 
  wire  dut_l2_frontend_bus_axi4_0_ar_lock; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_cache; 
  wire [2:0] dut_l2_frontend_bus_axi4_0_ar_prot; 
  wire [3:0] dut_l2_frontend_bus_axi4_0_ar_qos; 
  wire  dut_l2_frontend_bus_axi4_0_r_ready; 
  wire  dut_l2_frontend_bus_axi4_0_r_valid; 
  wire [7:0] dut_l2_frontend_bus_axi4_0_r_id; 
  wire [63:0] dut_l2_frontend_bus_axi4_0_r_data; 
  wire [1:0] dut_l2_frontend_bus_axi4_0_r_resp; 
  wire  dut_l2_frontend_bus_axi4_0_r_last; 
  // above: those wires connected to the dut module

  // below: wires connected to the respective peripheral
  // mem
  wire  mem_clock; 
  wire  mem_reset; 
  wire  mem_io_axi4_0_aw_ready; 
  wire  mem_io_axi4_0_aw_valid; 
  wire [3:0] mem_io_axi4_0_aw_id; 
  wire [31:0] mem_io_axi4_0_aw_addr; 
  wire [7:0] mem_io_axi4_0_aw_len; 
  wire [2:0] mem_io_axi4_0_aw_size; 
  wire [1:0] mem_io_axi4_0_aw_burst; 
  wire  mem_io_axi4_0_w_ready; 
  wire  mem_io_axi4_0_w_valid; 
  wire [63:0] mem_io_axi4_0_w_data; 
  wire [7:0] mem_io_axi4_0_w_strb; 
  wire  mem_io_axi4_0_w_last; 
  wire  mem_io_axi4_0_b_ready; 
  wire  mem_io_axi4_0_b_valid; 
  wire [3:0] mem_io_axi4_0_b_id; 
  wire [1:0] mem_io_axi4_0_b_resp; 
  wire  mem_io_axi4_0_ar_ready; 
  wire  mem_io_axi4_0_ar_valid; 
  wire [3:0] mem_io_axi4_0_ar_id; 
  wire [31:0] mem_io_axi4_0_ar_addr; 
  wire [7:0] mem_io_axi4_0_ar_len; 
  wire [2:0] mem_io_axi4_0_ar_size; 
  wire [1:0] mem_io_axi4_0_ar_burst; 
  wire  mem_io_axi4_0_r_ready; 
  wire  mem_io_axi4_0_r_valid; 
  wire [3:0] mem_io_axi4_0_r_id; 
  wire [63:0] mem_io_axi4_0_r_data; 
  wire [1:0] mem_io_axi4_0_r_resp; 
  wire  mem_io_axi4_0_r_last; 

  // mmio
  wire  mmio_clock; 
  wire  mmio_reset; 
  wire  mmio_io_axi4_0_aw_ready; 
  wire  mmio_io_axi4_0_aw_valid; 
  wire [3:0] mmio_io_axi4_0_aw_id; 
  wire [30:0] mmio_io_axi4_0_aw_addr; 
  wire [7:0] mmio_io_axi4_0_aw_len; 
  wire [2:0] mmio_io_axi4_0_aw_size; 
  wire [1:0] mmio_io_axi4_0_aw_burst; 
  wire  mmio_io_axi4_0_w_ready; 
  wire  mmio_io_axi4_0_w_valid; 
  wire [63:0] mmio_io_axi4_0_w_data; 
  wire [7:0] mmio_io_axi4_0_w_strb; 
  wire  mmio_io_axi4_0_w_last; 
  wire  mmio_io_axi4_0_b_ready; 
  wire  mmio_io_axi4_0_b_valid; 
  wire [3:0] mmio_io_axi4_0_b_id; 
  wire [1:0] mmio_io_axi4_0_b_resp; 
  wire  mmio_io_axi4_0_ar_ready; 
  wire  mmio_io_axi4_0_ar_valid; 
  wire [3:0] mmio_io_axi4_0_ar_id; 
  wire [30:0] mmio_io_axi4_0_ar_addr; 
  wire [7:0] mmio_io_axi4_0_ar_len; 
  wire [2:0] mmio_io_axi4_0_ar_size; 
  wire [1:0] mmio_io_axi4_0_ar_burst; 
  wire  mmio_io_axi4_0_r_ready; 
  wire  mmio_io_axi4_0_r_valid; 
  wire [3:0] mmio_io_axi4_0_r_id; 
  wire [63:0] mmio_io_axi4_0_r_data; 
  wire [1:0] mmio_io_axi4_0_r_resp; 
  wire  mmio_io_axi4_0_r_last; 

  // debug transport module (debug2jtag)
  wire  SimDTM_debug_req_ready; 
  wire  SimDTM_debug_req_valid; 
  wire [6:0] SimDTM_debug_req_addr; 
  wire [31:0] SimDTM_debug_req_data; 
  wire [1:0] SimDTM_debug_req_op; 
  wire  SimDTM_debug_resp_ready; 
  wire  SimDTM_debug_resp_valid; 
  wire [31:0] SimDTM_debug_resp_data; 
  wire [1:0] SimDTM_debug_resp_resp; 
  wire  SimDTM_reset; 
  wire  SimDTM_clk; 

  wire  pll_locked;
 
  clk_wiz_0 clk_gen(
    .clk_in1(clock100),//100m
    .clk_out1(clock),   //30m
    .clk_out2(clock200), //200m
    .resetn(buttonresetn),
    .locked(pll_locked)
  );
  
  reg [7:0] rstcounter;
  // real reset generation, updated 
  always @(posedge clock100)
  begin
    if (! buttonresetn) 
        rstcounter <= 8'd255;
    else
        rstcounter <= (pll_locked)? ((rstcounter == 0)? 0: (rstcounter -8'd1)):rstcounter;
  end
 
  assign reset =  (!(rstcounter == 0) && (pll_locked));
  assign resetn = ~ reset;
  // real reset generation end

  
  ExampleRocketSystem dut ( 
      .clock(dut_clock),
      .reset(dut_reset),
      .debug_clockeddmi_dmi_req_ready(dut_debug_clockeddmi_dmi_req_ready),
      .debug_clockeddmi_dmi_req_valid(dut_debug_clockeddmi_dmi_req_valid),
      .debug_clockeddmi_dmi_req_bits_addr(dut_debug_clockeddmi_dmi_req_addr),
      .debug_clockeddmi_dmi_req_bits_data(dut_debug_clockeddmi_dmi_req_data),
      .debug_clockeddmi_dmi_req_bits_op(dut_debug_clockeddmi_dmi_req_op),
      .debug_clockeddmi_dmi_resp_ready(dut_debug_clockeddmi_dmi_resp_ready),
      .debug_clockeddmi_dmi_resp_valid(dut_debug_clockeddmi_dmi_resp_valid),
      .debug_clockeddmi_dmi_resp_bits_data(dut_debug_clockeddmi_dmi_resp_data),
      .debug_clockeddmi_dmi_resp_bits_resp(dut_debug_clockeddmi_dmi_resp_resp),
      .debug_clockeddmi_dmiClock(dut_debug_clockeddmi_dmiClock),
      .debug_clockeddmi_dmiReset(dut_debug_clockeddmi_dmiReset),
      .debug_ndreset(dut_debug_ndreset),
      .debug_dmactive(dut_debug_dmactive),
      .interrupts(dut_interrupts),
      .mem_axi4_0_aw_ready(dut_mem_axi4_0_aw_ready),
      .mem_axi4_0_aw_valid(dut_mem_axi4_0_aw_valid),
      .mem_axi4_0_aw_bits_id(dut_mem_axi4_0_aw_id),
      .mem_axi4_0_aw_bits_addr(dut_mem_axi4_0_aw_addr),
      .mem_axi4_0_aw_bits_len(dut_mem_axi4_0_aw_len),
      .mem_axi4_0_aw_bits_size(dut_mem_axi4_0_aw_size),
      .mem_axi4_0_aw_bits_burst(dut_mem_axi4_0_aw_burst),
      .mem_axi4_0_aw_bits_lock(dut_mem_axi4_0_aw_lock),
      .mem_axi4_0_aw_bits_cache(dut_mem_axi4_0_aw_cache),
      .mem_axi4_0_aw_bits_prot(dut_mem_axi4_0_aw_prot),
      .mem_axi4_0_aw_bits_qos(dut_mem_axi4_0_aw_qos),
      .mem_axi4_0_w_ready(dut_mem_axi4_0_w_ready),
      .mem_axi4_0_w_valid(dut_mem_axi4_0_w_valid),
      .mem_axi4_0_w_bits_data(dut_mem_axi4_0_w_data),
      .mem_axi4_0_w_bits_strb(dut_mem_axi4_0_w_strb),
      .mem_axi4_0_w_bits_last(dut_mem_axi4_0_w_last),
      .mem_axi4_0_b_ready(dut_mem_axi4_0_b_ready),
      .mem_axi4_0_b_valid(dut_mem_axi4_0_b_valid),
      .mem_axi4_0_b_bits_id(dut_mem_axi4_0_b_id),
      .mem_axi4_0_b_bits_resp(dut_mem_axi4_0_b_resp),
      .mem_axi4_0_ar_ready(dut_mem_axi4_0_ar_ready),
      .mem_axi4_0_ar_valid(dut_mem_axi4_0_ar_valid),
      .mem_axi4_0_ar_bits_id(dut_mem_axi4_0_ar_id),
      .mem_axi4_0_ar_bits_addr(dut_mem_axi4_0_ar_addr),
      .mem_axi4_0_ar_bits_len(dut_mem_axi4_0_ar_len),
      .mem_axi4_0_ar_bits_size(dut_mem_axi4_0_ar_size),
      .mem_axi4_0_ar_bits_burst(dut_mem_axi4_0_ar_burst),
      .mem_axi4_0_ar_bits_lock(dut_mem_axi4_0_ar_lock),
      .mem_axi4_0_ar_bits_cache(dut_mem_axi4_0_ar_cache),
      .mem_axi4_0_ar_bits_prot(dut_mem_axi4_0_ar_prot),
      .mem_axi4_0_ar_bits_qos(dut_mem_axi4_0_ar_qos),
      .mem_axi4_0_r_ready(dut_mem_axi4_0_r_ready),
      .mem_axi4_0_r_valid(dut_mem_axi4_0_r_valid),
      .mem_axi4_0_r_bits_id(dut_mem_axi4_0_r_id),
      .mem_axi4_0_r_bits_data(dut_mem_axi4_0_r_data),
      .mem_axi4_0_r_bits_resp(dut_mem_axi4_0_r_resp),
      .mem_axi4_0_r_bits_last(dut_mem_axi4_0_r_last),
      .mmio_axi4_0_aw_ready(dut_mmio_axi4_0_aw_ready),
      .mmio_axi4_0_aw_valid(dut_mmio_axi4_0_aw_valid),
      .mmio_axi4_0_aw_bits_id(dut_mmio_axi4_0_aw_id),
      .mmio_axi4_0_aw_bits_addr(dut_mmio_axi4_0_aw_addr),
      .mmio_axi4_0_aw_bits_len(dut_mmio_axi4_0_aw_len),
      .mmio_axi4_0_aw_bits_size(dut_mmio_axi4_0_aw_size),
      .mmio_axi4_0_aw_bits_burst(dut_mmio_axi4_0_aw_burst),
      .mmio_axi4_0_aw_bits_lock(dut_mmio_axi4_0_aw_lock),
      .mmio_axi4_0_aw_bits_cache(dut_mmio_axi4_0_aw_cache),
      .mmio_axi4_0_aw_bits_prot(dut_mmio_axi4_0_aw_prot),
      .mmio_axi4_0_aw_bits_qos(dut_mmio_axi4_0_aw_qos),
      .mmio_axi4_0_w_ready(dut_mmio_axi4_0_w_ready),
      .mmio_axi4_0_w_valid(dut_mmio_axi4_0_w_valid),
      .mmio_axi4_0_w_bits_data(dut_mmio_axi4_0_w_data),
      .mmio_axi4_0_w_bits_strb(dut_mmio_axi4_0_w_strb),
      .mmio_axi4_0_w_bits_last(dut_mmio_axi4_0_w_last),
      .mmio_axi4_0_b_ready(dut_mmio_axi4_0_b_ready),
      .mmio_axi4_0_b_valid(dut_mmio_axi4_0_b_valid),
      .mmio_axi4_0_b_bits_id(dut_mmio_axi4_0_b_id),
      .mmio_axi4_0_b_bits_resp(dut_mmio_axi4_0_b_resp),
      .mmio_axi4_0_ar_ready(dut_mmio_axi4_0_ar_ready),
      .mmio_axi4_0_ar_valid(dut_mmio_axi4_0_ar_valid),
      .mmio_axi4_0_ar_bits_id(dut_mmio_axi4_0_ar_id),
      .mmio_axi4_0_ar_bits_addr(dut_mmio_axi4_0_ar_addr),
      .mmio_axi4_0_ar_bits_len(dut_mmio_axi4_0_ar_len),
      .mmio_axi4_0_ar_bits_size(dut_mmio_axi4_0_ar_size),
      .mmio_axi4_0_ar_bits_burst(dut_mmio_axi4_0_ar_burst),
      .mmio_axi4_0_ar_bits_lock(dut_mmio_axi4_0_ar_lock),
      .mmio_axi4_0_ar_bits_cache(dut_mmio_axi4_0_ar_cache),
      .mmio_axi4_0_ar_bits_prot(dut_mmio_axi4_0_ar_prot),
      .mmio_axi4_0_ar_bits_qos(dut_mmio_axi4_0_ar_qos),
      .mmio_axi4_0_r_ready(dut_mmio_axi4_0_r_ready),
      .mmio_axi4_0_r_valid(dut_mmio_axi4_0_r_valid),
      .mmio_axi4_0_r_bits_id(dut_mmio_axi4_0_r_id),
      .mmio_axi4_0_r_bits_data(dut_mmio_axi4_0_r_data),
      .mmio_axi4_0_r_bits_resp(dut_mmio_axi4_0_r_resp),
      .mmio_axi4_0_r_bits_last(dut_mmio_axi4_0_r_last),
      .l2_frontend_bus_axi4_0_aw_ready(dut_l2_frontend_bus_axi4_0_aw_ready),
      .l2_frontend_bus_axi4_0_aw_valid(dut_l2_frontend_bus_axi4_0_aw_valid),
      .l2_frontend_bus_axi4_0_aw_bits_id(dut_l2_frontend_bus_axi4_0_aw_id),
      .l2_frontend_bus_axi4_0_aw_bits_addr(dut_l2_frontend_bus_axi4_0_aw_addr),
      .l2_frontend_bus_axi4_0_aw_bits_len(dut_l2_frontend_bus_axi4_0_aw_len),
      .l2_frontend_bus_axi4_0_aw_bits_size(dut_l2_frontend_bus_axi4_0_aw_size),
      .l2_frontend_bus_axi4_0_aw_bits_burst(dut_l2_frontend_bus_axi4_0_aw_burst),
      .l2_frontend_bus_axi4_0_aw_bits_lock(dut_l2_frontend_bus_axi4_0_aw_lock),
      .l2_frontend_bus_axi4_0_aw_bits_cache(dut_l2_frontend_bus_axi4_0_aw_cache),
      .l2_frontend_bus_axi4_0_aw_bits_prot(dut_l2_frontend_bus_axi4_0_aw_prot),
      .l2_frontend_bus_axi4_0_aw_bits_qos(dut_l2_frontend_bus_axi4_0_aw_qos),
      .l2_frontend_bus_axi4_0_w_ready(dut_l2_frontend_bus_axi4_0_w_ready),
      .l2_frontend_bus_axi4_0_w_valid(dut_l2_frontend_bus_axi4_0_w_valid),
      .l2_frontend_bus_axi4_0_w_bits_data(dut_l2_frontend_bus_axi4_0_w_data),
      .l2_frontend_bus_axi4_0_w_bits_strb(dut_l2_frontend_bus_axi4_0_w_strb),
      .l2_frontend_bus_axi4_0_w_bits_last(dut_l2_frontend_bus_axi4_0_w_last),
      .l2_frontend_bus_axi4_0_b_ready(dut_l2_frontend_bus_axi4_0_b_ready),
      .l2_frontend_bus_axi4_0_b_valid(dut_l2_frontend_bus_axi4_0_b_valid),
      .l2_frontend_bus_axi4_0_b_bits_id(dut_l2_frontend_bus_axi4_0_b_id),
      .l2_frontend_bus_axi4_0_b_bits_resp(dut_l2_frontend_bus_axi4_0_b_resp),
      .l2_frontend_bus_axi4_0_ar_ready(dut_l2_frontend_bus_axi4_0_ar_ready),
      .l2_frontend_bus_axi4_0_ar_valid(dut_l2_frontend_bus_axi4_0_ar_valid),
      .l2_frontend_bus_axi4_0_ar_bits_id(dut_l2_frontend_bus_axi4_0_ar_id),
      .l2_frontend_bus_axi4_0_ar_bits_addr(dut_l2_frontend_bus_axi4_0_ar_addr),
      .l2_frontend_bus_axi4_0_ar_bits_len(dut_l2_frontend_bus_axi4_0_ar_len),
      .l2_frontend_bus_axi4_0_ar_bits_size(dut_l2_frontend_bus_axi4_0_ar_size),
      .l2_frontend_bus_axi4_0_ar_bits_burst(dut_l2_frontend_bus_axi4_0_ar_burst),
      .l2_frontend_bus_axi4_0_ar_bits_lock(dut_l2_frontend_bus_axi4_0_ar_lock),
      .l2_frontend_bus_axi4_0_ar_bits_cache(dut_l2_frontend_bus_axi4_0_ar_cache),
      .l2_frontend_bus_axi4_0_ar_bits_prot(dut_l2_frontend_bus_axi4_0_ar_prot),
      .l2_frontend_bus_axi4_0_ar_bits_qos(dut_l2_frontend_bus_axi4_0_ar_qos),
      .l2_frontend_bus_axi4_0_r_ready(dut_l2_frontend_bus_axi4_0_r_ready),
      .l2_frontend_bus_axi4_0_r_valid(dut_l2_frontend_bus_axi4_0_r_valid),
      .l2_frontend_bus_axi4_0_r_bits_id(dut_l2_frontend_bus_axi4_0_r_id),
      .l2_frontend_bus_axi4_0_r_bits_data(dut_l2_frontend_bus_axi4_0_r_data),
      .l2_frontend_bus_axi4_0_r_bits_resp(dut_l2_frontend_bus_axi4_0_r_resp),
      .l2_frontend_bus_axi4_0_r_bits_last(dut_l2_frontend_bus_axi4_0_r_last)
    );
  
  AXIMem mem ( 
    .clock(mem_clock),
    .clock200(clock200), // DDR driver 200MHz
    .reset(mem_reset),

    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mem_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mem_io_axi4_0_aw_addr),
    .io_axi4_0_aw_len(mem_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mem_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mem_io_axi4_0_aw_burst),
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mem_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mem_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mem_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mem_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mem_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mem_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mem_io_axi4_0_ar_addr),
    .io_axi4_0_ar_len(mem_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mem_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mem_io_axi4_0_ar_burst),
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mem_io_axi4_0_r_id),
    .io_axi4_0_r_data(mem_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mem_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mem_io_axi4_0_r_last),
    
    //HW devices' pins
    .ddr_dq (ddr_dq),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_ras_n (ddr_ras_n),
    .ddr_cas_n (ddr_cas_n),
    .ddr_we_n (ddr_we_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
    .ddr_cs_n (ddr_cs_n),
    .ddr_dm (ddr_dm),
    .ddr_odt (ddr_odt)
  );
  
  AXIMmio mmio ( 
    .clock(mmio_clock),
    .reset(mmio_reset),
    
    .io_axi4_0_aw_ready(mmio_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mmio_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mmio_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mmio_io_axi4_0_aw_addr),
    .io_axi4_0_aw_len(mmio_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mmio_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mmio_io_axi4_0_aw_burst),
    .io_axi4_0_w_ready(mmio_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mmio_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mmio_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mmio_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mmio_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mmio_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mmio_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mmio_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mmio_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mmio_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mmio_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mmio_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mmio_io_axi4_0_ar_addr),
    .io_axi4_0_ar_len(mmio_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mmio_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mmio_io_axi4_0_ar_burst),
    .io_axi4_0_r_ready(mmio_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mmio_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mmio_io_axi4_0_r_id),
    .io_axi4_0_r_data(mmio_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mmio_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mmio_io_axi4_0_r_last),
    
    //HW devices' pins
    .uart_TX(uart_TX),
    .uart_RX(uart_RX)
  );
  
  //////////////////////////////////debug
  
  assign LED[13] = uart_TX;
  assign LED[12] = uart_RX;
  assign LED[11] = rstcounter[0];
  assign LED[10] = pll_locked;
  assign LED[9] =  mmio_io_axi4_0_w_ready;
  assign LED[8] =  mmio_io_axi4_0_w_valid;
  assign LED[7:0] = mmio_io_axi4_0_w_data[7:0];
   
  //////////////////////////////////debug
  
  //////////////////////////////////debug
    
  assign LED[15] = dut_reset;
  assign LED[14] = dut_clock;
      
  //////////////////////////////////debug
  
  
  DTModule DTM ( 
    .debug_req_ready(SimDTM_debug_req_ready),
    .debug_req_valid(SimDTM_debug_req_valid),
    .debug_req_addr(SimDTM_debug_req_addr),
    .debug_req_data(SimDTM_debug_req_data),
    .debug_req_op(SimDTM_debug_req_op),
    .debug_resp_ready(SimDTM_debug_resp_ready),
    .debug_resp_valid(SimDTM_debug_resp_valid),
    .debug_resp_data(SimDTM_debug_resp_data),
    .debug_resp_resp(SimDTM_debug_resp_resp),
    .reset(SimDTM_reset),
    .clk(SimDTM_clk)
  );
  

  //-------------------------connect all the module together

  assign dut_clock = clock; 
  assign dut_reset = reset | dut_debug_ndreset; 
  assign dut_interrupts = 2'h0; 
  assign dut_debug_clockeddmi_dmiClock = clock; 
  assign dut_debug_clockeddmi_dmiReset = reset; 

  //  ***** debug module *****
  // CR inheritance
  assign SimDTM_reset = reset; 
  assign SimDTM_clk = clock; 
  //  drived by outside module
  assign dut_debug_clockeddmi_dmi_req_valid = SimDTM_debug_req_valid;
  assign dut_debug_clockeddmi_dmi_req_addr = SimDTM_debug_req_addr;
  assign dut_debug_clockeddmi_dmi_req_data = SimDTM_debug_req_data;
  assign dut_debug_clockeddmi_dmi_req_op = SimDTM_debug_req_op;
  assign dut_debug_clockeddmi_dmi_resp_ready = SimDTM_debug_resp_ready;
  //  output to outside module 
  assign SimDTM_debug_req_ready = dut_debug_clockeddmi_dmi_req_ready;
  assign SimDTM_debug_resp_valid = dut_debug_clockeddmi_dmi_resp_valid;
  assign SimDTM_debug_resp_data = dut_debug_clockeddmi_dmi_resp_data;
  assign SimDTM_debug_resp_resp = dut_debug_clockeddmi_dmi_resp_resp;


  //  ***** mem module *****
  // CR inheritance
  assign mem_clock = clock; 
  assign mem_reset = reset; 
  //  drived by outside module
  assign dut_mem_axi4_0_aw_ready = mem_io_axi4_0_aw_ready; 
  assign dut_mem_axi4_0_w_ready = mem_io_axi4_0_w_ready; 
  assign dut_mem_axi4_0_b_valid = mem_io_axi4_0_b_valid; 
  assign dut_mem_axi4_0_b_id = mem_io_axi4_0_b_id; 
  assign dut_mem_axi4_0_b_resp = mem_io_axi4_0_b_resp; 
  assign dut_mem_axi4_0_ar_ready = mem_io_axi4_0_ar_ready; 
  assign dut_mem_axi4_0_r_valid = mem_io_axi4_0_r_valid; 
  assign dut_mem_axi4_0_r_id = mem_io_axi4_0_r_id; 
  assign dut_mem_axi4_0_r_data = mem_io_axi4_0_r_data; 
  assign dut_mem_axi4_0_r_resp = mem_io_axi4_0_r_resp; 
  assign dut_mem_axi4_0_r_last = mem_io_axi4_0_r_last; 
  //  output to outside module 
  assign mem_io_axi4_0_aw_valid = dut_mem_axi4_0_aw_valid; 
  assign mem_io_axi4_0_aw_id = dut_mem_axi4_0_aw_id; 
  assign mem_io_axi4_0_aw_addr = dut_mem_axi4_0_aw_addr; 
  assign mem_io_axi4_0_aw_len = dut_mem_axi4_0_aw_len; 
  assign mem_io_axi4_0_aw_size = dut_mem_axi4_0_aw_size; 
  assign mem_io_axi4_0_aw_burst = dut_mem_axi4_0_aw_burst; 
  assign mem_io_axi4_0_w_valid = dut_mem_axi4_0_w_valid; 
  assign mem_io_axi4_0_w_data = dut_mem_axi4_0_w_data; 
  assign mem_io_axi4_0_w_strb = dut_mem_axi4_0_w_strb; 
  assign mem_io_axi4_0_w_last = dut_mem_axi4_0_w_last; 
  assign mem_io_axi4_0_b_ready = dut_mem_axi4_0_b_ready; 
  assign mem_io_axi4_0_ar_valid = dut_mem_axi4_0_ar_valid; 
  assign mem_io_axi4_0_ar_id = dut_mem_axi4_0_ar_id; 
  assign mem_io_axi4_0_ar_addr = dut_mem_axi4_0_ar_addr; 
  assign mem_io_axi4_0_ar_len = dut_mem_axi4_0_ar_len; 
  assign mem_io_axi4_0_ar_size = dut_mem_axi4_0_ar_size; 
  assign mem_io_axi4_0_ar_burst = dut_mem_axi4_0_ar_burst; 
  assign mem_io_axi4_0_r_ready = dut_mem_axi4_0_r_ready; 


  //  ***** mmio module *****
  // CR inheritance 
  assign mmio_clock = clock; 
  assign mmio_reset = reset; 
  //  drived by outside module
  assign dut_mmio_axi4_0_aw_ready = mmio_io_axi4_0_aw_ready; 
  assign dut_mmio_axi4_0_w_ready = mmio_io_axi4_0_w_ready; 
  assign dut_mmio_axi4_0_b_valid = mmio_io_axi4_0_b_valid; 
  assign dut_mmio_axi4_0_b_id = mmio_io_axi4_0_b_id; 
  assign dut_mmio_axi4_0_b_resp = mmio_io_axi4_0_b_resp; 
  assign dut_mmio_axi4_0_ar_ready = mmio_io_axi4_0_ar_ready; 
  assign dut_mmio_axi4_0_r_valid = mmio_io_axi4_0_r_valid; 
  assign dut_mmio_axi4_0_r_id = mmio_io_axi4_0_r_id; 
  assign dut_mmio_axi4_0_r_data = mmio_io_axi4_0_r_data; 
  assign dut_mmio_axi4_0_r_resp = mmio_io_axi4_0_r_resp; 
  assign dut_mmio_axi4_0_r_last = mmio_io_axi4_0_r_last; 
  //  output to outside module 
  assign mmio_io_axi4_0_aw_valid = dut_mmio_axi4_0_aw_valid; 
  assign mmio_io_axi4_0_aw_id = dut_mmio_axi4_0_aw_id; 
  assign mmio_io_axi4_0_aw_addr = dut_mmio_axi4_0_aw_addr; 
  assign mmio_io_axi4_0_aw_len = dut_mmio_axi4_0_aw_len; 
  assign mmio_io_axi4_0_aw_size = dut_mmio_axi4_0_aw_size; 
  assign mmio_io_axi4_0_aw_burst = dut_mmio_axi4_0_aw_burst; 
  assign mmio_io_axi4_0_w_valid = dut_mmio_axi4_0_w_valid; 
  assign mmio_io_axi4_0_w_data = dut_mmio_axi4_0_w_data; 
  assign mmio_io_axi4_0_w_strb = dut_mmio_axi4_0_w_strb; 
  assign mmio_io_axi4_0_w_last = dut_mmio_axi4_0_w_last; 
  assign mmio_io_axi4_0_b_ready = dut_mmio_axi4_0_b_ready; 
  assign mmio_io_axi4_0_ar_valid = dut_mmio_axi4_0_ar_valid; 
  assign mmio_io_axi4_0_ar_id = dut_mmio_axi4_0_ar_id; 
  assign mmio_io_axi4_0_ar_addr = dut_mmio_axi4_0_ar_addr; 
  assign mmio_io_axi4_0_ar_len = dut_mmio_axi4_0_ar_len; 
  assign mmio_io_axi4_0_ar_size = dut_mmio_axi4_0_ar_size; 
  assign mmio_io_axi4_0_ar_burst = dut_mmio_axi4_0_ar_burst; 
  assign mmio_io_axi4_0_r_ready = dut_mmio_axi4_0_r_ready; 


  //  ***** l2 frontend define - grounded *****
  assign dut_l2_frontend_bus_axi4_0_aw_valid = 1'h0; 
  assign dut_l2_frontend_bus_axi4_0_aw_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_aw_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_w_valid = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_w_data = 64'h0;
  assign dut_l2_frontend_bus_axi4_0_w_strb = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_w_last = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_b_ready = 1'h0; 
  assign dut_l2_frontend_bus_axi4_0_ar_valid = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_id = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_addr = 32'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_len = 8'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_size = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_burst = 2'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_lock = 1'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_cache = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_prot = 3'h0;
  assign dut_l2_frontend_bus_axi4_0_ar_qos = 4'h0;
  assign dut_l2_frontend_bus_axi4_0_r_ready = 1'h0; 


endmodule //end of top
