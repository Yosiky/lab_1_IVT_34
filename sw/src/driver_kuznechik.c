#include "../headers/kuznechik_dr.h"

t_KUZNECHIK *kuznechik_init(void)
{
    static t_KUZNECHIK  kuz;

    kuz.rst = (uint8_t *)KUZNECHIK_RST;
    kuz.req = (uint8_t *)KUZNECHIK_REQ;
    kuz.ack = (uint8_t *)KUZNECHIK_ACK;
    kuz.valid = (uint8_t *)KUZNECHIK_VALID;
    kuz.busy = (uint8_t *)KUZNECHIK_BUSY;
    kuz.data_in = (uint8_t *)KUZNECHIK_DATA_IN;
    kuz.data_out = (uint8_t *)KUZNECHIK_DATA_OUT;
    return (&kuz);
}

void    kuznechik_set_rst(uint8_t data)
{
    static uint8_t  *rst = (uint8_t *)KUZNECHIK_RST;

    *rst = data;
}

void    kuznechik_set_ack(uint8_t data)
{
    static uint8_t  *ack = (uint8_t *)KUZNECHIK_ACK;

    *ack = data;
}

void    kuznechik_set_req(uint8_t data)
{
    static uint8_t  *req = (uint8_t *)KUZNECHIK_REQ;

    *req = data;
}

void    kuznechik_set_data_in(uint8_t *data)
{
    static uint8_t  *ack = (uint8_t *)KUZNECHIK_DATA_IN;
    uint64_t        *copy = (uint64_t *)data;

    *((uint64_t *)ack) = copy[0];
    *((uint64_t *)ack + 1) = copy[1];
}

uint8_t *kuznechik_get_data_out(void)
{
    static uint8_t  *data = (uint8_t *)KUZNECHIK_DATA_OUT;

    return (data);
}

uint8_t kuznechik_get_busy(void)
{
    static uint8_t  *busy = (uint8_t *)KUZNECHIK_BUSY;

    return (*busy);
}

uint8_t kuznechik_get_valid(void)
{
    static uint8_t  *valid = (uint8_t *)KUZNECHIK_VALID;

    return (*valid);
}
