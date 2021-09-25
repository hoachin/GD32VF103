.section .text

# RCU Registers
.set RCU_CTL, 0x40021000
.set RCU_CFG0, 0x40021004
.set RCU_INT, 0x40021008
.set RCU_APB2RST, 0x4002100C
.set RCU_APB1RST, 0x40021010
.set RCU_AHBEN, 0x40021014
.set RCU_APB2EN, 0x40021018
.set RCU_APB1EN, 0x4002101C
.set RCU_BDCTL, 0x40021020
.set RCU_RSTSCK, 0x40021024
.set RCU_AHBRST, 0x40021028
.set RCU_CFG1, 0x4002102C
.set RCU_DSV, 0x40021034

# RCU_CTL Fields
.set RCU_IRC8MEN, 0x1
.set RCU_IRC8MSTB, 0x2
.set RCU_IRC8MADJ, 0xF8
.set RCU_IRC8MCALIB, 0xFF00
.set RCU_HXTALEN, 0x10000
.set RCU_HXTALSTB, 0x20000
.set RCU_HXTALBPS, 0x40000
.set RCU_CKMEN, 0x80000
.set RCU_PLLEN, 0x1000000
.set RCU_PLLSTB, 0x2000000
.set RCU_PLL1EN, 0x4000000
.set RCU_PLL1STB, 0x8000000
.set RCU_PLL2EN, 0x10000000
.set RCU_PLL2STB, 0x20000000

# RCU_CFG0 Fields   
.set RCU_SCS, 0x3
    .set RCU_SCS_IRC8M, 0x0
    .set RCU_SCS_HXTAL, 0x1
    .set RCU_SCS_PLL, 0x2
.set RCU_SCSS, 0xC
    .set RCU_SCSS_IRC8M, 0x0
    .set RCU_SCSS_HXTAL, 0x4
    .set RCU_SCSS_PLL, 0x8
.set RCU_AHBPSC, 0xF0
    .set RCU_AHBPSC_DIV1, 0x0
    .set RCU_AHBPSC_DIV2, 0x80
    .set RCU_AHBPSC_DIV4, 0x90
    .set RCU_AHBPSC_DIV8, 0xA0
    .set RCU_AHBPSC_DIV16, 0xB0
    .set RCU_AHBPSC_DIV64, 0xC0
    .set RCU_AHBPSC_DIV128, 0xD0
    .set RCU_AHBPSC_DIV256, 0xE0
    .set RCU_AHBPSC_DIV512, 0xF0
.set RCU_APB1PSC, 0x700
    .set RCU_APB1PSC_DIV1, 0x0
    .set RCU_APB1PSC_DIV2, 0x400
    .set RCU_APB1PSC_DIV4, 0x500
    .set RCU_APB1PSC_DIV8, 0x600
    .set RCU_APB1PSC_DIV16, 0x700
.set RCU_APB2PSC, 0x3800
    .set RCU_APB2PSC_DIV1, 0x0
    .set RCU_APB2PSC_DIV2, 0x2000
    .set RCU_APB2PSC_DIV4, 0x2800
    .set RCU_APB2PSC_DIV8, 0x3000
    .set RCU_APB2PSC_DIV16, 0x3800 
