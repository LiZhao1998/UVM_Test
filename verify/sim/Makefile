.PHONY: com sim clean run
OUTPUT = test

VCS = vcs -full64 -sverilog +v2k -timescale=1ns/1ps \
                -debug_all\
                -ntb_opts uvm-1.1\
                -o ${OUTPUT}\
                -l comp.log

SIM = ./${OUTPUT} +UVM_NO_RELNOTES -l run.log

com:
	${VCS} -f ../../rtl/file.f

sim: ${SIM}

run: com
	${SIM}

clean:
	rm -rf ./csrc *.daidir  vc_hdrs.h *.log simv* *.key ${OUTPUT}
