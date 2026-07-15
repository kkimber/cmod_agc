transcript on

if {[file exists work]} {
    vdel -all
}

vlib work
vmap work work

vlog -work work {../fpga/ip/cmd_fifo/cmd_fifo.v}
vlog -work work {../fpga/ip/core_memory/core_memory.v}
vlog -work work {../fpga/ip/downlink_fifo/downlink_fifo.v}
vlog -work work {../fpga/ip/erasable_sim_mem/erasable_sim_mem.v}
vlog -work work {../fpga/ip/inkl_cycles/inkl_cycles.v}
vlog -work work {../fpga/ip/mon_adc/mon_adc.v}
vlog -work work {../fpga/ip/prop_clk_div/prop_clk_div.v}
vlog -work work {../fpga/ip/prop_clk_div/prop_clk_div_sim/prop_clk_div.vo}
vlog -work work {../fpga/ip/read_byte_fifo/read_byte_fifo.v}
vlog -work work {../fpga/ip/read_fifo/read_fifo.v}
vlog -work work {../fpga/ip/rope_memory/rope_memory.v}
vlog -work work {../fpga/ip/rope_sim_mem/rope_sim_mem.v}
vlog -work work {../fpga/ip/trace_memory/trace_memory.v}

vlog -work work {../fpga/hdl/agc/components/MR0A16A.v}
vlog -work work {../fpga/hdl/agc/components/SST39VF200A.v}
vlog -work work {../fpga/hdl/agc/components/U74HC02.v}
vlog -work work {../fpga/hdl/agc/components/U74HC04.v}
vlog -work work {../fpga/hdl/agc/components/U74HC244.v}
vlog -work work {../fpga/hdl/agc/components/U74HC27.v}
vlog -work work {../fpga/hdl/agc/components/U74HC4002.v}
vlog -work work {../fpga/hdl/agc/components/U74LVC06.v}
vlog -work work {../fpga/hdl/agc/components/U74LVC07.v}
vlog -work work {../fpga/hdl/agc/components/nor_1.v}
vlog -work work {../fpga/hdl/agc/components/nor_2.v}
vlog -work work {../fpga/hdl/agc/components/nor_3.v}
vlog -work work {../fpga/hdl/agc/components/nor_4.v}
vlog -work work {../fpga/hdl/agc/components/od_buf.v}
vlog -work work {../fpga/hdl/agc/components/tri_buf.v}

vlog -work work {../fpga/hdl/agc/fpga_agc.v}

vlog -work work {../fpga/hdl/monitor/agc_channels.v}
vlog -work work {../fpga/hdl/monitor/agc_clk_div.v}
vlog -work work {../fpga/hdl/monitor/agc_erasable.v}
vlog -work work {../fpga/hdl/monitor/agc_fixed.v}
vlog -work work {../fpga/hdl/monitor/cdu_control.v}
vlog -work work {../fpga/hdl/monitor/channel.v}
vlog -work work {../fpga/hdl/monitor/clear_timer.v}
vlog -work work {../fpga/hdl/monitor/cmd_controller.v}
vlog -work work {../fpga/hdl/monitor/cmd_receiver.v}
vlog -work work {../fpga/hdl/monitor/control_regs.v}
vlog -work work {../fpga/hdl/monitor/core_rope_sim.v}
vlog -work work {../fpga/hdl/monitor/debounce.v}
vlog -work work {../fpga/hdl/monitor/edit.v}
vlog -work work {../fpga/hdl/monitor/erasable_addr_decoder.v}
vlog -work work {../fpga/hdl/monitor/erasable_addr_encoder.v}
vlog -work work {../fpga/hdl/monitor/erasable_mem_sim.v}
vlog -work work {../fpga/hdl/monitor/fixed_addr_decoder.v}
vlog -work work {../fpga/hdl/monitor/fixed_addr_encoder.v}
vlog -work work {../fpga/hdl/monitor/instruction_trace.v}
vlog -work work {../fpga/hdl/monitor/monitor.v}
vlog -work work {../fpga/hdl/monitor/monitor_channels.v}
vlog -work work {../fpga/hdl/monitor/monitor_defs.v}
vlog -work work {../fpga/hdl/monitor/monitor_dsky.v}
vlog -work work {../fpga/hdl/monitor/monitor_regs.v}
vlog -work work {../fpga/hdl/monitor/msg_sender.v}
vlog -work work {../fpga/hdl/monitor/nassp_bridge.v}
vlog -work work {../fpga/hdl/monitor/ones_comp_adder.v}
vlog -work work {../fpga/hdl/monitor/output_counter.v}
vlog -work work {../fpga/hdl/monitor/peripheral_instructions.v}
vlog -work work {../fpga/hdl/monitor/register.v}
vlog -work work {../fpga/hdl/monitor/register2.v}
vlog -work work {../fpga/hdl/monitor/restart_monitor.v}
vlog -work work {../fpga/hdl/monitor/rupt_injector.v}
vlog -work work {../fpga/hdl/monitor/start_stop.v}
vlog -work work {../fpga/hdl/monitor/status_regs.v}
vlog -work work {../fpga/hdl/monitor/unedit.v}
vlog -work work {../fpga/hdl/monitor/usb_interface.v}