.set RCU_PLLSEL, 0x10000
.set RCU_PREDV0_LSB, 0x20000
.set RCU_PLLMF_L, 0x3C0000
    .set RCU_PLL_MUL2, 0x0
    .set RCU_PLL_MUL3, 0x40000
    .set RCU_PLL_MUL4, 0x80000
    .set RCU_PLL_MUL5, 0xC0000
    .set RCU_PLL_MUL6, 0x100000
    .set RCU_PLL_MUL7, 0x140000
    .set RCU_PLL_MUL8, 0x180000
    .set RCU_PLL_MUL9, 0x1C0000
    .set RCU_PLL_MUL10, 0x200000
    .set RCU_PLL_MUL11, 0x240000
    .set RCU_PLL_MUL12, 0x280000
    .set RCU_PLL_MUL13, 0x2C0000
    .set RCU_PLL_MUL14, 0x300000
    .set RCU_PLL_MUL6P5, 0x340000
    .set RCU_PLL_MUL16T1, 0x380000
    .set RCU_PLL_MUL16T2, 0x3C0000
    .set RCU_PLL_MUL17, 0x20000000
    .set RCU_PLL_MUL18, 0x20040000
    .set RCU_PLL_MUL19, 0x20080000
    .set RCU_PLL_MUL20, 0x200C0000
    .set RCU_PLL_MUL21, 0x20100000
    .set RCU_PLL_MUL22, 0x20140000
    .set RCU_PLL_MUL23, 0x20180000
    .set RCU_PLL_MUL24, 0x201C0000
    .set RCU_PLL_MUL25, 0x20200000
    .set RCU_PLL_MUL26, 0x20240000
    .set RCU_PLL_MUL27, 0x20280000
    .set RCU_PLL_MUL28, 0x202C0000
    .set RCU_PLL_MUL29, 0x20300000
    .set RCU_PLL_MUL30, 0x20340000
    .set RCU_PLL_MUL31, 0x20380000
    .set RCU_PLL_MUL32, 0x203C0000
.set RCU_USBFSPSC, 0xC00000
    .set RCU_USBFSPSC_PLL1P5, 0x0
    .set RCU_USBFSPSC_PLL, 0x400000
    .set RCU_USBFSPSC_PLL2P5, 0x800000
    .set RCU_USBFSPSC_PLL2, 0xC00000
.set RCU_CKOUT0SEL, 0x7800000
    .set RCU_CKOUT0SEL_NONE, 0x0
    .set RCU_CKOUT0SEL_SYSCLK, 0x2000000
    .set RCU_CKOUT0SEL_IRC8M, 0x2800000
    .set RCU_CKOUT0SEL_HXTAL, 0x3000000 
    .set RCU_CKOUT0SEL_PLLDIV2, 0x3800000 
    .set RCU_CKOUT0SEL_PLL1, 0x4000000
    .set RCU_CKOUT0SEL_PLL2DIV2, 0x4800000
    .set RCU_CKOUT0SEL_EXT1, 0x5000000
    .set RCU_CKOUT0SEL_PLL2, 0x5800000
.set RCU_ADCPSC, 0x10000000
.set RCU_PLLMF_H, 0x20000000

# RCU_INT Fields
.set RCU_IRC40KSTBIF, 0x1
.set RCU_LXTALSTBIF, 0x2
.set RCU_IRC8MSTBIF, 0x4
.set RCU_HXTALSTBIF, 0x8
.set RCU_PLLSTBIF, 0x10
.set RCU_PLL1STBIF, 0x20
.set RCU_PLL2STBIF, 0x40
.set RCU_CKMIF, 0x80
.set RCU_IRC40KSTBIE, 0x100
.set RCU_LXTALSTBIE, 0x200
.set RCU_IRC8MSTBIE, 0x400
.set RCU_HXTALSTBIE, 0x800
.set RCU_PLLSTBIE, 0x1000
.set RCU_PLL1STBIE, 0x2000
.set RCU_PLL2STBIE, 0x4000
.set RCU_IRC40KSTBIC, 0x10000
.set RCU_LXTALSTBIC, 0x20000
.set RCU_IRC8MSTBIC, 0x40000
.set RCU_HXTALSTBIC, 0x80000
.set RCU_PLLSTBIC, 0x100000
.set RCU_PLL1STBIC, 0x200000
.set RCU_PLL2STBIC, 0x400000
.set RCU_CKMIC, 0x800000

# RCU_APB2RST Fields
.set RCU_AFRST, 0x1
.set RCU_PARST, 0x4
.set RCU_PBRST, 0x8
.set RCU_PCRST, 0x10
.set RCU_PDRST, 0x20
.set RCU_PERST, 0x40
.set RCU_ADC0RST, 0x100
.set RCU_ADC1RST, 0x200
.set RCU_TIMER0RST, 0x400
.set RCU_SPI0RST, 0x800
.set RCU_USART0RST, 0x2000

