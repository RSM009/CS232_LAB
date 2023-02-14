GHDL = GHDL
FLAGS = "--std=08"

all:
	@$(GHDL) -a $(FLAGS) RCA8.vhd tb.vhd fulladder.vhd
	@$(GHDL) -e $(FLAGS) tb
	@$(GHDL) -r $(FLAGS) tb --vcd=RCA8.vcd --stop-time=20ns