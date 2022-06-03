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
 * @brief SPI library.
 *
 * Provides SPI helper function like configuring SPI and sending
 * data and commands over SPI.
 *
 */
#ifndef _SPI_H_
#define _SPI_H_

#include <stdint.h>
#include "pulpino.h"
#include "pulpino_typedef.h"

#if defined( __GNUC__)
#define PACKED __attribute__ ((packed))
#else
#error "Unsupported compiler?"
#endif

typedef PACKED struct SPI_APB {        
	uint32_t SPI_REG_STATUS; //0x00
	uint32_t SPI_REG_CLKDIV; //0x04 
        uint32_t SPI_REG_SPICMD; //0x08  
        uint32_t SPI_REG_SPIADR; //0x0C   
        uint32_t SPI_REG_SPILEN; //0x10     
	uint32_t SPI_REG_SPIDUM; //0x14    
	uint32_t SPI_REG_TXFIFO; //0x18    
	uint32_t SPI_REG_RXFIFO; //0x1C   
	uint32_t SPI_REG_INTCFG; //0x20    
	uint32_t SPI_REG_INTSTA; //0x24   
        
} SPI_APB_Type ;

volatile struct SPI_APB *spi_0;
volatile struct SPI_APB *spi_1;


//typedef enum {false, true} bool;

#define SPI_QPI    1
#define SPI_NO_QPI 0

#define SPI_CMD_RD    0
#define SPI_CMD_WR    1
#define SPI_CMD_QRD   2
#define SPI_CMD_QWR   3
#define SPI_CMD_SWRST 4

#define SPI_CSN0 0
#define SPI_CSN1 1
#define SPI_CSN2 2
#define SPI_CSN3 3

/*
#define SPI_REG_STATUS                ( SPI_BASE_ADDR + 0x00 )
#define SPI_REG_CLKDIV                ( SPI_BASE_ADDR + 0x04 )
#define SPI_REG_SPICMD                ( SPI_BASE_ADDR + 0x08 )
#define SPI_REG_SPIADR                ( SPI_BASE_ADDR + 0x0C )
#define SPI_REG_SPILEN                ( SPI_BASE_ADDR + 0x10 )
#define SPI_REG_SPIDUM                ( SPI_BASE_ADDR + 0x14 )
#define SPI_REG_TXFIFO                ( SPI_BASE_ADDR + 0x18 )
#define SPI_REG_RXFIFO                ( SPI_BASE_ADDR + 0x20 )
#define SPI_REG_INTCFG                ( SPI_BASE_ADDR + 0x24 )
#define SPI_REG_INTSTA                ( SPI_BASE_ADDR + 0x28 )
*/

/*
#define SPI_STATUS			REG(SPI_REG_STATUS)              
#define SPI_CLKDIV 			REG(SPI_REG_CLKDIV)              
#define SPI_SPICMD 			REG(SPI_REG_SPICMD)              
#define SPI_SPIADR			REG(SPI_REG_SPIADR)               
#define SPI_SPILEN			REG(SPI_REG_SPILEN)               
#define SPI_SPIDUM                	REG(SPI_REG_SPIDUM)	
#define SPI_TXFIFO			REG(SPI_REG_TXFIFO)          
#define SPI_RXFIFO			REG(SPI_REG_RXFIFO)           
#define SPI_INTCFG   			REG(SPI_REG_INTCFG)            
#define SPI_INTSTA			REG(SPI_REG_INTSTA) 
*/      

//In future numbers of pins will be changed 

#define PIN_SSPI0_SIO0 4
#define PIN_SSPI0_SIO1 5
#define PIN_SSPI0_SIO2 6
#define PIN_SSPI0_SIO3 7
#define PIN_SSPI0_CSN  3

#define PIN_MSPI0_SIO0 15
#define PIN_MSPI0_SIO1 14
#define PIN_MSPI0_SIO2 13
#define PIN_MSPI0_SIO3 12
#define PIN_MSPI0_CSN0 16
#define PIN_MSPI0_CSN1 11
#define PIN_MSPI0_CSN2 0
#define PIN_MSPI0_CSN3 1

#define PIN_SSPI1_SIO0 17
#define PIN_SSPI1_SIO1 18
#define PIN_SSPI1_SIO2 19
#define PIN_SSPI1_SIO3 20
#define PIN_SSPI1_CSN  21

#define PIN_MSPI1_SIO0 22
#define PIN_MSPI1_SIO1 23
#define PIN_MSPI1_SIO2 24
#define PIN_MSPI1_SIO3 25
#define PIN_MSPI1_CSN0 26
#define PIN_MSPI1_CSN1 27
#define PIN_MSPI1_CSN2 28
#define PIN_MSPI1_CSN3 29

#define FUNC_SPI  0

void init_spi_0(void); //initialization with base address controller of spi interface 0

void init_spi_1(void); //initialization with base address controller of spi interface 1

void spi_setup_slave();//!

void spi0_setup_master(int numcs);

void spi1_setup_master(int numcs);

void spi_send_data_noaddr(int cmd, char *data, int datalen, int useQpi);

void spi_setup_cmd_addr(int cmd, int cmdlen, int addr, int addrlen, SPI_APB_Type* spi);

void spi_set_datalen(int datalen, SPI_APB_Type* spi);

void spi_setup_dummy(int dummy_rd, int dummy_wr, SPI_APB_Type* spi);

void spi_start_transaction(int trans_type, int csnum, SPI_APB_Type* spi);

void spi_write_fifo(int* data, int datalen, SPI_APB_Type* spi);

void spi_read_fifo(int* data, int datalen, SPI_APB_Type* spi);

int spi_get_status(SPI_APB_Type* spi);

void spi_set_irq_borders(int border_tx, int border_rx, SPI_APB_Type* spi);

void spi_set_irq_counters(int counter_tx, int counter_rx, SPI_APB_Type* spi);

void spi_set_clk_div(int clk_div_value, SPI_APB_Type* spi);

void spi_set_intsta(SPI_APB_Type* spi);

void spi_set_irq_counters_disable(SPI_APB_Type* spi);

void spi_set_irq_disable(SPI_APB_Type* spi);

void spi_set_irq_tx_en(SPI_APB_Type* spi);

void spi_set_irq_rx_en(SPI_APB_Type* spi);

void spi_set_irq_tx_disable(SPI_APB_Type* spi);

void spi_set_irq_rx_disable(SPI_APB_Type* spi);  

int spi_get_irq_config(SPI_APB_Type* spi);

#endif // _SPI_H_
