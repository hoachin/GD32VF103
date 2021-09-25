.section .text

.global _main
.type _main, @function
_main:
    .cfi_startproc
    # Enable Timer Interrupt
    jal enable_systimer_interrupt

    li a0, 0x5 # Sleep for 5s
    jal sleep

    ret
    .cfi_endproc
