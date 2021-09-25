.section .text

.set ECLIC_BASE, 0xD2000000
.set ECLIC_CLICCFG, ECLIC_BASE
.set ECLIC_CLICINFO, ECLIC_BASE+0x4
.set ECLIC_MTH, ECLIC_BASE+0xB
.set ECLIC_CLICINTIP_BASE, ECLIC_BASE+0x1000
.set ECLIC_CLICINTIE_BASE, ECLIC_BASE+0x1001
.set ECLIC_CLICINTATTR_BASE, ECLIC_BASE+0x1002
.set ECLIC_CLICINTCTL_BASE, ECLIC_BASE+0x1003

##################################################
# Desc:                                          #
#   - Clears pending interrupt bit on ECLIC      #
# Params:                                        #
#   - a0: The IRQ No. of the interrupt to clear  #
# Returns:                                       #
#   - N/A                                        #
##################################################
.global eclic_clear_ip
.type eclic_clear_ip, @function
eclic_clear_ip:
    .cfi_startproc
    la a1, ECLIC_CLICINTIP_BASE
    slli a0, a0, 0x2
    add a0, a0, a1
    sb zero, 0(a0)
    ret
    .cfi_endproc

##################################################
# Desc:                                          #
#   - Sets pending interrupt bit on ECLIC        #
# Params:                                        #
#   - a0: The IRQ No. of the interrupt to set    #
# Returns:                                       #
#   - N/A                                        #
##################################################
.global eclic_set_ip
.type eclic_set_ip, @function
eclic_set_ip:
    .cfi_startproc
    la a1, ECLIC_CLICINTIP_BASE
    slli a0, a0, 0x2
    add a0, a0, a1
    li a1, 0x1
    sb a1, 0(a0)
    ret
    .cfi_endproc

##################################################
# Desc:                                          #
#   - Clears interrupt enabled bit on ECLIC      #
# Params:                                        #
#   - a0: The IRQ No. of the interrupt to clear  #
# Returns:                                       #
#   - N/A                                        #
##################################################
.global eclic_clear_ie
.type eclic_clear_ie, @function
eclic_clear_ie:
    .cfi_startproc
    la a1, ECLIC_CLICINTIE_BASE
    slli a0, a0, 0x2
    add a0, a0, a1
    sb zero, 0(a0)
    ret
    .cfi_endproc

##################################################
# Desc:                                          #
#   - Sets interrupt enabled bit on ECLIC        #
# Params:                                        #
#   - a0: The IRQ No. of the interrupt to set    #
# Returns:                                       #
#   - N/A                                        #
##################################################
.global eclic_set_ie
.type eclic_set_ie, @function
eclic_set_ie:
    .cfi_startproc
    la a1, ECLIC_CLICINTIE_BASE
    slli a0, a0, 0x2
    add a0, a0, a1
    li a1, 0x1
    sb a1, 0(a0)
    ret
    .cfi_endproc

