module kuznechik_cipher_apb_wrapper(
		input				pclk_i,
		input				presetn_i,
		input	[31:0]		paddr_i,
		input				psel_i,
		input				penable_i,
		input				pwrite_i,
		input	[3:0] [7:0]	pwdata_i,
		input	[3:0]		pstrb_i,
		output				pready_o,
		output	[31:0]		prdata_o,
		output				pslverr_o);
	
reg [7:0]	mem[35:0];
reg	pready;

wire	resetn;
wire	req_ack;
wire	busy;
wire	valid;
wire	[127:0]	d_i;
wire	[127:0]	d_o;

	kuznechik_cipher kuznechik(
	.clk_i(pclk_i),      // Тактовый сигнал
	.resetn_i(resetn),   // Синхронный сигнал сброса с активным уровнем LOW
	.request_i(req_ack),  // Сигнал запроса на начало шифрования
	.ack_i(req_ack),      // Сигнал подтверждения приема зашифрованных данных
	.data_i(d_i),     // Шифруемые данные
	.busy_o(busy),
	.valid_o(valid),    // Сигнал готовности зашифрованных данных
	.data_o(d_o));

	always @(posedge pclk_i)
	begin
		pready <= penable_i;
	end

	always @(posedge pclk_i)
	begin
		if (pwrite_i)
		begin
			if (!((20 <= paddr_i) ||
				(paddr_i == 3) || (paddr_i == 2)))
			begin
				for (integer i = 0; i < 4; i = i + 1)
					if (pstrb_i[i])
						mem[paddr_i + i] <= pwdata_i[i];
			end
		end
	end

	always @(posedge pclk_i)
	begin
		if (valid)
		begin
            mem[35] <= d_o[127:120];
            mem[34] <= d_o[119:112];
            mem[33] <= d_o[111:104];
            mem[32] <= d_o[103:96];
            mem[31] <= d_o[95:88];
            mem[30] <= d_o[87:80];
            mem[29] <= d_o[79:72];
            mem[28] <= d_o[71:64];
            mem[27] <= d_o[63:56];
            mem[26] <= d_o[55:48];
            mem[25] <= d_o[47:40];
            mem[24] <= d_o[39:32];
            mem[23] <= d_o[31:24];
            mem[22] <= d_o[23:16];
            mem[21] <= d_o[15:8];
            mem[20] <= d_o[7:0];
        end
		//for (integer i = 0; i < 16; i = i + 1)
		//	mem[20 + i] <= d_o[(i + 1) * 8 - 1 -: 7];
		mem[3][0] <= busy;	
		mem[2] <= valid;
	end

assign	pslverr_o = pwrite_i && ((20 <= paddr_i) || (paddr_i == 0 && pstrb_i & 'hc));
assign	pready_o = pready;	
assign	resetn = mem[0] && presetn_i;
assign	req_ack = mem[1][0];
assign	d_i = {mem[19], mem[18], mem[17], mem[16],
			mem[15], mem[14], mem[13], mem[12],
			mem[11], mem[10], mem[9], mem[8], 
			mem[7], mem[6], mem[5], mem[4]};
assign	prdata_o = {mem[paddr_i + 3], mem[paddr_i + 2], mem[paddr_i + 1], mem[paddr_i]};

endmodule