# RCU_APB1RST Fields
.set RCU_TIMER1RST, 0x1
.set RCU_TIMER2RST, 0x2
.set RCU_TIMER3RST, 0x4
.set RCU_TIMER4RST, 0x8
.set RCU_TIMER5RST, 0x10
.set RCU_TIMER6RST, 0x20
.set RCU_WWDGTRST, 0x800
.set RCU_SPI1RST, 0x4000
.set RCU_SPI2RST, 0x8000
.set RCU_USART1RST, 0x20000
.set RCU_USART2RST, 0x40000
.set RCU_UART3RST, 0x80000
.set RCU_UART4RST, 0x100000
.set RCU_I2C0RST, 0x200000
.set RCU_I2C1RST, 0x400000
.set RCU_CAN0RST, 0x2000000
.set RCU_CAN1RST, 0x4000000
.set RCU_BKPIRST, 0x8000000
.set RCU_PMURST, 0x10000000
.set RCU_DACRST, 0x20000000

# RCU_AHBEN Fields
.set RCU_DMA0EN, 0x1
.set RCU_DMA1EN, 0x2
.set RCU_SRAMSPEN, 0x4
.set RCU_FMCSPEN, 0x10
.set RCU_CRCEN, 0x40
.set RCU_EXMCEN, 0x100
.set RCU_USBFSEN, 0x1000

# RCU_APB2EN Fields
.set RCU_AFEN, 0x1
.set RCU_PAEN, 0x4
.set RCU_PBEN, 0x8
.set RCU_PCEN, 0x10
.set RCU_PDEN, 0x20
.set RCU_PEEN, 0x40
.set RCU_ADC0EN, 0x200
.set RCU_ADC1EN, 0x400
.set RCU_TIMER0EN, 0x800
.set RCU_SPI0EN, 0x1000
.set RCU_USART0EN, 0x4000

# RCU_APB1EN Fields
.set RCU_TIMER1EN, 0x1
.set RCU_TIMER2EN, 0x2
.set RCU_TIMER3EN, 0x4
.set RCU_TIMER4EN, 0x8
.set RCU_TIMER5EN, 0x10
.set RCU_TIMER6EN, 0x20
.set RCU_WWDGTEN, 0x800
.set RCU_SPI1EN, 0x4000
.set RCU_SPI2EN, 0x8000
.set RCU_USART1EN, 0x20000
.set RCU_USART2EN, 0x40000
.set RCU_UART3EN, 0x80000
.set RCU_UART4EN, 0x100000
.set RCU_I2C0EN, 0x200000
.set RCU_I2C1EN, 0x400000
.set RCU_CAN0EN, 0x2000000
.set RCU_CAN1EN, 0x4000000
.set RCU_BKPIEN, 0x8000000
.set RCU_PMUEN, 0x10000000
.set RCU_DACEN, 0x20000000

# RCU_BDCTL Fields
.set RCU_LXTALEN, 0x1
.set RCU_LXTALSTB, 0x2
.set RCU_LXTALBPS, 0x4
.set RCU_RTCSRC, 0x300
    .set RCU_RTCSRC_NONE, 0x0
    .set RCU_RTCSRC_LXTAL, 0x100
    .set RCU_RTCSRC_IRC40K, 0x200
    .set RCU_RTCSRC_HXTALDIV128, 0x300
.set RCU_RTCEN, 0x8000
.set RCU_BKPRST, 0x100000

# RCU_RSTSCK Fields
.set RCU_IRC40KEN, 0x1
.set RCU_IRC40KSTB, 0x2
.set RCU_RSTFC, 0x1000000
.set RCU_EPRSTF, 0x4000000
.set RCU_PORRSTF, 0x8000000
.set RCU_SWRSTF, 0x10000000
.set RCU_FWDGTRSTF, 0x20000000
.set RCU_WWDGTRSTF, 0x40000000
.set RCU_LPRSTF, 0x80000000

# RCU_AHBRST Fields
.set RCU_USBFSRST, 0x1000

