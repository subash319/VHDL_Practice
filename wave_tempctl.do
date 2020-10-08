onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_tempctl/UUT/CURRENT_TEMP
add wave -noupdate /t_tempctl/UUT/DESIRED_TEMP
add wave -noupdate /t_tempctl/UUT/COOL
add wave -noupdate /t_tempctl/UUT/HEAT
add wave -noupdate /t_tempctl/UUT/FURNACE_ON
add wave -noupdate -divider AC_ON
add wave -noupdate /t_tempctl/UUT/CLK
add wave -noupdate /t_tempctl/UUT/COOL_REG
add wave -noupdate /t_tempctl/UUT/HEAT_REG
add wave -noupdate /t_tempctl/UUT/CURRENT_TEMP_REG
add wave -noupdate /t_tempctl/UUT/DESIRED_TEMP_REG
add wave -noupdate /t_tempctl/UUT/FURNACE_ON_REG
add wave -noupdate /t_tempctl/UUT/AC_ON_REG
add wave -noupdate /t_tempctl/UUT/AC_ON
add wave -noupdate -divider TEMP_DISPLAY
add wave -noupdate /t_tempctl/UUT/DISPLAY_SELECT
add wave -noupdate /t_tempctl/UUT/DISPLAY_SELECT_REG
add wave -noupdate /t_tempctl/UUT/TEMP_DISPLAY_REG
add wave -noupdate /t_tempctl/UUT/TEMP_DISPLAY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 263
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {105 ns}
