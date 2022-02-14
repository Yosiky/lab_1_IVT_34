
module kuznechik_cipher(
    input               clk_i,      // Тактовый сигнал
                        resetn_i,   // Синхронный сигнал сброса с активным уровнем LOW
                        request_i,  // Сигнал запроса на начало шифрования
                        ack_i,      // Сигнал подтверждения приема зашифрованных данных
                [127:0] data_i,     // Шифруемые данные

    output              busy_o,     // Сигнал, сообщающий о невозможности приёма
                                    // очередного запроса на шифрование, поскольку
                                    // модуль в процессе шифрования предыдущего
                                    // запроса
           reg          valid_o,    // Сигнал готовности зашифрованных данных
           reg  [127:0] data_o      // Зашифрованные данные
);

localparam IDLE         = 0;
localparam KEY_PHASE   = 1;
localparam S_PHASE     = 2;
localparam L_PHASE     = 3;
localparam FINISH       = 4;

reg [2:0]   state;
reg [7:0]   p;
reg [7:0]   k;
reg [127:0] data;
reg [7:0]   value;
reg         busy;

reg [127:0] key_mem [0:9];

reg [7:0] S_box_mem [0:255];

reg [7:0] L_mul_16_mem  [0:255];
reg [7:0] L_mul_32_mem  [0:255];
reg [7:0] L_mul_133_mem [0:255];
reg [7:0] L_mul_148_mem [0:255];
reg [7:0] L_mul_192_mem [0:255];
reg [7:0] L_mul_194_mem [0:255];
reg [7:0] L_mul_251_mem [0:255];

assign  busy_o = busy;

initial begin
    $readmemh("keys.mem",key_mem );
    $readmemh("S_box.mem",S_box_mem );

    $readmemh("L_16.mem", L_mul_16_mem );
    $readmemh("L_32.mem", L_mul_32_mem );
    $readmemh("L_133.mem",L_mul_133_mem);
    $readmemh("L_148.mem",L_mul_148_mem);
    $readmemh("L_192.mem",L_mul_192_mem);
    $readmemh("L_194.mem",L_mul_194_mem);
    $readmemh("L_251.mem",L_mul_251_mem);
    state <= IDLE;
    value <= 0;
    p <= 0;
    k <= 0;
    busy <= 0;
    valid_o <= 0;
end

always @(posedge clk_i)
begin
    if (!resetn_i)
    begin
        state <= IDLE;
        value <= 0;
        p <= 0;
        k <= 0;
        busy <= 0;
        valid_o <= 0;
    end
    else
    begin
        case (state)
            IDLE:
            begin
                if (request_i)
                begin
                    state <= KEY_PHASE;
                    value <= 0;
                    p <= 0;
                    k <= 0;
                    busy <= 1;
                    valid_o <= 0;
                    data <= data_i;
                end
            end
            KEY_PHASE:
            begin
                data = data ^ key_mem[p];
                p <= p + 1;
                state <= S_PHASE;
                if (p == 'd9)
                begin
                    state <= FINISH;
                    valid_o <= 1;
                    data_o <= data;
                end
            end
            S_PHASE:
            begin
                //$display("%x = %x", data[120 +: 8], data[127 : 120]);
                for (integer i = 0; i < 16; i = i + 1)
                    data[i * 8 +: 8] <= S_box_mem[data[i * 8 +: 8]];
                //for (integer i = 0; i < 16; i = i + 1)
                //    data[i * 8 +: 7] <= S_box_mem[data[i * 8 +: 7]];
                state <= L_PHASE;
                k <= 0;
            end
            L_PHASE:
            begin
                value = data[7: 0];
                for (integer i = 1; i < 16; i = i + 1)
                begin
                    if (i == 'd1 || i == 'd15)
                        value = value ^ L_mul_148_mem[data[i * 8 +: 8]];
                    else if (i == 'd2 || i == 'd14)
                        value = value ^ L_mul_32_mem[data[i * 8 +: 8]];
                    else if (i == 'd3 || i == 'd13)
                        value = value ^ L_mul_133_mem[data[i * 8 +: 8]];
                    else if (i == 'd4 || i == 'd12)
                        value = value ^ L_mul_16_mem[data[i * 8 +: 8]];
                    else if (i == 'd5 || i == 'd11)
                        value = value ^ L_mul_194_mem[data[i * 8 +: 8]];
                    else if (i == 'd6 || i == 'd10)
                        value = value ^ L_mul_192_mem[data[i * 8 +: 8]];
                    else if (i == 'd8)
                        value = value ^ L_mul_251_mem[data[i * 8 +: 8]];
                    else
                        value = value ^ data[i * 8 +: 8];
                end
                data <= {value, data[127 : 8]};
                k <= k + 1;
                if (k == 'd15)
                    state <= KEY_PHASE;
            end
            FINISH:
            begin
                if (ack_i == 1)
                begin
                    valid_o <= 0;
                    busy <= 0;
                    if (request_i)
                    begin
                        state <= KEY_PHASE;
                        value <= 0;
                        p <= 0;
                        k <= 0;
                        busy <= 0;
                        valid_o <= 0;
                        data <= data_i;
                    end
                    else
                        state <= IDLE;
                end
            end
        endcase    
    end
end

endmodule
