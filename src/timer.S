.section .text

.set SYSTIMER_BASE, 0xD1000000
.set MTIME_LO_OFFSET, 0x0
.set MTIME_HI_OFFSET, 0x4
.set MTIMECMP_LO_OFFSET, 0x8
.set MTIMECMP_HI_OFFSET, 0xC

.set IRQ_TIMER, 0x7

#########################################
# Desc:                                 #
#   - Sets the IE bit for the SysTimer  #
# Params:                               #
#   - N/A                               #
# Returns:                              #
#   - N/A                               # 
#########################################
.global enable_systimer_interrupt
.type enable_systimer_interrupt, @function
enable_systimer_interrupt:
    .cfi_startproc
    addi sp, sp, -4
    sw ra, 0(sp)

    li a0, IRQ_TIMER
    jal eclic_set_ie
    
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    .cfi_endproc

#########################################
# Desc:                                 #
#   - Get the current value of MTIME    #
# Params:                               #
#   - N/A                               #
# Returns:                              #
#   - a0: The value of mtime_lo         #
#   - a1: The value of mtime_hi         #
#########################################
.global get_mtime
.type get_mtime, @function
get_mtime:
    .cfi_startproc
    la a2, SYSTIMER_BASE
    lw a0, MTIME_LO_OFFSET(a2)
    lw a1, MTIME_HI_OFFSET(a2)
    ret
    .cfi_endproc

#########################################
# Desc:                                 #
#   - Set the value of MTIME            #
# Params:                               #
#   - a0: The value of mtime_lo         #
#   - a1: The value of mtime_hi         # 
# Returns:                              #
#   - N/A                               #
#########################################
.global set_mtime
.type set_mtime, @function
set_mtime:
    .cfi_startproc
    la a2, SYSTIMER_BASE
    sw a1, MTIME_HI_OFFSET(a2)
    sw a0, MTIME_LO_OFFSET(a2)
    ret 
    .cfi_endproc

#########################################
# Desc:                                 #
#   - Get the current value of MTIMECMP #
# Params:                               #
#   - N/A                               #
# Returns:                              #
#   - a0: The value of mtimecmp_lo      #
#   - a1: The value of mtimecmp_hi      #
#########################################
.global get_mtimecmp
.type get_mtimecmp, @function
get_mtimecmp:
    .cfi_startproc
    la a2, SYSTIMER_BASE
    lw a0, MTIMECMP_LO_OFFSET(a2)
    lw a1, MTIMECMP_HI_OFFSET(a2)
    ret
    .cfi_endproc

#########################################
# Desc:                                 #
#   - Set the value of MTIMECMP         #
# Params:                               #
#   - a0: The value of mtimecmp_lo      #
#   - a1: The value of mtimecmp_hi      # 
# Returns:                              #
#   - N/A                               #
#########################################
.global set_mtimecmp
.type set_mtimecmp, @function
set_mtimecmp:
    .cfi_startproc
    la a2, SYSTIMER_BASE
    sw a1, MTIMECMP_HI_OFFSET(a2)
    sw a0, MTIMECMP_LO_OFFSET(a2)
    ret
    .cfi_endproc

###########################################################################
# Desc:                                                                   #
#   - Sleeps for a given number of seconds using the SYSTIMER interrupt   #
# Params:                                                                 #
#   - a0: The number of seconds to sleep for                              #
# Returns:                                                                #
#   - N/A                                                                 #
###########################################################################
.global sleep
.type sleep, @function
sleep:
    .cfi_startproc
    addi sp, sp, -4
    sw ra, 0(sp)

    la t0, TimerFreq
    lw t1, 0(t0)
    mul t1, t1, a0 
    mulhu t2, t1, a0

    jal get_mtime
    mv a2, a1
    add a1, a1, t2
    sltu a2, a1, a2
    add a0, a0, t1
    add a0, a2, a0
    
    jal set_mtimecmp
    # TODO This assumes that the SYSTIMER is the only enabled interrupt
    wfi

    lw ra, 0(sp)
    addi sp, sp, 4
    ret
    .cfi_endproc
