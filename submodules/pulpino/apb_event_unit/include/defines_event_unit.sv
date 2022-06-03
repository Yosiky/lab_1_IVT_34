///////////////////////////////////////////////
//  _____            _     _                 //
// |  __ \          (_)   | |                //
// | |__) |___  __ _ _ ___| |_ ___ _ __ ___  //
// |  _  // _ \/ _` | / __| __/ _ \ '__/ __| //
// | | \ \  __/ (_| | \__ \ ||  __/ |  \__ \ //
// |_|  \_\___|\__, |_|___/\__\___|_|  |___/ //
//              __/ |                        //
//             |___/                         //
///////////////////////////////////////////////

// total number of address space reserved for the apb_event_unit
localparam ADR_MAX_ADR			= 'd2; // number of bits needed to access all subunits

localparam IRQ					= 2'b00;
localparam EVENT					= 2'b01;
localparam SLEEP					= 2'b10;

// number of registers per (interrupt, event) service unit - 8 regs in total
localparam REGS_MAX_IDX			= 'd3; // number of bits needed to access all registers
localparam REGS_MAX_ADR			= 'd2;

localparam REG_ENABLE 		    = 2'b00;
localparam REG_PENDING      		= 2'b01;
localparam REG_SET_PENDING		= 2'b10;
localparam REG_CLEAR_PENDING		= 2'b11;

localparam REGS_SLEEP_MAX_IDX	= 'd1;

localparam REG_SLEEP_CTRL        = 2'b0;
localparam REG_SLEEP_STATUS		= 2'b1;

localparam SLEEP_ENABLE			= 1'b0;
localparam SLEEP_STATUS 			= 1'b0;
