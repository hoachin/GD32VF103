OUTPUT_FORMAT("elf32-littleriscv")
OUTPUT_ARCH("riscv")
ENTRY(_start)

MEMORY
{
    flash (rxai!w) : ORIGIN = 0x08000000, LENGTH = 128K
    ram   (wxa!ri) : ORIGIN = 0x20000000, LENGTH = 32K
}

SECTIONS
{
    __stack_size = DEFINED(__stack_size) ? __stack_size : 2K;

    .init : {
        *(.vector_table*)
        KEEP (*(SORT_NONE(.init)))
    } >flash AT>flash

    .text : ALIGN(4) {
        *(.init*)
        *(.text*)
    } >flash AT> flash 
     
   .rodata : {
        *(.rodata*)
    } >flash AT> flash
    
    .data : ALIGN(4) {
        *(.data*)
        . = ALIGN(8);
        __global_pointer$ = . + 0x800;
    } >ram AT> flash

    _data_source_start = LOADADDR(.data);
    _data_target_start = ADDR(.data);
    _data_target_end = ADDR(.data) + SIZEOF(.data);

    .bss (NOLOAD): ALIGN(4) {
        *(.bss*)
        *(COMMON)
    } >ram AT >ram

    _bss_target_start = ADDR(.bss);
    _bss_target_end = ADDR(.bss) + SIZEOF(.bss);

    .stack (NOLOAD) : ALIGN(16) {
        . += __stack_size;
        __stack_pointer$ = .;
    } >ram

}
