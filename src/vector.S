.section .vector_table

.global _vector_table
.type _vector_table, @object
.option norvc
.balign 512 
_vector_table:
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    swi_isr            # Software Interrupt
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    timer_isr          # Timer Interrupt
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Memory Access Error
.word    default_isr        # Performance Monitor
.word    default_isr        # WWDGT Interrupt
.word    default_isr        # LVD from EXTI Interrupt
.word    default_isr        # Tamper Interrupt
.word    default_isr        # RTC Global Interrupt
.word    default_isr        # FMC Global Interrupt
.word    default_isr        # RCU Global Interrupt
.word    default_isr        # EXTI Line0 Interrupt
.word    default_isr        # EXTI Line1 Interrupt
.word    default_isr        # EXTI Line2 Interrupt
.word    default_isr        # EXTI Line3 Interrupt
.word    default_isr        # EXTI Line4 Interrupt
.word    default_isr        # DMA0 Channel0 Global Interrupt
.word    default_isr        # DMA0 Channel1 Global Interrupt
.word    default_isr        # DMA0 Channel2 Global Interrupt
.word    default_isr        # DMA0 Channel3 Global Interrupt
.word    default_isr        # DMA0 Channel4 Global Interrupt
.word    default_isr        # DMA0 Channel5 Global Interrupt
.word    default_isr        # DMA0 Channel6 Global Interrupt
.word    default_isr        # ADC0 and ADC1 Global Interrupt
.word    default_isr        # CAN0 TX Interrupt
.word    default_isr        # CAN0 RX0 Interrupt
.word    default_isr        # CAN0 RX1 Interrupt
.word    default_isr        # CAN0 EWMC Interrupt
.word    default_isr        # EXTI Line[9:5] Interrupt
.word    default_isr        # TIMER0 Break Interrupt
.word    default_isr        # TIMER0 Update Interrupt
.word    default_isr        # TIMER0 Trigger and Channel Communication Interrupt
.word    default_isr        # TIMER0 Channel Capture Compare Interrupt
.word    default_isr        # TIMER1 Global Interrupt
.word    default_isr        # TIMER2 Global Interrupt
.word    default_isr        # TIMER3 Global Interrupt
.word    default_isr        # I2C0 Event Interrupt 
.word    default_isr        # I2C0 Error Interrupt
.word    default_isr        # I2C1 Event Interrupt
.word    default_isr        # I2C1 Error Interrupt
.word    default_isr        # SPI0 Global Interrupt
.word    default_isr        # SPI1 Global Interrupt
.word    default_isr        # USART0 Global Interrupt
.word    default_isr        # USART1 Global Interrupt
.word    default_isr        # USART2 Global Interrupt
.word    default_isr        # EXTI Line[15:10] Interrupt
.word    default_isr        # RTC Alarm from EXTI Interrupt
.word    default_isr        # USBFS Wakeup from EXTI Interrupt
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # TIMER4 Global Interrupt
.word    default_isr        # SPI2 Global Interrupt
.word    default_isr        # UART3 Global Interrupt
.word    default_isr        # UART4 Global Interrupt
.word    default_isr        # TIMER5 Global Interrupt
.word    default_isr        # TIMER6 Global Interrupt
.word    default_isr        # DMA1 Channel0 Global Interrupt
.word    default_isr        # DMA1 Channel1 Global Interrupt
.word    default_isr        # DMA1 Channel2 Global Interrupt
.word    default_isr        # DMA1 Channel3 Global Interrupt
.word    default_isr        # DMA1 Channel4 Global Interrupt
.word    default_isr        # Reserved
.word    default_isr        # Reserved
.word    default_isr        # CAN1 TX Interrupt
.word    default_isr        # CAN1 RX0 Interrupt
.word    default_isr        # CAN1 RX1 Interrupt
.word    default_isr        # CAN1 EWMC Interrupt
.word    default_isr        # USBFS Global Interrupt

.balign 64
.global exception_handler
exception_handler:
    # FIXME Look at mcause, mtval, mepc?
    1:
    j 1b
    mret

.balign 4, 0
.global swi_isr
swi_isr:
    #FIXME Should be clearing MSIP
    mret

.balign 4, 0
.global timer_isr
timer_isr:
    addi sp, sp, -8
    sw a0, 0(sp)
    sw a1, 4(sp)

    # Set mtimecmp to a high number to clear systimer IP
    li a0, 0xFFFFFFFF
    la a1, 0xD1000000
    sw a0, 0x8(a1)
    sw a0, 0xC(a1)

    lw a1, 4(sp)
    lw a0, 0(sp)
    addi sp, sp, 8
    mret

.balign 4, 0
.global default_isr
default_isr:
    mret
