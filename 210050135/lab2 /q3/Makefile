GHDL = GHDL
FLAGS = "--std=08"

all:
	@$(GHDL) -a $(FLAGS) RLE.vhd RLE_test.vhd
	@$(GHDL) -e $(FLAGS) ASCII_Read_test
	@$(GHDL) -r $(FLAGS) ASCII_Read_test --vcd=rle.vcd --stop-time=20ns