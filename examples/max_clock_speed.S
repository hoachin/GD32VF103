.section .text

.global _main
.type _main, @function
_main:
    .cfi_startproc
    # Set clock to 108MHz
    jal _set_max_sys_clock
    
    ret
    .cfi_endproc
