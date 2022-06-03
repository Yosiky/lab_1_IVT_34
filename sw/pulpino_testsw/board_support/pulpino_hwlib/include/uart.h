// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

/**
 * @file
 * @brief 16750 UART library.
 *
 * Provides UART helper function like setting
 * control registers and reading/writing over
 * the serial interface.
 *
 */
#ifndef _UART_H
#define _UART_H

#include <stdint.h>
#include "pulpino.h"
#include "pulpino_typedef.h"
//#include "pulpino.h"

#if defined( __GNUC__)
#define PACKED __attribute__ ((packed))
#else
#error "Unsupported compiler?"
#endif

typedef PACKED struct UART_APB {
        // Receiver Buffer Register (Read Only)
        // Divisor Latch (LS)
        // Transmitter Holding Register (Write Only)
	uint32_t UART_RBR_DLL_THR;//000(00) (побайтовая адресация)
        // Divisor Latch (MS)
        // Interrupt Enable Register
	uint32_t UART_DLM_IER;    //001(00)
        // Interrupt Identity Register (Read Only)
        // FIFO Control Register (Write Only)
	uint32_t UART_IIR_FCR;    //010(00)
        // Line Control Register
	uint32_t UART_LCR;        //011(00)
        // MODEM Control Register
	uint32_t UART_MCR;        //100(00)
        // Line Status Register
	uint32_t UART_LSR;        //101(00)
        // MODEM Status Register
	uint32_t UART_MSR;        //110(00)
        // Scratch Register
	uint32_t UART_SCR;        //111(00)
} UART_APB_Type ;


volatile struct UART_APB *uart_0;
volatile struct UART_APB *uart_1;


/*
#define UART_REG_RBR 0x00 // Receiver Buffer Register (Read Only)
#define UART_REG_DLL 0x00 // Divisor Latch (LS)
#define UART_REG_THR 0x00 // Transmitter Holding Register (Write Only)
#define UART_REG_DLM 0x04 // Divisor Latch (MS)
#define UART_REG_IER 0x04 // Interrupt Enable Register
#define UART_REG_IIR 0x08 // Interrupt Identity Register (Read Only)
#define UART_REG_FCR 0x08 // FIFO Control Register (Write Only)
#define UART_REG_LCR 0x0C // Line Control Register
#define UART_REG_MCR 0x10 // MODEM Control Register
#define UART_REG_LSR 0x14 // Line Status Register
#define UART_REG_MSR 0x18 // MODEM Status Register
#define UART_REG_SCR 0x1C // Scratch Register
*/

#define RBR_UART REGP_8(UART_REG_RBR)
#define DLL_UART REGP_8(UART_REG_DLL)
#define THR_UART REGP_8(UART_REG_THR)
#define DLM_UART REGP_8(UART_REG_DLM)
#define IER_UART REGP_8(UART_REG_IER)
#define IIR_UART REGP_8(UART_REG_IIR)
#define FCR_UART REGP_8(UART_REG_FCR)
#define LCR_UART REGP_8(UART_REG_LCR)
#define MCR_UART REGP_8(UART_REG_MCR)
#define LSR_UART REGP_8(UART_REG_LSR)
#define MSR_UART REGP_8(UART_REG_MSR)
#define SCR_UART REGP_8(UART_REG_SCR)

#define DLAB 1<<7 	//DLAB bit in LCR reg
#define ERBFI 1 	//ERBFI bit in IER reg
#define ETBEI 1<<1 	//ETBEI bit in IER reg
#define PE 1<<2 	//PE bit in LSR reg
#define THRE 1<<5 	//THRE bit in LSR reg
#define DR 1	 	//DR bit in LSR reg

#define RLS_IRQ_UART 0x3
#define CTI_IRQ_UART 0x6
#define RDA_IRQ_UART 0x2
#define THR_IRQ_UART 0x1



#define UART_FIFO_DEPTH 64

//UART_FIFO_DEPTH but to be compatible with Arduino_libs and also if in future designs it differed
#define SERIAL_RX_BUFFER_SIZE UART_FIFO_DEPTH
#define SERIAL_TX_BUFFER_SIZE UART_FIFO_DEPTH

//typedef enum {false, true} bool;

void uart_init_0(void); //initialization with base address controller of uart interface 0

void uart_init_1(void); //initialization with base address controller of uart interface 1

void uart_set_cfg(int parity, uint16_t clk_counter, UART_APB_Type* uart);

void uart_send(const char* str, unsigned int len, UART_APB_Type* uart);

void uart_sendchar(const char c, UART_APB_Type* uart);

char uart_getchar(UART_APB_Type* uart);

void uart_wait_tx_done(UART_APB_Type* uart);

void uart_set_line_cfg(uint8_t parity_cnt, uint8_t parity_en, uint8_t even_parity, uint8_t stop_number, uint8_t bit_number, UART_APB_Type* uart); //func to set up line control settings (LCR)

void uart_set_counter(uint16_t clk_counter, UART_APB_Type* uart); //func to set up clk counter (DLL, DLM) 

void uart_set_fifo_en(bool fifo64_en, uint8_t trig_code, UART_APB_Type* uart); //func to set up fifo settings (FCR)

void uart_set_rda_irq_en(UART_APB_Type* uart); //func to enable interrupt rda cti  (IER)

void uart_set_rda_irq_disable(UART_APB_Type* uart); //func to disable interrupt rda cti (IER)

void uart_set_thi_irq_en(UART_APB_Type* uart); //func to enable interrupt thi  (IER)

void uart_set_thi_irq_disable(UART_APB_Type* uart); //func to disable interrupt thi (IER)

void uart_set_rls_irq_en(UART_APB_Type* uart); //func to enable interrupt rls  (IER)

void uart_set_rls_irq_disable(UART_APB_Type* uart); //func to disable interrupt rls (IER)

uint8_t uart_get_irq_id(UART_APB_Type* uart); //(IIR)

uint8_t uart_get_rls_irq_cause(UART_APB_Type* uart); //(LSR)

void uart_reset_rxfifo(UART_APB_Type* uart); //(FCR)

void uart_reset_txfifo(UART_APB_Type* uart); //(FCR)
#endif
