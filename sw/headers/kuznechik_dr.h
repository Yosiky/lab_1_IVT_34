#ifndef KUZNECHIK_DR_H
# define KUZNECHIK_DR_H

# include "../headers/pulpino.h"
# include <stdint.h>

# define KUZNECHIK_RST      (KUZNECHIK_ADDR + 0x0)
# define KUZNECHIK_REQ      (KUZNECHIK_ADDR + 0x1)
# define KUZNECHIK_ACK      (KUZNECHIK_ADDR + 0x1)
# define KUZNECHIK_VALID    (KUZNECHIK_ADDR + 0x2)
# define KUZNECHIK_BUSY     (KUZNECHIK_ADDR + 0x3)
# define KUZNECHIK_DATA_IN  (KUZNECHIK_ADDR + 0x4)
# define KUZNECHIK_DATA_OUT (KUZNECHIK_ADDR + 0x14)

typedef __attribute__((packed))struct s_KUZNECHIK
{
    uint8_t *rst;
    uint8_t *req;
    uint8_t *ack;
    uint8_t *valid;
    uint8_t *busy;
    uint8_t *data_in;
    uint8_t *data_out;
} t_KUZNECHIK;



#endif