# RCU_CFG1 Fields
.set RCU_PREDV0, 0xF
    .set RCU_PREDV0_DIV1, 0x0
    .set RCU_PREDV0_DIV2, 0x1
    .set RCU_PREDV0_DIV3, 0x2
    .set RCU_PREDV0_DIV4, 0x3
    .set RCU_PREDV0_DIV5, 0x4
    .set RCU_PREDV0_DIV6, 0x5
    .set RCU_PREDV0_DIV7, 0x6
    .set RCU_PREDV0_DIV8, 0x7
    .set RCU_PREDV0_DIV9, 0x8
    .set RCU_PREDV0_DIV10, 0x9
    .set RCU_PREDV0_DIV11, 0xA
    .set RCU_PREDV0_DIV12, 0xB
    .set RCU_PREDV0_DIV13, 0xC
    .set RCU_PREDV0_DIV14, 0xD
    .set RCU_PREDV0_DIV15, 0xE
    .set RCU_PREDV0_DIV16, 0xF
.set RCU_PREDV1, 0xF0
    .set RCU_PREDV1_DIV1, 0x0
    .set RCU_PREDV1_DIV2, 0x10
    .set RCU_PREDV1_DIV3, 0x20
    .set RCU_PREDV1_DIV4, 0x30
    .set RCU_PREDV1_DIV5, 0x40
    .set RCU_PREDV1_DIV6, 0x50
    .set RCU_PREDV1_DIV7, 0x60
    .set RCU_PREDV1_DIV8, 0x70
    .set RCU_PREDV1_DIV9, 0x80
    .set RCU_PREDV1_DIV10, 0x90
    .set RCU_PREDV1_DIV11, 0xA0
    .set RCU_PREDV1_DIV12, 0xB0
    .set RCU_PREDV1_DIV13, 0xC0
    .set RCU_PREDV1_DIV14, 0xD0
    .set RCU_PREDV1_DIV15, 0xE0
    .set RCU_PREDV1_DIV16, 0xF0
.set RCU_PLL1MF, 0xF00
    .set RCU_PLL1_MUL8, 0x600
    .set RCU_PLL1_MUL9, 0x700
    .set RCU_PLL1_MUL10, 0x800
    .set RCU_PLL1_MUL11, 0x900
    .set RCU_PLL1_MUL12, 0xA00
    .set RCU_PLL1_MUL13, 0xB00
    .set RCU_PLL1_MUL14, 0xC00
    .set RCU_PLL1_MUL15, 0xD00
    .set RCU_PLL1_MUL16, 0xE00
    .set RCU_PLL1_MUL20, 0xF00
.set RCU_PLL2MF, 0xF000
    .set RCU_PLL2_MUL8, 0x6000
    .set RCU_PLL2_MUL9, 0x7000
    .set RCU_PLL2_MUL10, 0x8000
    .set RCU_PLL2_MUL11, 0x9000
    .set RCU_PLL2_MUL12, 0xA000
    .set RCU_PLL2_MUL13, 0xB000
    .set RCU_PLL2_MUL14, 0xC000
    .set RCU_PLL2_MUL15, 0xD000
    .set RCU_PLL2_MUL16, 0xE000
    .set RCU_PLL2_MUL20, 0xF000
.set RCU_PREDV0SEL, 0x10000
.set RCU_I2S1SEL, 0x20000
.set RCU_I2S2SEL, 0x40000

# RCU_DSV Fields
.set RCU_DSLPVS, 0x3
    .set RCU_DSLPVS_1P2, 0x0
    .set RCU_DSLPVS_1P1, 0x1
    .set RCU_DSLPVS_1P0, 0x2
    .set RCU_DSLPVS_0P9, 0x3

