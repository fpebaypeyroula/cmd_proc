GHDL=ghdl
GFLAGS=--std=08 -fsynopsys

all: compile run

compile: analyze elaborate

analyze:
	$(GHDL) -a $(GFLAGS) cmd_proc.vhdl
	$(GHDL) -a $(GFLAGS) cmd_proc_tb.vhdl

elaborate:
	$(GHDL) -e $(GFLAGS) cmd_proc_tb

run:
	$(GHDL) -r cmd_proc_tb --vcd=cmd_proc_tb.vcd --stop-time=5us
