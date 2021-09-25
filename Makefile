ARCH=rv32imac
ABI=ilp32
EMU=elf32lriscv

ARCHFLAGS=-march=rv32imac -mabi=ilp32
CFLAGS=$(ARCHFLAGS) -g
LDFLAGS=-m $(EMU) -nostdlib -Tlnk.lds
AS=riscv64-unknown-elf-as
LD=riscv64-unknown-elf-ld
OBJCOPY=riscv64-unknown-elf-objcopy

name=gd32
hex=$(name).hex
elf=$(name).elf
lds=lnk.lds

SRCDIR := src
BUILDDIR := target
SOURCES := $(wildcard $(SRCDIR)/*.S)
OBJECTS := $(patsubst $(SRCDIR)/%.S,$(BUILDDIR)/%.o,$(SOURCES)) 

vpath %.S $(SRCDIR)

all: $(hex)

$(BUILDDIR)/%.o: %.S
	$(AS) $(CFLAGS) -o $@ $<

$(elf): $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $(BUILDDIR)/$@

$(hex): $(elf)
	$(OBJCOPY) -O ihex $(BUILDDIR)/$< $(BUILDDIR)/$@

.PHONY: clean
clean:
	rm -f $(BUILDDIR)/$(hex) $(BUILDDIR)/$(elf) $(BUILDDIR)/*.o
