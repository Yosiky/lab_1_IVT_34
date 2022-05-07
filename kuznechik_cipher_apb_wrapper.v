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
			for (integer i = 0; i < 16; i = i + 1)
				mem[20 + i] <= d_o[i * 8 +: 8];
		end
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
