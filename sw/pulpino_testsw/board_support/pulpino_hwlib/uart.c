// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include "uart.h"
#include "utils.h"
#include "pulpino.h"
//#include "gecko_typedef.h"
/**
 * Setup UART. The UART defaults to 8 bit character mode with 1 stop bit.
 *
 * parity       Enable/disable parity mode
 * clk_counter  Clock counter value that is used to derive the UART clock.
 *              It has to be in the range of 1..2^16.
 *              There is a prescaler in place that already divides the SoC
 *              clock by 16.  Since this is a counter, a value of 1 means that
 *              the SoC clock divided by 16*2 = 32 is used. A value of 31 would mean
 *              that we use the SoC clock divided by 16*32 = 512.
 */



void uart_init_0(void){
  //uart_0 = (volatile struct UART_APB *)UART0_BASE_ADDR;
  uart_0 = (volatile struct UART_APB *)UART_BASE_ADDR;
}

void uart_init_1(void){
  //uart_1 = (volatile struct UART_APB *)UART1_BASE_ADDR;
}

void uart_set_cfg(int parity, uint16_t clk_counter, UART_APB_Type* uart) {
  unsigned int i;
  CGREG |= (1 << CGUART); // don't clock gate UART
  uart->UART_LCR         = 0x83; //sets 8N1 and set DLAB to 1
  uart->UART_DLM_IER     = (clk_counter >> 8) & 0xFF;
  uart->UART_RBR_DLL_THR = clk_counter        & 0xFF; 
  uart->UART_IIR_FCR     = 0xA7; //enables 16byte FIFO and clear FIFOs
  uart->UART_LCR         = 0x03; //sets 8N1 and set DLAB to 0

  uart->UART_DLM_IER     = (uart->UART_DLM_IER & 0xF0) | 0x02; // set IER (interrupt enable register) on UART
}

void uart_send(const char* str, unsigned int len, UART_APB_Type* uart) { //len is number of bits 
  unsigned int i;
  while(len > 0) {
    // process this in batches of 16 bytes to actually use the FIFO in the UART

    // wait until there is space in the fifo
    while( ( (uart->UART_LSR) & 0x20) == 0 );

    for(i = 0; (i < UART_FIFO_DEPTH) && (len > 0); i++) {
      // load FIFO
      uart->UART_RBR_DLL_THR = *str++;
      len--;
    }
  }
}

char uart_getchar(UART_APB_Type* uart) {
  while ( ( (uart->UART_LSR) & 0x1 ) != 0x1 ); //whether any data is located in fifo-receiver or not
  return (uart->UART_RBR_DLL_THR);
}

void uart_sendchar(const char c, UART_APB_Type* uart) {
  // wait until there is space in the fifo
  while( ( (uart->UART_LSR) & 0x20) == 0 );
  // load FIFO
  uart->UART_RBR_DLL_THR = c;
}

void uart_wait_tx_done(UART_APB_Type* uart) {
  // wait until there is space in the fifo
  while( ( (uart->UART_LSR) & 0x40) == 0);
}

void uart_set_line_cfg(uint8_t parity_cnt, uint8_t parity_en, uint8_t even_parity, uint8_t stop_number, uint8_t bit_number, UART_APB_Type* uart) { 
  // stop_number - amount of stop bits: one or two
  // bit_number - amount of data bits: five, six, seven, eight
  // parity_en - whether parity bit will (1) be or not (0)
  // parity_cnt - whether parity bit will be counted every time (1) or will be default (0)
  // even_parity - whether parity bit will be even (1) or odd (0)
  CGREG |= (1 << CGUART); // don't clock gate UART

  volatile int old_value;
  old_value = uart->UART_LCR; //read old value of LCR to save old needed fields
  old_value = ((bit_number - 0x05) & 0x03) | (((stop_number - 0x01) << 2)& 0x04) | ((parity_en << 3) & 0x08)\
   | ((!parity_cnt << 5) & 0x20) | ((even_parity << 4) & 0x10) | (old_value & 0xC0);
  // fields WLS, STB, PEN, SP, EPS
  uart->UART_LCR = old_value; //write new value
}