vlog -work work {../fpga/hdl/third_party/uart_rx.v}
vlog -work work {../fpga/hdl/third_party/uart_tx.v}

vlog -work work +define+SIM_FAST_START {../fpga/hdl/cmod_agc.v}

vsim -voptargs=+acc -suppress 14408 -suppress 16154 -L altera_lnsim_ver -L altera_mf_ver -L 220model_ver work.cmod_agc

add wave -divider "ACG Monitor Top"
add wave /cmod_agc/clk
add wave /cmod_agc/rst
add wave /cmod_agc/rxd
add wave /cmod_agc/txd
add wave /cmod_agc/led0
add wave /cmod_agc/prop_clk
add wave /cmod_agc/prop_locked
add wave /cmod_agc/agc_clk
add wave /cmod_agc/mon_clk

add wave -divider "AGC DSKY Outputs"
add wave /cmod_agc/RLYB01
add wave /cmod_agc/RLYB02
add wave /cmod_agc/RLYB03
add wave /cmod_agc/RLYB04
add wave /cmod_agc/RLYB05
add wave /cmod_agc/RLYB06
add wave /cmod_agc/RLYB07
add wave /cmod_agc/RLYB08
add wave /cmod_agc/RLYB09
add wave /cmod_agc/RLYB10
add wave /cmod_agc/RLYB11
add wave /cmod_agc/RYWD12
add wave /cmod_agc/RYWD13
add wave /cmod_agc/RYWD14
add wave /cmod_agc/RYWD16
add wave /cmod_agc/COMACT
add wave /cmod_agc/ELSNCM
add wave /cmod_agc/KYRLS
add wave /cmod_agc/OPEROR
add wave /cmod_agc/RESTRT
add wave /cmod_agc/SBYLIT
add wave /cmod_agc/TMPCAU
add wave /cmod_agc/UPLACT
add wave /cmod_agc/VNFLSH

add wave -divider "Core Rope (ROM)"
add wave /cmod_agc/agc/U31001/SIM_CLK
add wave /cmod_agc/agc/U31001/OE_n
add wave /cmod_agc/agc/U31001/addr
add wave /cmod_agc/agc/U31001/sensed_word
add wave /cmod_agc/agc/U31001/data

add wave -divider "Rope (RAM)"
add wave /cmod_agc/agc/U31025/SIM_RST
add wave /cmod_agc/agc/U31025/SIM_CLK
add wave /cmod_agc/agc/U31025/E_n
add wave /cmod_agc/agc/U31025/G_n
add wave /cmod_agc/agc/U31025/W_n
add wave /cmod_agc/agc/U31025/LB_n
add wave /cmod_agc/agc/U31025/UB_n
add wave /cmod_agc/agc/U31025/wren
add wave /cmod_agc/agc/U31025/addr
add wave /cmod_agc/agc/U31025/read_word
add wave /cmod_agc/agc/U31025/sensed_word
add wave /cmod_agc/agc/U31025/write_word

add wave -divider "Instruction Trace"
add wave /cmod_agc/mon/trace/clk
add wave /cmod_agc/mon/trace/trace_write
add wave /cmod_agc/mon/trace/addr
add wave /cmod_agc/mon/trace/data_out
add wave /cmod_agc/mon/trace/trace_idx
add wave /cmod_agc/mon/trace/trace_m
add wave /cmod_agc/mon/trace/trace_z
add wave /cmod_agc/mon/trace/trace_b
add wave /cmod_agc/mon/trace/w
add wave /cmod_agc/mon/trace/read_addr
add wave /cmod_agc/mon/trace/trace_data

# 50MHz clock
force /cmod_agc/clk 0 0ns, 1 10ns -repeat 20ns

# FORCE ALL INPUTS
force -freeze sim:/cmod_agc/rxd 0
force -freeze sim:/cmod_agc/a15_p 0
force -freeze sim:/cmod_agc/a15_n 0
force -freeze sim:/cmod_agc/a16_p 0
force -freeze sim:/cmod_agc/a16_n 0
force -freeze sim:/cmod_agc/mainrs_in 1
force -freeze sim:/cmod_agc/caurst_in 0
force -freeze sim:/cmod_agc/mkey1_in 0
force -freeze sim:/cmod_agc/mkey2_in 0
force -freeze sim:/cmod_agc/mkey3_in 0
force -freeze sim:/cmod_agc/mkey4_in 0
force -freeze sim:/cmod_agc/mkey5_in 0
force -freeze sim:/cmod_agc/sbybut_in 0

# Memory No Connects
force -freeze sim:/cmod_agc/agc/U31001/NC1 0
force -freeze sim:/cmod_agc/agc/U31001/NC2 0
force -freeze sim:/cmod_agc/agc/U31001/NC3 0
force -freeze sim:/cmod_agc/agc/U31001/NC4 0
force -freeze sim:/cmod_agc/agc/U31001/NC5 0
force -freeze sim:/cmod_agc/agc/U31001/NC6 0
force -freeze sim:/cmod_agc/agc/U31001/NC7 0
force -freeze sim:/cmod_agc/agc/U31001/NC8 0
force -freeze sim:/cmod_agc/agc/U31001/NC9 0

# RESET
force /cmod_agc/rst 1
run 100 ns
force /cmod_agc/rst 0

# RUN
run -all