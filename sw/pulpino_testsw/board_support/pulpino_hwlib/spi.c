// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
#include <spi.h>
#include <gpio.h>
#include "pulpino.h"

void init_spi_0(void){
  spi_0 = (volatile struct SPI_APB *)SPI_BASE_ADDR;
}

void init_spi_1(void){
  //spi_1 = (volatile struct SPI_APB *)SPI1_BASE_ADDR;
}

void spi_setup_slave() {
    set_pin_function(PIN_SSPI0_SIO0, FUNC_SPI);
    set_pin_function(PIN_SSPI0_SIO1, FUNC_SPI);
    set_pin_function(PIN_SSPI0_SIO2, FUNC_SPI);
    set_pin_function(PIN_SSPI0_SIO3, FUNC_SPI);
    set_pin_function(PIN_SSPI0_CSN, FUNC_SPI);
}

void spi0_setup_master(int numcs) {
    set_pin_function(PIN_MSPI0_SIO0, FUNC_SPI);
    set_pin_function(PIN_MSPI0_SIO1, FUNC_SPI);
    set_pin_function(PIN_MSPI0_SIO2, FUNC_SPI);
    set_pin_function(PIN_MSPI0_SIO3, FUNC_SPI);
    if (numcs > 0)
        set_pin_function(PIN_MSPI0_CSN0, FUNC_SPI);
    if (numcs > 1)
        set_pin_function(PIN_MSPI0_CSN1, FUNC_SPI);
    if (numcs > 2)
        set_pin_function(PIN_MSPI0_CSN2, FUNC_SPI);
    if (numcs > 3)
        set_pin_function(PIN_MSPI0_CSN3, FUNC_SPI);
}

void spi1_setup_master(int numcs) {
    set_pin_function(PIN_MSPI1_SIO1, FUNC_SPI);
    set_pin_function(PIN_MSPI1_SIO1, FUNC_SPI);
    set_pin_function(PIN_MSPI1_SIO2, FUNC_SPI);
    set_pin_function(PIN_MSPI1_SIO3, FUNC_SPI);
    if (numcs > 0)
        set_pin_function(PIN_MSPI1_CSN0, FUNC_SPI);
    if (numcs > 1)
        set_pin_function(PIN_MSPI1_CSN1, FUNC_SPI);
    if (numcs > 2)
        set_pin_function(PIN_MSPI1_CSN2, FUNC_SPI);
    if (numcs > 3)
        set_pin_function(PIN_MSPI1_CSN3, FUNC_SPI);
}

void spi_send_data_noaddr(int cmd, char *data, int datalen, int useQpi);

void spi_setup_cmd_addr(int cmd, int cmdlen, int addr, int addrlen, SPI_APB_Type* spi) {
    int cmd_reg;
    cmd_reg = cmd << (32 - cmdlen);
    spi->SPI_REG_SPICMD = cmd_reg;
    spi->SPI_REG_SPICMD = addr;
    spi->SPI_REG_SPICMD = (cmdlen & 0x3F) | ((addrlen << 8) & 0x3F00);
}

void spi_setup_dummy(int dummy_rd, int dummy_wr, SPI_APB_Type* spi) {
    spi->SPI_REG_SPIDUM = ((dummy_wr << 16) & 0xFFFF0000) | (dummy_rd & 0xFFFF);
}

void spi_set_datalen(int datalen, SPI_APB_Type* spi) {
    volatile int old_len;
    old_len = spi->SPI_REG_SPILEN;
    old_len = ((datalen << 16) & 0xFFFF0000) | (old_len & 0xFFFF);
    spi->SPI_REG_SPILEN = old_len;
}

void spi_start_transaction(int trans_type, int csnum, SPI_APB_Type* spi) {
    spi->SPI_REG_STATUS = ((1 << (csnum + 8)) & 0xF00) | ((1 << trans_type) & 0xFF);
}

int spi_get_status(SPI_APB_Type* spi) {
    volatile int status;
    status = spi->SPI_REG_STATUS;
    return status;
}

