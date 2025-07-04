set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]

create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
set_property PACKAGE_PIN N14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN P6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]


set_property PACKAGE_PIN K13 [get_ports {led[0]}]
set_property PACKAGE_PIN K12 [get_ports {led[1]}]
set_property PACKAGE_PIN L14 [get_ports {led[2]}]
set_property PACKAGE_PIN L13 [get_ports {led[3]}]
set_property PACKAGE_PIN M16 [get_ports {led[4]}]
set_property PACKAGE_PIN M14 [get_ports {led[5]}]
set_property PACKAGE_PIN M12 [get_ports {led[6]}]
set_property PACKAGE_PIN N16 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]

# serial names are flipped in the schematic (named for the FTDI chip)
set_property PACKAGE_PIN P15 [get_ports usb_tx]
set_property IOSTANDARD LVCMOS33 [get_ports usb_tx]
set_property PACKAGE_PIN P16 [get_ports usb_rx]
set_property IOSTANDARD LVCMOS33 [get_ports usb_rx]

# i2c pins
#set_property IOSTANDARD LVCMOS33 [get_ports i2c_scl]

#set_property IOSTANDARD LVCMOS33 [get_ports i2c_sda]

#create_pblock pblock_i2c_state_machine
#add_cells_to_pblock [get_pblocks pblock_i2c_state_machine] [get_cells -quiet [list i2c_state_machine]]
#resize_pblock [get_pblocks pblock_i2c_state_machine] -add {SLICE_X18Y102:SLICE_X39Y99}
create_pblock pblock_reset_conditioner
add_cells_to_pblock [get_pblocks pblock_reset_conditioner] [get_cells -quiet [list reset_conditioner]]
resize_pblock [get_pblocks pblock_reset_conditioner] -add {SLICE_X28Y96:SLICE_X29Y97}
