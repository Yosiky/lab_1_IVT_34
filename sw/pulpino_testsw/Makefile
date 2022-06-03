# and don't touch the rest unless you know what you're doing.
CROSS_COMPILE ?= /opt/riscv-pulp/bin/riscv32-unknown-elf-
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))

CC      =   $(CROSS_COMPILE)gcc
LD      =   $(CROSS_COMPILE)ld
OBJDUMP =   $(CROSS_COMPILE)objdump
OBJCOPY =   $(CROSS_COMPILE)objcopy
SIZE    =   $(CROSS_COMPILE)size

DFLAGS  =

# Board support
BSP           = board_support
BSP_INCLUDE   = $(BSP)/pulpino_hwlib/include 
BOARD_INCLUDE = ../headers

OBJS =  gpio_test_main.o\
	$(BSP)/pulpino_hwlib/int.o\
	$(BSP)/pulpino_hwlib/gpio.o\

EMB_OBJS =  $(BSP)/pulpino_hwlib/startup/crt0.riscv.o \
            $(BSP)/pulpino_hwlib/exceptions.o   \
            $(BSP)/pulpino_hwlib/int.o


LDS_EMB     = $(BSP)/pulpino_hwlib/startup/link.common.ld
OUTPUT      = pulpino
OUTPUT_EMB  = $(OUTPUT)



.PHONY: all dat
all: clean embedded dat




.PHONY: embedded
embedded: $(OUTPUT_EMB)
$(OUTPUT_EMB): $(LDS_EMB) $(EMB_OBJS) $(OBJS)
	${CC} $(BOARD_INCLUDE:%=-I%) $(BSP_INCLUDE:%=-I%) -flto -O2 -Wl,--gc-sections -o $(OUTPUT_EMB).elf $(EMB_OBJS) -nostartfiles $(OBJS) -lm -T $(LDS_EMB) -lc
	${OBJCOPY} -O binary $(OUTPUT_EMB).elf $(OUTPUT_EMB).bin
	${OBJDUMP} -D $(OUTPUT_EMB).elf > disasm_emb.S
	$(SIZE) $(OUTPUT_EMB).elf

dat: embedded
	python3 ../generate_dat.py $(OUTPUT_EMB).bin ../$(OUTPUT_EMB).dat
	.././elf2dat.sh $(OUTPUT_EMB).elf

.PHONY: clean
clean:
	rm -f $(OBJS) $(DBG_OBJS) $(EMB_OBJS)
	rm -f $(OUTPUT_DBG)
	rm -f $(OUTPUT_EMB).elf $(OUTPUT_EMB).bin
	rm -f $(OUTPUT_EMB).dat
	rm -f disasm.S disasm_debug.S disasm_emb.S disasm_boot.S

%.o:	%.S
	${CC} $(BOARD_INCLUDE:%=-I%) -c $^ -o $@

%.o:	%.c
	${CC} $(DFLAGS) $(BOARD_INCLUDE:%=-I%) $(BSP_INCLUDE:%=-I%) $(GDBDEBUG) -c $^ -o $@
