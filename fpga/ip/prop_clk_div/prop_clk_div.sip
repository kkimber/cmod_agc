set_global_assignment -entity "prop_clk_div" -library "lib_prop_clk_div" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "prop_clk_div" -library "lib_prop_clk_div" -name IP_TOOL_VERSION "25.1"
set_global_assignment -entity "prop_clk_div" -library "lib_prop_clk_div" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_prop_clk_div" -name SPD_FILE [file join $::quartus(sip_path) "prop_clk_div.spd"]

set_global_assignment -library "lib_prop_clk_div" -name MISC_FILE [file join $::quartus(sip_path) "prop_clk_div_sim/prop_clk_div.vo"]
