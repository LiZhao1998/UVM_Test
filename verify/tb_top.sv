import uvm_pkg::*;
`include "uvm_macros.svh"
`include "../interface.sv"
`include "../../rtl/Design_v1.0.v"
`include "../sequence_item.sv"
`include "../sequence.sv"
`include "../driver.sv"
`include "../monitor.sv"
`include "../scoreboard.sv"
`include "../agent_env.sv"
`include "../test.sv"

module tb;
  reg clk;

  always #10 clk =~ clk;
    des_if _if (clk);

  det_1011 u0 	( .clk(clk),
                  .rstn(_if.rstn),
                  .in(_if.in),
                  .out(_if.out));


  initial begin
    clk <= 0;
    uvm_config_db#(virtual des_if)::set(null, "uvm_test_top", "des_vif", _if);
    run_test("test_1011");
  end
endmodule