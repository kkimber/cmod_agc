rem workaround relative path to ROMS by copying them
mkdir ..\..\roms
copy ..\fpga\roms\*.mif ..\..\roms

vsim -do run.do