void spi_write_fifo(int* data, int datalen, SPI_APB_Type* spi) {
    volatile int num_words, i;

    num_words = (datalen >> 5) & 0x7FF;

    if ( (datalen & 0x1F) != 0)
        num_words++;

    for (i = 0; i < num_words; i++) {
        while ((((spi->SPI_REG_STATUS) >> 24) & 0xFF) >= 8);
        spi->SPI_REG_TXFIFO = data[i];
    }
}

void spi_read_fifo(int* data, int datalen, SPI_APB_Type* spi) {
    volatile int num_words, i;

    num_words = (datalen >> 5) & 0x7FF;

    if ( (datalen & 0x1F) != 0)
        num_words++;

    for (i = 0; i < num_words; i++) {
        while ((((spi->SPI_REG_STATUS) >> 16) & 0xFF) == 0);
        data[i] = spi->SPI_REG_RXFIFO;
    }
}

void spi_set_irq_borders(int border_tx, int border_rx, SPI_APB_Type* spi) { //LOG_BUFFER_DEPTH = 3; BUFFER_DEPTH   = 10.
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    //form new value
    old_intcfg = ((1 << 31) & 0x80000000) | (border_tx & 0x0000000F) | ((border_rx << 8) & 0x00000F00) | (old_intcfg & 0x7FFFF0F0); 
    spi->SPI_REG_INTCFG = old_intcfg;//write new value
}

void spi_set_irq_counters(int counter_tx, int counter_rx, SPI_APB_Type* spi) { //LOG_BUFFER_DEPTH = 3; BUFFER_DEPTH   = 10.
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    //form new value
    old_intcfg = ((1 << 30) & 0x40000000) | (counter_tx & 0x000F0000) | ((counter_rx << 8) & 0x0F000000) | (old_intcfg & 0xB0F0FFFF); 
    spi->SPI_REG_INTCFG = old_intcfg;//write new value
}

void spi_set_intsta(SPI_APB_Type* spi){
    spi->SPI_REG_INTSTA = 0x0;
}

void spi_set_clk_div(int clk_div_value, SPI_APB_Type* spi){
    volatile int old_clkdiv;
    old_clkdiv = spi->SPI_REG_CLKDIV; //read older value
    old_clkdiv = (old_clkdiv & 0xFFFFFF00) | (clk_div_value & 0x000000FF); //form new value
    spi->SPI_REG_CLKDIV = old_clkdiv;//write new value
}

void spi_set_irq_counters_disable(SPI_APB_Type* spi){
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    old_intcfg = ((0 << 30) & 0x40000000) | (old_intcfg & 0xBFFFFFFF);
}

void spi_set_irq_disable(SPI_APB_Type* spi){
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    old_intcfg = ((0 << 31) & 0x80000000) | (old_intcfg & 0x7FFFFFFF);
}

void spi_set_irq_tx_en(SPI_APB_Type* spi){
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    old_intcfg = ((1 << 28) & 0x10000000) | (old_intcfg & 0xEFFFFFFF);
}

void spi_set_irq_rx_en(SPI_APB_Type* spi){
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    old_intcfg = ((1 << 29) & 0x20000000) | (old_intcfg & 0xDFFFFFFF);
}

void spi_set_irq_tx_disable(SPI_APB_Type* spi){
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    old_intcfg = ((0 << 28) & 0x10000000) | (old_intcfg & 0xEFFFFFFF);
}

void spi_set_irq_rx_disable(SPI_APB_Type* spi){
    volatile int old_intcfg;
    old_intcfg = spi->SPI_REG_INTCFG; //read older value
    old_intcfg = ((1 << 29) & 0x20000000) | (old_intcfg & 0xDFFFFFFF);
}

int spi_get_irq_config(SPI_APB_Type* spi){
    volatile int irq_config;
    irq_config = spi->SPI_REG_INTCFG;
    return irq_config;
}