void uart_set_counter(uint16_t clk_counter, UART_APB_Type* uart) {
  volatile uint8_t old_value;
  old_value = uart->UART_LCR; //read old value of LCR to save old needed fields
  old_value = 0x80 | (old_value & 0x7F); //field DLAB -> 1
  uart->UART_LCR = old_value; //write new value

  uart->UART_DLM_IER     = (clk_counter >> 8) & 0xFF; 
  uart->UART_RBR_DLL_THR =  clk_counter       & 0xFF;

  old_value      = old_value & 0x7F; //field DLAB -> 0
  uart->UART_LCR = old_value; //write new value
}

void uart_set_fifo_en(bool fifo64_en, uint8_t trig_code, UART_APB_Type* uart) {
  // trig_code - for fifo64 00 - 1 \
                            01 - 4 \
                            10 - 8 \
                            11 - 14\
                 for fifo16 00 - 1 \
                            01 - 16\
                            10 - 32\
                            11 - 56
  volatile uint8_t old_lcr_value;
  volatile uint8_t old_fcr_value;

  old_lcr_value  = uart->UART_LCR; //read old value of LCR to save old needed fields
  old_lcr_value  = 0x80 | (old_lcr_value & 0x7F); //field DLAB -> 1
  uart->UART_LCR = old_lcr_value; //write new value

  old_fcr_value = 0x00; //read old value of FCR to save old needed fields
  if (fifo64_en) old_fcr_value = (0x27) | ((trig_code << 6) & 0xC0) | (old_fcr_value & 0x18);
  else old_fcr_value = (0x07) | ((trig_code << 6) & 0xC0) | (old_fcr_value & 0x18);
  uart->UART_IIR_FCR = old_fcr_value;

  old_lcr_value = old_lcr_value & 0x7F; //field DLAB -> 0
  uart->UART_LCR = old_lcr_value; //write new value
}

void uart_set_rda_irq_en(UART_APB_Type* uart) { // rda+cti
  volatile uint8_t old_value;
  old_value = uart->UART_DLM_IER; //read old value of IER to save old needed fields
  old_value = 0x01 | old_value & 0xFE; 
  uart->UART_DLM_IER = old_value; //write new value
}

void uart_set_rda_irq_disable(UART_APB_Type* uart) { // rda+cti
  volatile uint8_t old_value;
  old_value = uart->UART_DLM_IER; //read old value of IER to save old needed fields
  old_value = old_value & 0xFE; 
  uart->UART_DLM_IER = old_value; //write new value
}

void uart_set_thi_irq_en(UART_APB_Type* uart) { 
  volatile uint8_t old_value;
  old_value = uart->UART_DLM_IER; //read old value of IER to save old needed fields
  old_value = 0x02 | old_value & 0xFD; 
  uart->UART_DLM_IER = old_value; //write new value
}

void uart_set_thi_irq_disable(UART_APB_Type* uart) { ;
  volatile uint8_t old_value;
  old_value = uart->UART_DLM_IER; //read old value of IER to save old needed fields
  old_value = old_value & 0xFD; 
  uart->UART_DLM_IER = old_value; //write new value
}

void uart_set_rls_irq_en(UART_APB_Type* uart) { 
  volatile uint8_t old_value;
  old_value = uart->UART_DLM_IER; //read old value of IER to save old needed fields
  old_value = 0x04 | old_value & 0xFB; 
  uart->UART_DLM_IER = old_value; //write new value
}

void uart_set_rls_irq_disable(UART_APB_Type* uart) { 
  volatile uint8_t old_value;
  old_value = uart->UART_DLM_IER; //read old value of IER to save old needed fields
  old_value = old_value & 0xFB; 
  uart->UART_DLM_IER = old_value; //write new value
}

uint8_t uart_get_irq_id(UART_APB_Type* uart) {
  volatile uint8_t value = ( uart->UART_IIR_FCR ) & 0x0F; 
  return value;
}

uint8_t uart_get_rls_irq_cause(UART_APB_Type* uart) {
  volatile uint8_t value = (((uart->UART_LSR) & 0x1E) >> 1); 
  return value;
}

void uart_reset_rxfifo(UART_APB_Type* uart) { 
  volatile uint8_t old_value;
  old_value = uart->UART_IIR_FCR;
  old_value = old_value & 0xFD; 
  uart->UART_DLM_IER = old_value; //write new value
}

void uart_reset_txfifo(UART_APB_Type* uart){ 
  volatile uint8_t old_value;
  old_value = uart->UART_IIR_FCR;
  old_value = old_value & 0xFB; 
  uart->UART_DLM_IER = old_value; //write new value
}
