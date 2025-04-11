###################################################################

# Created by write_sdc on Thu Jan  7 00:03:24 2016

###################################################################
set sdc_version 1.8

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_area 100000
create_clock [get_ports CK]  -period 20  -waveform {0 10}
