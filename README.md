# Alchitry_Au

## Vivado
To get the Alchitry Au (V1) working in vivado there are a couple of things you have to do.
1. rewrite the FTDI (note that the -s parameter you can set to whatever you want)
```sh
cd /tools/Xilinx/Vivado/2024.1/bin 
./program_ftdi -write -f FT2232H -v "Alchitry" -b "Alchitry Au" -d "Alchitry Au" -s 000000

```
if this fails, then you might need to edit some of the tcl files in `/tools/Xilinx/Vivado/2024.1/scripts/program_ftdi/` directory. There was one that returned $res but res was not delared in the fuction. All you need to do is set a default value for this, then everything will work.
I needed to modify `ftdieeprom.tcl` in the `program_eeprom` proc and add the line `set res ""`.

2. put the board file in `/tools/Xilinx/Vivado/2024.1/data/boards/board_files/` directory (make it if it doesn't exist). You can find the board file in the `/board` directory in this repo.

You should be discoverable in Vivado Hardware Manager now, you can program the device from this. However there is a limitation to this, the eeprom on the device (SST26VF032B by microchip) is not something that is supported by Vivado. If you want vivado to generate the file to write to the device, you have to bundle everything into a bin file. 
Settings > Bitstream > Write Stream > -bin_file* must be selected. Then you can use the Alchitry_Au loader to write it to the memory.

## Constraint files
This repo also contains the constraint files for the base AU as well as the IO board.

## Board files
I got the board files from [here](https://forum.alchitry.com/t/missing-files-au-pin-mapping-and-board-files-for-vivado/1395/4). But I have modified them to more complete up to the connectors on the board. 