.global _set_max_sys_clock
.type _set_max_sys_clock, @function
_set_max_sys_clock:
    .cfi_startproc
    # Enable HXTAL
    la t0, RCU_CTL
    lw t1, 0(t0)
    li t2, RCU_HXTALEN
    or t1, t1, t2
    sw t1, 0(t0)
    li t2, RCU_HXTALSTB
    1:
    # Wait for HXTAL to be stable
    lw t1, 0(t0)
    and t1, t1, t2
    beqz t1, 1b

    # Set AHB/APB1/APB2 prescaler
    # Set PLL multiplication factor
    # Set PLL clock source
    la t0, RCU_CFG0
    lw t1, 0(t0)
    li t2, RCU_AHBPSC
    li t3, RCU_APB1PSC
    or t2, t2, t3
    li t3, RCU_APB2PSC
    or t2, t2, t3
    li t3, RCU_PLLMF_L
    or t2, t2, t3
    li t3, RCU_PLLMF_H
    or t2, t2, t3
    not t2, t2
    and t1, t1, t2
    li t2, RCU_AHBPSC_DIV1
    or t1, t1, t2
    li t2, RCU_APB1PSC_DIV2
    or t1, t1, t2
    li t2, RCU_APB2PSC_DIV1
    or t1, t1, t2
    li t2, RCU_PLL_MUL27
    or t1, t1, t2
    li t2, RCU_PLLSEL
    or t1, t1, t2
    sw t1, 0(t0)

    # Set PREDV0 source
    # Set PREDV0/PREDV1 division factor
    # Set PREDV0/PREDV1 multiplication factor
    la t0, RCU_CFG1
    lw t1, 0(t0)
    li t2, RCU_PREDV0
    li t3, RCU_PREDV1
    or t2, t2, t3
    li t3, RCU_PLL1MF
    or t2, t2, t3
    li t3, RCU_PLL2MF
    or t2, t2, t3
    li t3, RCU_PREDV0SEL
    or t2, t2, t3
    not t2, t2
    and t1, t1, t2
    li t2, RCU_PREDV0_DIV2
    or t1, t1, t2
    li t2, RCU_PREDV1_DIV2
    or t1, t1, t2
    li t2, RCU_PLL1_MUL20
    or t1, t1, t2
    li t2, RCU_PLL2_MUL20
    or t1, t1, t2
    sw t1, 0(t0)

    #Enable PLL1
    la t0, RCU_CTL
    lw t1, 0(t0)
    li t2, RCU_PLL1EN
    or t1, t1, t2
    sw t1, 0(t0)
    li t2, RCU_PLL1STB
    1:
    # Wait for PLL1 to be stable
    lw t1, 0(t0)
    and t1, t1, t2
    beqz t1, 1b

    #Enable PLL2
    lw t1, 0(t0)
    li t2, RCU_PLL2EN
    or t1, t1, t2
    sw t1, 0(t0)
    li t2, RCU_PLL2STB
    1:
    # Wait for PLL2 to be stable
    lw t1, 0(t0)
    and t1, t1, t2
    beqz t1, 1b 

    #Enable PLL
    lw t1, 0(t0)
    li t2, RCU_PLLEN
    or t1, t1, t2
    sw t1, 0(t0)
    li t2, RCU_PLLSTB
    1:
    # Wait for PLL to be stable
    lw t1, 0(t0)
    and t1, t1, t2
    beqz t1, 1b

    # Set PLL as SYSCLK
    la t0, RCU_CFG0
    lw t1, 0(t0)
    li t2, RCU_SCS
    not t2, t2
    and t1, t1, t2
    li t2, RCU_SCS_PLL
    or t1, t1, t2
    sw t1, 0(t0)
    li t2, RCU_SCSS
    1:
    # Wait for PLL to be selected as SYSCLK
    lw t1, 0(t0)
    and t1, t1, t2
    beqz t1, 1b

    # Update SysClkFreq & TimerFreq with new SYSCLK value
    la t0, SysClkFreq
    li t1, 0x66FF300
    sw t1, 0(t0)

    la t0, TimerFreq
    srli t1, t1, 2
    sw t1, 0(t0)

    ret
    .cfi_endproc
    
.section .data

# 8MHz on startup
.global SysClkFreq
SysClkFreq: .word 0x7A1200
.global TimerFreq
TimerFreq: .word 0x1E8480
