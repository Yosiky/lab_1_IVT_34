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
	
reg [35:0][31:0]	mem;
reg	pready;
reg	pslverr;

	kuznechik_cipher(
	.clk_i(pclk_i),      // Тактовый сигнал
	.resetn_i(presetn_i && mem[0]),   // Синхронный сигнал сброса с активным уровнем LOW
	.request_i(mem[0]),  // Сигнал запроса на начало шифрования
	.ack_i(mem[0]),      // Сигнал подтверждения приема зашифрованных данных
	.data_i(mem[19:4]),     // Шифруемые данные
	.busy_o(mem[3]),
	valid_o(mem[2]),    // Сигнал готовности зашифрованных данных
	data_o(mem[35:20])      // Зашифрованные данные
	);

	always @(posedge pclk_i)
	begin
		pready <= psel_i;
	end

	always @(posedge pclk_i)
	begin
		if (pwrite_i)
		begin
			if (!((20 <= paddr_i  && paddr_i <= 35) ||
				(paddr_i == 3) || (paddr_i == 2)))
			begin
				for (integer i = 0; i < 4; ++i)
					if (pstrb_i[i])
						mem[paddr_i][8 * i + 7 : 8 * i] <= pwdata_i[i];

				//if (pstrb_i[0])
				//	mem[paddr_i][7:0] <= pwdata_i[0];
				//if (pstrb_i[1])
				//	mem[paddr_i][15:8] <= pwdata_i[1];
				//if (pstrb_i[2])
				//	mem[paddr_i][23:16] <= pwdata_i[2];
				//if (pstrb_i[3])
				//	mem[paddr_i][31:24] <= pwdata_i[3];
			end
		end
	end

	always @(posedge pclk_i)
	begin
		
		if (pwrite_i && ((20 <= paddr_i  && paddr_i <= 35) ||
			(paddr_i == 3) || (paddr_i == 2)))
			pslverr <= 1;
		else
			pslverr <= 0;
	end

assign pslverr_o = pslverr;
assign pready_o = pready;


endmodule
