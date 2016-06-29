include scripts/source.mak

IVERILOG = C:/iverilog/bin
TOP_MODULE = tb_fpga

.PHONY: sim
sim:
	-mkdir sim
	$(IVERILOG)/iverilog $(INC_DIR:%=-y %) $(INC_DIR:%=-I %) \
				$(RTL_MACRO:%=-D %) \
				-s $(TOP_MODULE) \
				-o sim/$(TOP_MODULE) \
				$(RTL) 
	cd sim && $(IVERILOG)/vvp $(TOP_MODULE)


