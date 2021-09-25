.section .init

.set CSR_MMISC_CTL, 0x7D0
    .set MMISC_CTL_NMI_CAUSE_FFF, 0x200
.set CSR_MTVT, 0x307

.set CLIC_INT_ATTR_BASE, 0xD2001002

.global _start
.type _start, @function
_start:
    .cfi_startproc
    .cfi_undefined ra

    # Global Pointer setup
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # Stack Pointer setup
    la sp, __stack_pointer$

    # Copy Data Section
    la t0, _data_source_start
    la t1, _data_target_start
    la t2, _data_target_end
    beq t0, t1, 2f
    beq t1, t2, 2f

    1:
    lw a0, 0(t0)
    addi t0, t0, 4
    sw a0, 0(t1)
    addi t1, t1, 4
    blt t1, t2, 1b
    2:

    # Zero BSS
    la t1, _bss_target_start
    la t2, _bss_target_end
    bge t1, t2, 2f

    1:
    sw x0, 0(t1)
    addi t1, t1, 4
    blt t1, t2, 1b
    2:
    .cfi_endproc

    # Set exception handler base
    la t0, exception_handler
    csrw mtvec, t0

    # Set NMI base to mtvec
    li t0, MMISC_CTL_NMI_CAUSE_FFF
    csrs CSR_MMISC_CTL, t0

    # Enable (E)CLIC mode
    csrsi mtvec, 0x3

    # Set ECLIC vector base address
    la t0, _vector_table
    csrw CSR_MTVT, t0

    # Set interrupts to vectored
    la t0, CLIC_INT_ATTR_BASE
    li t1, 0x1
    sb t1, 12(t0) # Software Interrupt
    sb t1, 28(t0) # Timer Interrupt
    sb t1, 68(t0) # Memory Access Error
    sb t1, 72(t0) # Performance Monitor
    # GD32VF103 specific interrupts
    addi t2, t0, 0x4C
    addi t3, t0, 0x158
    1:
    sb t1, 0(t2)
    addi t2, t2, 0x4
    ble t2, t3, 1b 

    # Set MIE
    csrsi mstatus, 0x8

    jal _main

    # Just looop once if _main returns
    1:
    j 1b
