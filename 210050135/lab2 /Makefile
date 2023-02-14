GHDL = GHDL
FLAGS = "--std=08"

all:
	@$(GHDL) -a $(FLAGS) nand_gate.vhd nand_tb.vhd
	@$(GHDL) -e $(FLAGS) tb
	@$(GHDL) -r $(FLAGS) tb --vcd=nand.vcd --stop-time=20ns