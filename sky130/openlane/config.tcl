# Process node
set ::env(PROCESS) 130
set ::env(DEF_UNITS_PER_MICRON) 1000

# Placement site for core cells
# This can be found in the technology lef

set ::env(VDD_PIN) "VPWR"
set ::env(GND_PIN) "VGND"

# Technology LEF
#ifdef EF_FORMAT
set ::env(TECH_LEF) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/techLEF/$::env(STD_CELL_LIBRARY)/$::env(STD_CELL_LIBRARY).tlef"
set ::env(CELLS_LEF) [glob "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/lef/$::env(STD_CELL_LIBRARY)/*.lef"]
set ::env(GDS_FILES) [glob "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/gds/$::env(STD_CELL_LIBRARY)/*.gds"]

set ::env(GPIO_PADS_LEF) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/lef/sky130_fd_io/sky130_fd_io.lef\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/lef/sky130_fd_io/sky130_ef_io.lef\
	"
# sky130_fd_io.v is not parsable by yosys, so it cannot be included it here yet...
set ::env(GPIO_PADS_VERILOG) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/verilog/sky130_fd_io/sky130_ef_io.v"
set ::env(GPIO_PADS_VERILOG) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/verilog/sky130_fd_io/sky130_ef_io.v\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/verilog/sky130_fd_io/sky130_ef_io__gpiov2_pad_wrapped.v\
	"
#else (!EF_FORMAT)
set ::env(TECH_LEF) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/techlef/$::env(STD_CELL_LIBRARY).tlef"
set ::env(CELLS_LEF) [glob "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lef/*.lef"]
set ::env(GDS_FILES) [glob "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/gds/*.gds"]

set ::env(GPIO_PADS_LEF) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_io/lef/sky130_ef_io.lef\
	"

set ::env(GPIO_PADS_VERILOG) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_io/verilog/sky130_ef_io.v\
	$::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_io/verilog/sky130_ef_io__gpiov2_pad_wrapped.v\
	"
#endif (!EF_FORMAT)

set ::env(GPIO_PADS_LEF_CORE_SIDE) "\
	$::env(PDK_ROOT)/$::env(PDK)/libs.tech/openlane/custom_cells/lef/sky130_fd_io_core.lef\
	$::env(PDK_ROOT)/$::env(PDK)/libs.tech/openlane/custom_cells/lef/sky130_ef_io_core.lef\
	"

# magic setup
#ifdef EF_FORMAT
set ::env(MAGIC_MAGICRC) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/20200508/TECHNAME.magicrc"
set ::env(MAGIC_TECH_FILE) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/20200508/TECHNAME.tech"
#else (!EF_FORMAT)
set ::env(MAGIC_MAGICRC) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/TECHNAME.magicrc"
set ::env(MAGIC_TECH_FILE) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/magic/TECHNAME.tech"
#endif (!EF_FORMAT)

# Klayout setup
set ::env(KLAYOUT_TECH) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/$::env(PDK).lyt"
set ::env(KLAYOUT_PROPERTIES) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/$::env(PDK).lyp"
set ::env(KLAYOUT_DRC_TECH_SCRIPT) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/$::env(PDK).drc"
set ::env(KLAYOUT_DRC_TECH) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/klayout/$::env(PDK).lydrc"

# netgen setup
set ::env(NETGEN_SETUP_FILE) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/netgen/TECHNAME_setup.tcl"
# CTS luts
set ::env(CTS_TECH_DIR) "N/A"

set ::env(CTS_SQR_CAP) 0.258e-3
set ::env(CTS_SQR_RES) 0.125
set ::env(FP_TAPCELL_DIST) 14

# Tracks info
set ::env(TRACKS_INFO_FILE) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/openlane/$::env(STD_CELL_LIBRARY)/tracks.info"

# Latch mapping
set ::env(SYNTH_LATCH_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/openlane/$::env(STD_CELL_LIBRARY)/latch_map.v"

# Tri-state buffer mapping
set ::env(TRISTATE_BUFFER_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/openlane/$::env(STD_CELL_LIBRARY)/tribuff_map.v"

set ::env(GLB_RT_L1_ADJUSTMENT) 0.99

# Extra PDN configs
set ::env(FP_PDN_RAILS_LAYER) met1
set ::env(FP_PDN_LOWER_LAYER) met4
set ::env(FP_PDN_UPPER_LAYER) met5
set ::env(FP_PDN_RAIL_OFFSET) 0
set ::env(FP_PDN_VWIDTH) 1.6
set ::env(FP_PDN_HWIDTH) 1.6
set ::env(FP_PDN_VSPACING) 1.7
set ::env(FP_PDN_HSPACING) 1.7

# Core Ring PDN defaults
set ::env(FP_PDN_CORE_RING_VWIDTH) 1.6
set ::env(FP_PDN_CORE_RING_HWIDTH) 1.6
set ::env(FP_PDN_CORE_RING_VSPACING) 1.7
set ::env(FP_PDN_CORE_RING_HSPACING) 1.7
set ::env(FP_PDN_CORE_RING_VOFFSET) 6
set ::env(FP_PDN_CORE_RING_HOFFSET) 6

# Used for estimate_parasitics
set ::env(WIRE_RC_LAYER) "met1";
