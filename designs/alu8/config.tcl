set ::env(DESIGN_NAME) "alu_top"

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) ""

set ::env(CLOCK_PERIOD) 10

set ::env(FP_CORE_UTIL) 40

set ::env(PL_TARGET_DENSITY) 0.55