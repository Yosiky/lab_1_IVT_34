
pulpino.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <_stack_start-0x108000>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00000013          	nop
  20:	00000013          	nop
  24:	00000013          	nop
  28:	00000013          	nop
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop
  4c:	00000013          	nop
  50:	00000013          	nop
  54:	00000013          	nop
  58:	00000013          	nop
  5c:	1340006f          	j	190 <ISR_I2C_ASM>
  60:	1440006f          	j	1a4 <ISR_UART_ASM>
  64:	1540006f          	j	1b8 <ISR_GPIO_ASM>
  68:	1640006f          	j	1cc <ISR_SPIM0_ASM>
  6c:	1740006f          	j	1e0 <ISR_SPIM1_ASM>
  70:	1980006f          	j	208 <ISR_TA_OVF_ASM>
  74:	1800006f          	j	1f4 <ISR_TA_CMP_ASM>
  78:	1b80006f          	j	230 <ISR_TB_OVF_ASM>
  7c:	1a00006f          	j	21c <ISR_TB_CMP_ASM>
  80:	09a0006f          	j	11a <reset_handler>
  84:	1c00006f          	j	244 <illegal_insn_handler>
  88:	1d00006f          	j	258 <ecall_insn_handler>

Disassembly of section .text:

0000008c <main>:
  8c:	7179                	addi	sp,sp,-48
  8e:	d606                	sw	ra,44(sp)
  90:	d422                	sw	s0,40(sp)
  92:	1800                	addi	s0,sp,48
  94:	99c737b7          	lui	a5,0x99c73
  98:	ae478793          	addi	a5,a5,-1308 # 99c72ae4 <pulp__FC+0x99c72ae5>
  9c:	fcf42e23          	sw	a5,-36(s0)
  a0:	ac17b7b7          	lui	a5,0xac17b
  a4:	4fe78793          	addi	a5,a5,1278 # ac17b4fe <pulp__FC+0xac17b4ff>
  a8:	fef42023          	sw	a5,-32(s0)
  ac:	9a41c7b7          	lui	a5,0x9a41c
  b0:	38978793          	addi	a5,a5,905 # 9a41c389 <pulp__FC+0x9a41c38a>
  b4:	fef42223          	sw	a5,-28(s0)
  b8:	3ee5d7b7          	lui	a5,0x3ee5d
  bc:	99f78793          	addi	a5,a5,-1633 # 3ee5c99f <_stack_start+0x3ed5499f>
  c0:	fef42423          	sw	a5,-24(s0)
  c4:	fdc40793          	addi	a5,s0,-36
  c8:	853e                	mv	a0,a5
  ca:	290d                	jal	4fc <kuznechik_cipher_data>
  cc:	fea42623          	sw	a0,-20(s0)
  d0:	a001                	j	d0 <main+0x44>

000000d2 <ISR_I2C>:
  d2:	1141                	addi	sp,sp,-16
  d4:	c622                	sw	s0,12(sp)
  d6:	0800                	addi	s0,sp,16
  d8:	a001                	j	d8 <ISR_I2C+0x6>

000000da <ISR_UART>:
  da:	1141                	addi	sp,sp,-16
  dc:	c622                	sw	s0,12(sp)
  de:	0800                	addi	s0,sp,16
  e0:	a001                	j	e0 <ISR_UART+0x6>

000000e2 <ISR_GPIO>:
  e2:	1141                	addi	sp,sp,-16
  e4:	c622                	sw	s0,12(sp)
  e6:	0800                	addi	s0,sp,16
  e8:	a001                	j	e8 <ISR_GPIO+0x6>

000000ea <ISR_SPIM0>:
  ea:	1141                	addi	sp,sp,-16
  ec:	c622                	sw	s0,12(sp)
  ee:	0800                	addi	s0,sp,16
  f0:	a001                	j	f0 <ISR_SPIM0+0x6>

000000f2 <ISR_SPIM1>:
  f2:	1141                	addi	sp,sp,-16
  f4:	c622                	sw	s0,12(sp)
  f6:	0800                	addi	s0,sp,16
  f8:	a001                	j	f8 <ISR_SPIM1+0x6>

000000fa <ISR_TA_OVF>:
  fa:	1141                	addi	sp,sp,-16
  fc:	c622                	sw	s0,12(sp)
  fe:	0800                	addi	s0,sp,16
 100:	a001                	j	100 <ISR_TA_OVF+0x6>

00000102 <ISR_TA_CMP>:
 102:	1141                	addi	sp,sp,-16
 104:	c622                	sw	s0,12(sp)
 106:	0800                	addi	s0,sp,16
 108:	a001                	j	108 <ISR_TA_CMP+0x6>

0000010a <ISR_TB_OVF>:
 10a:	1141                	addi	sp,sp,-16
 10c:	c622                	sw	s0,12(sp)
 10e:	0800                	addi	s0,sp,16
 110:	a001                	j	110 <ISR_TB_OVF+0x6>

00000112 <ISR_TB_CMP>:
 112:	1141                	addi	sp,sp,-16
 114:	c622                	sw	s0,12(sp)
 116:	0800                	addi	s0,sp,16
 118:	a001                	j	118 <ISR_TB_CMP+0x6>

0000011a <reset_handler>:
 11a:	30501073          	csrw	mtvec,zero
 11e:	00000093          	li	ra,0
 122:	8106                	mv	sp,ra
 124:	8186                	mv	gp,ra
 126:	8206                	mv	tp,ra
 128:	8286                	mv	t0,ra
 12a:	8306                	mv	t1,ra
 12c:	8386                	mv	t2,ra
 12e:	8406                	mv	s0,ra
 130:	8486                	mv	s1,ra
 132:	8506                	mv	a0,ra
 134:	8586                	mv	a1,ra
 136:	8606                	mv	a2,ra
 138:	8686                	mv	a3,ra
 13a:	8706                	mv	a4,ra
 13c:	8786                	mv	a5,ra
 13e:	8806                	mv	a6,ra
 140:	8886                	mv	a7,ra
 142:	8906                	mv	s2,ra
 144:	8986                	mv	s3,ra
 146:	8a06                	mv	s4,ra
 148:	8a86                	mv	s5,ra
 14a:	8b06                	mv	s6,ra
 14c:	8b86                	mv	s7,ra
 14e:	8c06                	mv	s8,ra
 150:	8c86                	mv	s9,ra
 152:	8d06                	mv	s10,ra
 154:	8d86                	mv	s11,ra
 156:	8e06                	mv	t3,ra
 158:	8e86                	mv	t4,ra
 15a:	8f06                	mv	t5,ra
 15c:	8f86                	mv	t6,ra
 15e:	00108117          	auipc	sp,0x108
 162:	ea210113          	addi	sp,sp,-350 # 108000 <_stack_start>

00000166 <_start>:
 166:	00100d17          	auipc	s10,0x100
 16a:	6ded0d13          	addi	s10,s10,1758 # 100844 <__malloc_current_mallinfo>
 16e:	00100d97          	auipc	s11,0x100
 172:	70ed8d93          	addi	s11,s11,1806 # 10087c <_bss_end>
 176:	01bd5763          	ble	s11,s10,184 <main_entry>

0000017a <zero_loop>:
 17a:	000d2023          	sw	zero,0(s10)
 17e:	0d11                	addi	s10,s10,4
 180:	ffaddde3          	ble	s10,s11,17a <zero_loop>

00000184 <main_entry>:
 184:	00000513          	li	a0,0
 188:	00000593          	li	a1,0
 18c:	f01ff0ef          	jal	ra,8c <main>

00000190 <ISR_I2C_ASM>:
 190:	711d                	addi	sp,sp,-96
 192:	ce86                	sw	ra,92(sp)
 194:	0d8000ef          	jal	ra,26c <store_regs>
 198:	00000097          	auipc	ra,0x0
 19c:	11e08093          	addi	ra,ra,286 # 2b6 <end_except>
 1a0:	f33ff06f          	j	d2 <ISR_I2C>

000001a4 <ISR_UART_ASM>:
 1a4:	711d                	addi	sp,sp,-96
 1a6:	ce86                	sw	ra,92(sp)
 1a8:	0c4000ef          	jal	ra,26c <store_regs>
 1ac:	00000097          	auipc	ra,0x0
 1b0:	10a08093          	addi	ra,ra,266 # 2b6 <end_except>
 1b4:	f27ff06f          	j	da <ISR_UART>

000001b8 <ISR_GPIO_ASM>:
 1b8:	711d                	addi	sp,sp,-96
 1ba:	ce86                	sw	ra,92(sp)
 1bc:	0b0000ef          	jal	ra,26c <store_regs>
 1c0:	00000097          	auipc	ra,0x0
 1c4:	0f608093          	addi	ra,ra,246 # 2b6 <end_except>
 1c8:	f1bff06f          	j	e2 <ISR_GPIO>

000001cc <ISR_SPIM0_ASM>:
 1cc:	711d                	addi	sp,sp,-96
 1ce:	ce86                	sw	ra,92(sp)
 1d0:	09c000ef          	jal	ra,26c <store_regs>
 1d4:	00000097          	auipc	ra,0x0
 1d8:	0e208093          	addi	ra,ra,226 # 2b6 <end_except>
 1dc:	f0fff06f          	j	ea <ISR_SPIM0>

000001e0 <ISR_SPIM1_ASM>:
 1e0:	711d                	addi	sp,sp,-96
 1e2:	ce86                	sw	ra,92(sp)
 1e4:	088000ef          	jal	ra,26c <store_regs>
 1e8:	00000097          	auipc	ra,0x0
 1ec:	0ce08093          	addi	ra,ra,206 # 2b6 <end_except>
 1f0:	f03ff06f          	j	f2 <ISR_SPIM1>

000001f4 <ISR_TA_CMP_ASM>:
 1f4:	711d                	addi	sp,sp,-96
 1f6:	ce86                	sw	ra,92(sp)
 1f8:	074000ef          	jal	ra,26c <store_regs>
 1fc:	00000097          	auipc	ra,0x0
 200:	0ba08093          	addi	ra,ra,186 # 2b6 <end_except>
 204:	effff06f          	j	102 <ISR_TA_CMP>

00000208 <ISR_TA_OVF_ASM>:
 208:	711d                	addi	sp,sp,-96
 20a:	ce86                	sw	ra,92(sp)
 20c:	060000ef          	jal	ra,26c <store_regs>
 210:	00000097          	auipc	ra,0x0
 214:	0a608093          	addi	ra,ra,166 # 2b6 <end_except>
 218:	ee3ff06f          	j	fa <ISR_TA_OVF>

0000021c <ISR_TB_CMP_ASM>:
 21c:	711d                	addi	sp,sp,-96
 21e:	ce86                	sw	ra,92(sp)
 220:	04c000ef          	jal	ra,26c <store_regs>
 224:	00000097          	auipc	ra,0x0
 228:	09208093          	addi	ra,ra,146 # 2b6 <end_except>
 22c:	ee7ff06f          	j	112 <ISR_TB_CMP>

00000230 <ISR_TB_OVF_ASM>:
 230:	711d                	addi	sp,sp,-96
 232:	ce86                	sw	ra,92(sp)
 234:	038000ef          	jal	ra,26c <store_regs>
 238:	00000097          	auipc	ra,0x0
 23c:	07e08093          	addi	ra,ra,126 # 2b6 <end_except>
 240:	ecbff06f          	j	10a <ISR_TB_OVF>

00000244 <illegal_insn_handler>:
 244:	711d                	addi	sp,sp,-96
 246:	ce86                	sw	ra,92(sp)
 248:	024000ef          	jal	ra,26c <store_regs>
 24c:	00000097          	auipc	ra,0x0
 250:	06a08093          	addi	ra,ra,106 # 2b6 <end_except>
 254:	0ba0006f          	j	30e <illegal_insn_handler_c>

00000258 <ecall_insn_handler>:
 258:	711d                	addi	sp,sp,-96
 25a:	ce86                	sw	ra,92(sp)
 25c:	010000ef          	jal	ra,26c <store_regs>
 260:	00000097          	auipc	ra,0x0
 264:	05608093          	addi	ra,ra,86 # 2b6 <end_except>
 268:	0ae0006f          	j	316 <ecall_insn_handler_c>

0000026c <store_regs>:
 26c:	c00e                	sw	gp,0(sp)
 26e:	c212                	sw	tp,4(sp)
 270:	c416                	sw	t0,8(sp)
 272:	c61a                	sw	t1,12(sp)
 274:	c81e                	sw	t2,16(sp)
 276:	ca2a                	sw	a0,20(sp)
 278:	cc2e                	sw	a1,24(sp)
 27a:	ce32                	sw	a2,28(sp)
 27c:	d036                	sw	a3,32(sp)
 27e:	d23a                	sw	a4,36(sp)
 280:	d43e                	sw	a5,40(sp)
 282:	d642                	sw	a6,44(sp)
 284:	d846                	sw	a7,48(sp)
 286:	da72                	sw	t3,52(sp)
 288:	dc76                	sw	t4,56(sp)
 28a:	de7a                	sw	t5,60(sp)
 28c:	c0fe                	sw	t6,64(sp)
 28e:	7b002e73          	csrr	t3,lpstart0
 292:	7b102ef3          	csrr	t4,lpend0
 296:	7b202f73          	csrr	t5,lpcount0
 29a:	c2f2                	sw	t3,68(sp)
 29c:	c4f6                	sw	t4,72(sp)
 29e:	c6fa                	sw	t5,76(sp)
 2a0:	7b402e73          	csrr	t3,lpstart1
 2a4:	7b502ef3          	csrr	t4,lpend1
 2a8:	7b602f73          	csrr	t5,lpcount1
 2ac:	c8f2                	sw	t3,80(sp)
 2ae:	caf6                	sw	t4,84(sp)
 2b0:	ccfa                	sw	t5,88(sp)
 2b2:	00008067          	ret

000002b6 <end_except>:
 2b6:	4e46                	lw	t3,80(sp)
 2b8:	4ed6                	lw	t4,84(sp)
 2ba:	4f66                	lw	t5,88(sp)
 2bc:	7b4e1073          	csrw	lpstart1,t3
 2c0:	7b5e9073          	csrw	lpend1,t4
 2c4:	7b6f1073          	csrw	lpcount1,t5
 2c8:	4e16                	lw	t3,68(sp)
 2ca:	4ea6                	lw	t4,72(sp)
 2cc:	4f36                	lw	t5,76(sp)
 2ce:	7b0e1073          	csrw	lpstart0,t3
 2d2:	7b1e9073          	csrw	lpend0,t4
 2d6:	7b2f1073          	csrw	lpcount0,t5
 2da:	4182                	lw	gp,0(sp)
 2dc:	4212                	lw	tp,4(sp)
 2de:	42a2                	lw	t0,8(sp)
 2e0:	4332                	lw	t1,12(sp)
 2e2:	43c2                	lw	t2,16(sp)
 2e4:	4552                	lw	a0,20(sp)
 2e6:	45e2                	lw	a1,24(sp)
 2e8:	4672                	lw	a2,28(sp)
 2ea:	5682                	lw	a3,32(sp)
 2ec:	5712                	lw	a4,36(sp)
 2ee:	57a2                	lw	a5,40(sp)
 2f0:	5832                	lw	a6,44(sp)
 2f2:	58c2                	lw	a7,48(sp)
 2f4:	5e52                	lw	t3,52(sp)
 2f6:	5ee2                	lw	t4,56(sp)
 2f8:	5f72                	lw	t5,60(sp)
 2fa:	4f86                	lw	t6,64(sp)
 2fc:	40f6                	lw	ra,92(sp)
 2fe:	6125                	addi	sp,sp,96
 300:	30200073          	mret

00000304 <_fini>:
 304:	8082                	ret

00000306 <default_exception_handler_c>:
 306:	1141                	addi	sp,sp,-16
 308:	c622                	sw	s0,12(sp)
 30a:	0800                	addi	s0,sp,16
 30c:	a001                	j	30c <default_exception_handler_c+0x6>

0000030e <illegal_insn_handler_c>:
 30e:	1141                	addi	sp,sp,-16
 310:	c622                	sw	s0,12(sp)
 312:	0800                	addi	s0,sp,16
 314:	a001                	j	314 <illegal_insn_handler_c+0x6>

00000316 <ecall_insn_handler_c>:
 316:	1141                	addi	sp,sp,-16
 318:	c622                	sw	s0,12(sp)
 31a:	0800                	addi	s0,sp,16
 31c:	a001                	j	31c <ecall_insn_handler_c+0x6>

0000031e <kuznechik_write_data_in>:
 31e:	7179                	addi	sp,sp,-48
 320:	d622                	sw	s0,44(sp)
 322:	1800                	addi	s0,sp,48
 324:	fca42e23          	sw	a0,-36(s0)
 328:	1a1187b7          	lui	a5,0x1a118
 32c:	0791                	addi	a5,a5,4
 32e:	fef42423          	sw	a5,-24(s0)
 332:	fe042623          	sw	zero,-20(s0)
 336:	a025                	j	35e <kuznechik_write_data_in+0x40>
 338:	fec42783          	lw	a5,-20(s0)
 33c:	078a                	slli	a5,a5,0x2
 33e:	fdc42703          	lw	a4,-36(s0)
 342:	973e                	add	a4,a4,a5
 344:	fec42783          	lw	a5,-20(s0)
 348:	078a                	slli	a5,a5,0x2
 34a:	fe842683          	lw	a3,-24(s0)
 34e:	97b6                	add	a5,a5,a3
 350:	4318                	lw	a4,0(a4)
 352:	c398                	sw	a4,0(a5)
 354:	fec42783          	lw	a5,-20(s0)
 358:	0785                	addi	a5,a5,1
 35a:	fef42623          	sw	a5,-20(s0)
 35e:	fec42703          	lw	a4,-20(s0)
 362:	478d                	li	a5,3
 364:	fce7fae3          	bleu	a4,a5,338 <kuznechik_write_data_in+0x1a>
 368:	0001                	nop
 36a:	5432                	lw	s0,44(sp)
 36c:	6145                	addi	sp,sp,48
 36e:	8082                	ret

00000370 <kuznechik_read_data_out>:
 370:	7179                	addi	sp,sp,-48
 372:	d622                	sw	s0,44(sp)
 374:	1800                	addi	s0,sp,48
 376:	fca42e23          	sw	a0,-36(s0)
 37a:	1a1187b7          	lui	a5,0x1a118
 37e:	07d1                	addi	a5,a5,20
 380:	fef42423          	sw	a5,-24(s0)
 384:	fe042623          	sw	zero,-20(s0)
 388:	a025                	j	3b0 <kuznechik_read_data_out+0x40>
 38a:	fec42783          	lw	a5,-20(s0)
 38e:	078a                	slli	a5,a5,0x2
 390:	fe842703          	lw	a4,-24(s0)
 394:	973e                	add	a4,a4,a5
 396:	fec42783          	lw	a5,-20(s0)
 39a:	078a                	slli	a5,a5,0x2
 39c:	fdc42683          	lw	a3,-36(s0)
 3a0:	97b6                	add	a5,a5,a3
 3a2:	4318                	lw	a4,0(a4)
 3a4:	c398                	sw	a4,0(a5)
 3a6:	fec42783          	lw	a5,-20(s0)
 3aa:	0785                	addi	a5,a5,1
 3ac:	fef42623          	sw	a5,-20(s0)
 3b0:	fec42703          	lw	a4,-20(s0)
 3b4:	478d                	li	a5,3
 3b6:	fce7fae3          	bleu	a4,a5,38a <kuznechik_read_data_out+0x1a>
 3ba:	0001                	nop
 3bc:	5432                	lw	s0,44(sp)
 3be:	6145                	addi	sp,sp,48
 3c0:	8082                	ret

000003c2 <kuznechik_set_csr>:
 3c2:	7179                	addi	sp,sp,-48
 3c4:	d622                	sw	s0,44(sp)
 3c6:	1800                	addi	s0,sp,48
 3c8:	fca42e23          	sw	a0,-36(s0)
 3cc:	1a1187b7          	lui	a5,0x1a118
 3d0:	fef42623          	sw	a5,-20(s0)
 3d4:	fec42783          	lw	a5,-20(s0)
 3d8:	fdc42703          	lw	a4,-36(s0)
 3dc:	c398                	sw	a4,0(a5)
 3de:	0001                	nop
 3e0:	5432                	lw	s0,44(sp)
 3e2:	6145                	addi	sp,sp,48
 3e4:	8082                	ret

000003e6 <kuznechik_is_flag_set>:
 3e6:	7179                	addi	sp,sp,-48
 3e8:	d622                	sw	s0,44(sp)
 3ea:	1800                	addi	s0,sp,48
 3ec:	fca42e23          	sw	a0,-36(s0)
 3f0:	1a1187b7          	lui	a5,0x1a118
 3f4:	fef42623          	sw	a5,-20(s0)
 3f8:	fec42783          	lw	a5,-20(s0)
 3fc:	439c                	lw	a5,0(a5)
 3fe:	0ff7f793          	andi	a5,a5,255
 402:	fdc42703          	lw	a4,-36(s0)
 406:	00e03733          	snez	a4,a4
 40a:	0ff77713          	andi	a4,a4,255
 40e:	8ff9                	and	a5,a5,a4
 410:	0ff7f793          	andi	a5,a5,255
 414:	853e                	mv	a0,a5
 416:	5432                	lw	s0,44(sp)
 418:	6145                	addi	sp,sp,48
 41a:	8082                	ret

0000041c <kuznechik_wait_till_not_busy>:
 41c:	1101                	addi	sp,sp,-32
 41e:	ce22                	sw	s0,28(sp)
 420:	1000                	addi	s0,sp,32
 422:	1a1187b7          	lui	a5,0x1a118
 426:	078d                	addi	a5,a5,3
 428:	fef42423          	sw	a5,-24(s0)
 42c:	a839                	j	44a <kuznechik_wait_till_not_busy+0x2e>
 42e:	fe042623          	sw	zero,-20(s0)
 432:	a031                	j	43e <kuznechik_wait_till_not_busy+0x22>
 434:	fec42783          	lw	a5,-20(s0)
 438:	0785                	addi	a5,a5,1
 43a:	fef42623          	sw	a5,-20(s0)
 43e:	fec42703          	lw	a4,-20(s0)
 442:	05900793          	li	a5,89
 446:	fee7f7e3          	bleu	a4,a5,434 <kuznechik_wait_till_not_busy+0x18>
 44a:	fe842783          	lw	a5,-24(s0)
 44e:	0007c783          	lbu	a5,0(a5) # 1a118000 <_stack_start+0x1a010000>
 452:	fff1                	bnez	a5,42e <kuznechik_wait_till_not_busy+0x12>
 454:	0001                	nop
 456:	4472                	lw	s0,28(sp)
 458:	6105                	addi	sp,sp,32
 45a:	8082                	ret

0000045c <kuznechik_wait_till_valid>:
 45c:	1101                	addi	sp,sp,-32
 45e:	ce22                	sw	s0,28(sp)
 460:	1000                	addi	s0,sp,32
 462:	1a1187b7          	lui	a5,0x1a118
 466:	0789                	addi	a5,a5,2
 468:	fef42423          	sw	a5,-24(s0)
 46c:	a839                	j	48a <kuznechik_wait_till_valid+0x2e>
 46e:	fe042623          	sw	zero,-20(s0)
 472:	a031                	j	47e <kuznechik_wait_till_valid+0x22>
 474:	fec42783          	lw	a5,-20(s0)
 478:	0785                	addi	a5,a5,1
 47a:	fef42623          	sw	a5,-20(s0)
 47e:	fec42703          	lw	a4,-20(s0)
 482:	05900793          	li	a5,89
 486:	fee7f7e3          	bleu	a4,a5,474 <kuznechik_wait_till_valid+0x18>
 48a:	fe842783          	lw	a5,-24(s0)
 48e:	0007c783          	lbu	a5,0(a5) # 1a118000 <_stack_start+0x1a010000>
 492:	dff1                	beqz	a5,46e <kuznechik_wait_till_valid+0x12>
 494:	0001                	nop
 496:	4472                	lw	s0,28(sp)
 498:	6105                	addi	sp,sp,32
 49a:	8082                	ret

0000049c <kuznechik_set_request>:
 49c:	1101                	addi	sp,sp,-32
 49e:	ce22                	sw	s0,28(sp)
 4a0:	1000                	addi	s0,sp,32
 4a2:	1a1187b7          	lui	a5,0x1a118
 4a6:	0785                	addi	a5,a5,1
 4a8:	fef42623          	sw	a5,-20(s0)
 4ac:	fec42783          	lw	a5,-20(s0)
 4b0:	0007c783          	lbu	a5,0(a5) # 1a118000 <_stack_start+0x1a010000>
 4b4:	0027e793          	ori	a5,a5,2
 4b8:	0ff7f713          	andi	a4,a5,255
 4bc:	fec42783          	lw	a5,-20(s0)
 4c0:	00e78023          	sb	a4,0(a5)
 4c4:	0001                	nop
 4c6:	4472                	lw	s0,28(sp)
 4c8:	6105                	addi	sp,sp,32
 4ca:	8082                	ret

000004cc <kuznechik_set_ack>:
 4cc:	1101                	addi	sp,sp,-32
 4ce:	ce22                	sw	s0,28(sp)
 4d0:	1000                	addi	s0,sp,32
 4d2:	1a1187b7          	lui	a5,0x1a118
 4d6:	0785                	addi	a5,a5,1
 4d8:	fef42623          	sw	a5,-20(s0)
 4dc:	fec42783          	lw	a5,-20(s0)
 4e0:	0007c783          	lbu	a5,0(a5) # 1a118000 <_stack_start+0x1a010000>
 4e4:	0017e793          	ori	a5,a5,1
 4e8:	0ff7f713          	andi	a4,a5,255
 4ec:	fec42783          	lw	a5,-20(s0)
 4f0:	00e78023          	sb	a4,0(a5)
 4f4:	0001                	nop
 4f6:	4472                	lw	s0,28(sp)
 4f8:	6105                	addi	sp,sp,32
 4fa:	8082                	ret

000004fc <kuznechik_cipher_data>:
 4fc:	7179                	addi	sp,sp,-48
 4fe:	d606                	sw	ra,44(sp)
 500:	d422                	sw	s0,40(sp)
 502:	1800                	addi	s0,sp,48
 504:	fca42e23          	sw	a0,-36(s0)
 508:	4541                	li	a0,16
 50a:	202d                	jal	534 <malloc>
 50c:	87aa                	mv	a5,a0
 50e:	fef42623          	sw	a5,-20(s0)
 512:	fdc42503          	lw	a0,-36(s0)
 516:	3521                	jal	31e <kuznechik_write_data_in>
 518:	3711                	jal	41c <kuznechik_wait_till_not_busy>
 51a:	3749                	jal	49c <kuznechik_set_request>
 51c:	3781                	jal	45c <kuznechik_wait_till_valid>
 51e:	fec42503          	lw	a0,-20(s0)
 522:	35b9                	jal	370 <kuznechik_read_data_out>
 524:	3765                	jal	4cc <kuznechik_set_ack>
 526:	fec42783          	lw	a5,-20(s0)
 52a:	853e                	mv	a0,a5
 52c:	50b2                	lw	ra,44(sp)
 52e:	5422                	lw	s0,40(sp)
 530:	6145                	addi	sp,sp,48
 532:	8082                	ret

00000534 <malloc>:
 534:	001017b7          	lui	a5,0x101
 538:	85aa                	mv	a1,a0
 53a:	83c7a503          	lw	a0,-1988(a5) # 10083c <_impure_ptr>
 53e:	a039                	j	54c <_malloc_r>

00000540 <free>:
 540:	001017b7          	lui	a5,0x101
 544:	85aa                	mv	a1,a0
 546:	83c7a503          	lw	a0,-1988(a5) # 10083c <_impure_ptr>
 54a:	ab59                	j	ae0 <_free_r>

0000054c <_malloc_r>:
 54c:	7179                	addi	sp,sp,-48
 54e:	d606                	sw	ra,44(sp)
 550:	d422                	sw	s0,40(sp)
 552:	d226                	sw	s1,36(sp)
 554:	d04a                	sw	s2,32(sp)
 556:	ce4e                	sw	s3,28(sp)
 558:	cc52                	sw	s4,24(sp)
 55a:	ca56                	sw	s5,20(sp)
 55c:	c85a                	sw	s6,16(sp)
 55e:	c65e                	sw	s7,12(sp)
 560:	c462                	sw	s8,8(sp)
 562:	00b58793          	addi	a5,a1,11
 566:	4759                	li	a4,22
 568:	02f77563          	bleu	a5,a4,592 <_malloc_r+0x46>
 56c:	ff87f493          	andi	s1,a5,-8
 570:	0204d263          	bgez	s1,594 <_malloc_r+0x48>
 574:	47b1                	li	a5,12
 576:	c11c                	sw	a5,0(a0)
 578:	4501                	li	a0,0
 57a:	50b2                	lw	ra,44(sp)
 57c:	5422                	lw	s0,40(sp)
 57e:	5492                	lw	s1,36(sp)
 580:	5902                	lw	s2,32(sp)
 582:	49f2                	lw	s3,28(sp)
 584:	4a62                	lw	s4,24(sp)
 586:	4ad2                	lw	s5,20(sp)
 588:	4b42                	lw	s6,16(sp)
 58a:	4bb2                	lw	s7,12(sp)
 58c:	4c22                	lw	s8,8(sp)
 58e:	6145                	addi	sp,sp,48
 590:	8082                	ret
 592:	44c1                	li	s1,16
 594:	feb4e0e3          	bltu	s1,a1,574 <_malloc_r+0x28>
 598:	89aa                	mv	s3,a0
 59a:	29a1                	jal	9f2 <__malloc_lock>
 59c:	00100937          	lui	s2,0x100
 5a0:	1f700793          	li	a5,503
 5a4:	00090913          	mv	s2,s2
 5a8:	0297ec63          	bltu	a5,s1,5e0 <_malloc_r+0x94>
 5ac:	00848713          	addi	a4,s1,8
 5b0:	974a                	add	a4,a4,s2
 5b2:	4340                	lw	s0,4(a4)
 5b4:	ff870693          	addi	a3,a4,-8
 5b8:	0034d793          	srli	a5,s1,0x3
 5bc:	00d41663          	bne	s0,a3,5c8 <_malloc_r+0x7c>
 5c0:	4740                	lw	s0,12(a4)
 5c2:	0789                	addi	a5,a5,2
 5c4:	04870c63          	beq	a4,s0,61c <_malloc_r+0xd0>
 5c8:	405c                	lw	a5,4(s0)
 5ca:	4458                	lw	a4,12(s0)
 5cc:	4414                	lw	a3,8(s0)
 5ce:	9bf1                	andi	a5,a5,-4
 5d0:	97a2                	add	a5,a5,s0
 5d2:	c6d8                	sw	a4,12(a3)
 5d4:	c714                	sw	a3,8(a4)
 5d6:	43d8                	lw	a4,4(a5)
 5d8:	00176713          	ori	a4,a4,1
 5dc:	c3d8                	sw	a4,4(a5)
 5de:	a041                	j	65e <_malloc_r+0x112>
 5e0:	0094d713          	srli	a4,s1,0x9
 5e4:	03f00793          	li	a5,63
 5e8:	cb01                	beqz	a4,5f8 <_malloc_r+0xac>
 5ea:	4791                	li	a5,4
 5ec:	06e7ee63          	bltu	a5,a4,668 <_malloc_r+0x11c>
 5f0:	0064d793          	srli	a5,s1,0x6
 5f4:	03878793          	addi	a5,a5,56
 5f8:	00178713          	addi	a4,a5,1
 5fc:	070e                	slli	a4,a4,0x3
 5fe:	974a                	add	a4,a4,s2
 600:	4340                	lw	s0,4(a4)
 602:	ff870593          	addi	a1,a4,-8
 606:	453d                	li	a0,15
 608:	00b40963          	beq	s0,a1,61a <_malloc_r+0xce>
 60c:	4058                	lw	a4,4(s0)
 60e:	9b71                	andi	a4,a4,-4
 610:	40970633          	sub	a2,a4,s1
 614:	08c55d63          	ble	a2,a0,6ae <_malloc_r+0x162>
 618:	17fd                	addi	a5,a5,-1
 61a:	0785                	addi	a5,a5,1
 61c:	01092403          	lw	s0,16(s2) # 100010 <__malloc_av_+0x10>
 620:	001005b7          	lui	a1,0x100
 624:	00890693          	addi	a3,s2,8
 628:	00858593          	addi	a1,a1,8 # 100008 <__malloc_av_+0x8>
 62c:	0ed40263          	beq	s0,a3,710 <_malloc_r+0x1c4>
 630:	4058                	lw	a4,4(s0)
 632:	463d                	li	a2,15
 634:	9b71                	andi	a4,a4,-4
 636:	40970533          	sub	a0,a4,s1
 63a:	08a65563          	ble	a0,a2,6c4 <_malloc_r+0x178>
 63e:	0014e793          	ori	a5,s1,1
 642:	c05c                	sw	a5,4(s0)
 644:	00940633          	add	a2,s0,s1
 648:	00c92a23          	sw	a2,20(s2)
 64c:	00c92823          	sw	a2,16(s2)
 650:	00156793          	ori	a5,a0,1
 654:	c654                	sw	a3,12(a2)
 656:	c614                	sw	a3,8(a2)
 658:	c25c                	sw	a5,4(a2)
 65a:	9722                	add	a4,a4,s0
 65c:	c308                	sw	a0,0(a4)
 65e:	854e                	mv	a0,s3
 660:	2e51                	jal	9f4 <__malloc_unlock>
 662:	00840513          	addi	a0,s0,8
 666:	bf11                	j	57a <_malloc_r+0x2e>
 668:	47d1                	li	a5,20
 66a:	00e7e563          	bltu	a5,a4,674 <_malloc_r+0x128>
 66e:	05b70793          	addi	a5,a4,91
 672:	b759                	j	5f8 <_malloc_r+0xac>
 674:	05400793          	li	a5,84
 678:	00e7e763          	bltu	a5,a4,686 <_malloc_r+0x13a>
 67c:	00c4d793          	srli	a5,s1,0xc
 680:	06e78793          	addi	a5,a5,110
 684:	bf95                	j	5f8 <_malloc_r+0xac>
 686:	15400793          	li	a5,340
 68a:	00e7e763          	bltu	a5,a4,698 <_malloc_r+0x14c>
 68e:	00f4d793          	srli	a5,s1,0xf
 692:	07778793          	addi	a5,a5,119
 696:	b78d                	j	5f8 <_malloc_r+0xac>
 698:	55400693          	li	a3,1364
 69c:	07e00793          	li	a5,126
 6a0:	f4e6ece3          	bltu	a3,a4,5f8 <_malloc_r+0xac>
 6a4:	0124d793          	srli	a5,s1,0x12
 6a8:	07c78793          	addi	a5,a5,124
 6ac:	b7b1                	j	5f8 <_malloc_r+0xac>
 6ae:	4454                	lw	a3,12(s0)
 6b0:	00064863          	bltz	a2,6c0 <_malloc_r+0x174>
 6b4:	441c                	lw	a5,8(s0)
 6b6:	c7d4                	sw	a3,12(a5)
 6b8:	c69c                	sw	a5,8(a3)
 6ba:	00e407b3          	add	a5,s0,a4
 6be:	bf21                	j	5d6 <_malloc_r+0x8a>
 6c0:	8436                	mv	s0,a3
 6c2:	b799                	j	608 <_malloc_r+0xbc>
 6c4:	00d92a23          	sw	a3,20(s2)
 6c8:	00d92823          	sw	a3,16(s2)
 6cc:	00054863          	bltz	a0,6dc <_malloc_r+0x190>
 6d0:	9722                	add	a4,a4,s0
 6d2:	435c                	lw	a5,4(a4)
 6d4:	0017e793          	ori	a5,a5,1
 6d8:	c35c                	sw	a5,4(a4)
 6da:	b751                	j	65e <_malloc_r+0x112>
 6dc:	1ff00693          	li	a3,511
 6e0:	00492803          	lw	a6,4(s2)
 6e4:	12e6e863          	bltu	a3,a4,814 <_malloc_r+0x2c8>
 6e8:	830d                	srli	a4,a4,0x3
 6ea:	40275613          	srai	a2,a4,0x2
 6ee:	4685                	li	a3,1
 6f0:	0705                	addi	a4,a4,1
 6f2:	00c696b3          	sll	a3,a3,a2
 6f6:	070e                	slli	a4,a4,0x3
 6f8:	974a                	add	a4,a4,s2
 6fa:	0106e6b3          	or	a3,a3,a6
 6fe:	00d92223          	sw	a3,4(s2)
 702:	4314                	lw	a3,0(a4)
 704:	ff870613          	addi	a2,a4,-8
 708:	c450                	sw	a2,12(s0)
 70a:	c414                	sw	a3,8(s0)
 70c:	c300                	sw	s0,0(a4)
 70e:	c6c0                	sw	s0,12(a3)
 710:	4027d713          	srai	a4,a5,0x2
 714:	4305                	li	t1,1
 716:	00e31333          	sll	t1,t1,a4
 71a:	00492703          	lw	a4,4(s2)
 71e:	04676c63          	bltu	a4,t1,776 <_malloc_r+0x22a>
 722:	006776b3          	and	a3,a4,t1
 726:	e699                	bnez	a3,734 <_malloc_r+0x1e8>
 728:	9bf1                	andi	a5,a5,-4
 72a:	0306                	slli	t1,t1,0x1
 72c:	006776b3          	and	a3,a4,t1
 730:	0791                	addi	a5,a5,4
 732:	dee5                	beqz	a3,72a <_malloc_r+0x1de>
 734:	4e3d                	li	t3,15
 736:	00379693          	slli	a3,a5,0x3
 73a:	96ca                	add	a3,a3,s2
 73c:	8836                	mv	a6,a3
 73e:	853e                	mv	a0,a5
 740:	00c82403          	lw	s0,12(a6)
 744:	17041363          	bne	s0,a6,8aa <_malloc_r+0x35e>
 748:	0505                	addi	a0,a0,1
 74a:	00357713          	andi	a4,a0,3
 74e:	0821                	addi	a6,a6,8
 750:	fb65                	bnez	a4,740 <_malloc_r+0x1f4>
 752:	0037f713          	andi	a4,a5,3
 756:	1a071363          	bnez	a4,8fc <_malloc_r+0x3b0>
 75a:	00492703          	lw	a4,4(s2)
 75e:	fff34793          	not	a5,t1
 762:	8ff9                	and	a5,a5,a4
 764:	00f92223          	sw	a5,4(s2)
 768:	00492703          	lw	a4,4(s2)
 76c:	0306                	slli	t1,t1,0x1
 76e:	00676463          	bltu	a4,t1,776 <_malloc_r+0x22a>
 772:	1a031263          	bnez	t1,916 <_malloc_r+0x3ca>
 776:	00892b83          	lw	s7,8(s2)
 77a:	004ba403          	lw	s0,4(s7)
 77e:	ffc47a93          	andi	s5,s0,-4
 782:	009ae763          	bltu	s5,s1,790 <_malloc_r+0x244>
 786:	409a8733          	sub	a4,s5,s1
 78a:	47bd                	li	a5,15
 78c:	24e7c963          	blt	a5,a4,9de <_malloc_r+0x492>
 790:	001017b7          	lui	a5,0x101
 794:	00101a37          	lui	s4,0x101
 798:	8747a403          	lw	s0,-1932(a5) # 100874 <__malloc_top_pad>
 79c:	830a2703          	lw	a4,-2000(s4) # 100830 <_edata>
 7a0:	57fd                	li	a5,-1
 7a2:	9426                	add	s0,s0,s1
 7a4:	16f71b63          	bne	a4,a5,91a <_malloc_r+0x3ce>
 7a8:	0441                	addi	s0,s0,16
 7aa:	85a2                	mv	a1,s0
 7ac:	854e                	mv	a0,s3
 7ae:	24a1                	jal	9f6 <_sbrk_r>
 7b0:	57fd                	li	a5,-1
 7b2:	8b2a                	mv	s6,a0
 7b4:	1cf50c63          	beq	a0,a5,98c <_malloc_r+0x440>
 7b8:	015b87b3          	add	a5,s7,s5
 7bc:	00f57463          	bleu	a5,a0,7c4 <_malloc_r+0x278>
 7c0:	1d2b9663          	bne	s7,s2,98c <_malloc_r+0x440>
 7c4:	00101c37          	lui	s8,0x101
 7c8:	844c0693          	addi	a3,s8,-1980 # 100844 <__malloc_current_mallinfo>
 7cc:	4298                	lw	a4,0(a3)
 7ce:	844c0c13          	addi	s8,s8,-1980
 7d2:	9722                	add	a4,a4,s0
 7d4:	c298                	sw	a4,0(a3)
 7d6:	15679863          	bne	a5,s6,926 <_malloc_r+0x3da>
 7da:	01479693          	slli	a3,a5,0x14
 7de:	14069463          	bnez	a3,926 <_malloc_r+0x3da>
 7e2:	00892783          	lw	a5,8(s2)
 7e6:	9456                	add	s0,s0,s5
 7e8:	00146413          	ori	s0,s0,1
 7ec:	c3c0                	sw	s0,4(a5)
 7ee:	00101737          	lui	a4,0x101
 7f2:	000c2783          	lw	a5,0(s8)
 7f6:	87072683          	lw	a3,-1936(a4) # 100870 <__malloc_max_sbrked_mem>
 7fa:	00f6f463          	bleu	a5,a3,802 <_malloc_r+0x2b6>
 7fe:	86f72823          	sw	a5,-1936(a4)
 802:	00101737          	lui	a4,0x101
 806:	86c72683          	lw	a3,-1940(a4) # 10086c <__malloc_max_total_mem>
 80a:	18f6f163          	bleu	a5,a3,98c <_malloc_r+0x440>
 80e:	86f72623          	sw	a5,-1940(a4)
 812:	aaad                	j	98c <_malloc_r+0x440>
 814:	00975613          	srli	a2,a4,0x9
 818:	4691                	li	a3,4
 81a:	02c6ec63          	bltu	a3,a2,852 <_malloc_r+0x306>
 81e:	00675693          	srli	a3,a4,0x6
 822:	03868693          	addi	a3,a3,56
 826:	00168613          	addi	a2,a3,1
 82a:	060e                	slli	a2,a2,0x3
 82c:	964a                	add	a2,a2,s2
 82e:	ff860513          	addi	a0,a2,-8
 832:	4210                	lw	a2,0(a2)
 834:	06c51563          	bne	a0,a2,89e <_malloc_r+0x352>
 838:	8689                	srai	a3,a3,0x2
 83a:	4705                	li	a4,1
 83c:	00d716b3          	sll	a3,a4,a3
 840:	0106e6b3          	or	a3,a3,a6
 844:	00d92223          	sw	a3,4(s2)
 848:	c448                	sw	a0,12(s0)
 84a:	c410                	sw	a2,8(s0)
 84c:	c500                	sw	s0,8(a0)
 84e:	c640                	sw	s0,12(a2)
 850:	b5c1                	j	710 <_malloc_r+0x1c4>
 852:	46d1                	li	a3,20
 854:	00c6e563          	bltu	a3,a2,85e <_malloc_r+0x312>
 858:	05b60693          	addi	a3,a2,91
 85c:	b7e9                	j	826 <_malloc_r+0x2da>
 85e:	05400693          	li	a3,84
 862:	00c6e763          	bltu	a3,a2,870 <_malloc_r+0x324>
 866:	00c75693          	srli	a3,a4,0xc
 86a:	06e68693          	addi	a3,a3,110
 86e:	bf65                	j	826 <_malloc_r+0x2da>
 870:	15400693          	li	a3,340
 874:	00c6e763          	bltu	a3,a2,882 <_malloc_r+0x336>
 878:	00f75693          	srli	a3,a4,0xf
 87c:	07768693          	addi	a3,a3,119
 880:	b75d                	j	826 <_malloc_r+0x2da>
 882:	55400513          	li	a0,1364
 886:	07e00693          	li	a3,126
 88a:	f8c56ee3          	bltu	a0,a2,826 <_malloc_r+0x2da>
 88e:	01275693          	srli	a3,a4,0x12
 892:	07c68693          	addi	a3,a3,124
 896:	bf41                	j	826 <_malloc_r+0x2da>
 898:	4610                	lw	a2,8(a2)
 89a:	00c50663          	beq	a0,a2,8a6 <_malloc_r+0x35a>
 89e:	4254                	lw	a3,4(a2)
 8a0:	9af1                	andi	a3,a3,-4
 8a2:	fed76be3          	bltu	a4,a3,898 <_malloc_r+0x34c>
 8a6:	4648                	lw	a0,12(a2)
 8a8:	b745                	j	848 <_malloc_r+0x2fc>
 8aa:	4058                	lw	a4,4(s0)
 8ac:	4450                	lw	a2,12(s0)
 8ae:	9b71                	andi	a4,a4,-4
 8b0:	409708b3          	sub	a7,a4,s1
 8b4:	031e5763          	ble	a7,t3,8e2 <_malloc_r+0x396>
 8b8:	0014e793          	ori	a5,s1,1
 8bc:	c05c                	sw	a5,4(s0)
 8be:	441c                	lw	a5,8(s0)
 8c0:	009406b3          	add	a3,s0,s1
 8c4:	9722                	add	a4,a4,s0
 8c6:	c7d0                	sw	a2,12(a5)
 8c8:	c61c                	sw	a5,8(a2)
 8ca:	00d92a23          	sw	a3,20(s2)
 8ce:	00d92823          	sw	a3,16(s2)
 8d2:	0018e793          	ori	a5,a7,1
 8d6:	c6cc                	sw	a1,12(a3)
 8d8:	c68c                	sw	a1,8(a3)
 8da:	c2dc                	sw	a5,4(a3)
 8dc:	01172023          	sw	a7,0(a4)
 8e0:	bbbd                	j	65e <_malloc_r+0x112>
 8e2:	0008cb63          	bltz	a7,8f8 <_malloc_r+0x3ac>
 8e6:	9722                	add	a4,a4,s0
 8e8:	435c                	lw	a5,4(a4)
 8ea:	0017e793          	ori	a5,a5,1
 8ee:	c35c                	sw	a5,4(a4)
 8f0:	441c                	lw	a5,8(s0)
 8f2:	c7d0                	sw	a2,12(a5)
 8f4:	c61c                	sw	a5,8(a2)
 8f6:	b3a5                	j	65e <_malloc_r+0x112>
 8f8:	8432                	mv	s0,a2
 8fa:	b5a9                	j	744 <_malloc_r+0x1f8>
 8fc:	ff868713          	addi	a4,a3,-8
 900:	4294                	lw	a3,0(a3)
 902:	17fd                	addi	a5,a5,-1
 904:	e4e687e3          	beq	a3,a4,752 <_malloc_r+0x206>
 908:	b585                	j	768 <_malloc_r+0x21c>
 90a:	0791                	addi	a5,a5,4
 90c:	0306                	slli	t1,t1,0x1
 90e:	006776b3          	and	a3,a4,t1
 912:	dee5                	beqz	a3,90a <_malloc_r+0x3be>
 914:	b50d                	j	736 <_malloc_r+0x1ea>
 916:	87aa                	mv	a5,a0
 918:	bfdd                	j	90e <_malloc_r+0x3c2>
 91a:	6785                	lui	a5,0x1
 91c:	07bd                	addi	a5,a5,15
 91e:	943e                	add	s0,s0,a5
 920:	77fd                	lui	a5,0xfffff
 922:	8c7d                	and	s0,s0,a5
 924:	b559                	j	7aa <_malloc_r+0x25e>
 926:	830a2603          	lw	a2,-2000(s4)
 92a:	56fd                	li	a3,-1
 92c:	06d61e63          	bne	a2,a3,9a8 <_malloc_r+0x45c>
 930:	836a2823          	sw	s6,-2000(s4)
 934:	007b7593          	andi	a1,s6,7
 938:	c589                	beqz	a1,942 <_malloc_r+0x3f6>
 93a:	47a1                	li	a5,8
 93c:	40b785b3          	sub	a1,a5,a1
 940:	9b2e                	add	s6,s6,a1
 942:	6785                	lui	a5,0x1
 944:	95be                	add	a1,a1,a5
 946:	945a                	add	s0,s0,s6
 948:	17fd                	addi	a5,a5,-1
 94a:	8c7d                	and	s0,s0,a5
 94c:	40858a33          	sub	s4,a1,s0
 950:	85d2                	mv	a1,s4
 952:	854e                	mv	a0,s3
 954:	204d                	jal	9f6 <_sbrk_r>
 956:	57fd                	li	a5,-1
 958:	00f51463          	bne	a0,a5,960 <_malloc_r+0x414>
 95c:	855a                	mv	a0,s6
 95e:	4a01                	li	s4,0
 960:	000c2783          	lw	a5,0(s8)
 964:	41650533          	sub	a0,a0,s6
 968:	01692423          	sw	s6,8(s2)
 96c:	97d2                	add	a5,a5,s4
 96e:	9a2a                	add	s4,s4,a0
 970:	001a6a13          	ori	s4,s4,1
 974:	00fc2023          	sw	a5,0(s8)
 978:	014b2223          	sw	s4,4(s6)
 97c:	e72b89e3          	beq	s7,s2,7ee <_malloc_r+0x2a2>
 980:	473d                	li	a4,15
 982:	03576963          	bltu	a4,s5,9b4 <_malloc_r+0x468>
 986:	4785                	li	a5,1
 988:	00fb2223          	sw	a5,4(s6)
 98c:	00892783          	lw	a5,8(s2)
 990:	43dc                	lw	a5,4(a5)
 992:	9bf1                	andi	a5,a5,-4
 994:	40978733          	sub	a4,a5,s1
 998:	0097e563          	bltu	a5,s1,9a2 <_malloc_r+0x456>
 99c:	47bd                	li	a5,15
 99e:	04e7c063          	blt	a5,a4,9de <_malloc_r+0x492>
 9a2:	854e                	mv	a0,s3
 9a4:	2881                	jal	9f4 <__malloc_unlock>
 9a6:	bec9                	j	578 <_malloc_r+0x2c>
 9a8:	40fb07b3          	sub	a5,s6,a5
 9ac:	97ba                	add	a5,a5,a4
 9ae:	00fc2023          	sw	a5,0(s8)
 9b2:	b749                	j	934 <_malloc_r+0x3e8>
 9b4:	004ba783          	lw	a5,4(s7)
 9b8:	ff4a8413          	addi	s0,s5,-12
 9bc:	9861                	andi	s0,s0,-8
 9be:	8b85                	andi	a5,a5,1
 9c0:	8fc1                	or	a5,a5,s0
 9c2:	00fba223          	sw	a5,4(s7)
 9c6:	4695                	li	a3,5
 9c8:	008b87b3          	add	a5,s7,s0
 9cc:	c3d4                	sw	a3,4(a5)
 9ce:	c794                	sw	a3,8(a5)
 9d0:	e0877fe3          	bleu	s0,a4,7ee <_malloc_r+0x2a2>
 9d4:	008b8593          	addi	a1,s7,8
 9d8:	854e                	mv	a0,s3
 9da:	2219                	jal	ae0 <_free_r>
 9dc:	bd09                	j	7ee <_malloc_r+0x2a2>
 9de:	00892403          	lw	s0,8(s2)
 9e2:	0014e793          	ori	a5,s1,1
 9e6:	c05c                	sw	a5,4(s0)
 9e8:	009407b3          	add	a5,s0,s1
 9ec:	00f92423          	sw	a5,8(s2)
 9f0:	b6e5                	j	5d8 <_malloc_r+0x8c>

000009f2 <__malloc_lock>:
 9f2:	8082                	ret

000009f4 <__malloc_unlock>:
 9f4:	8082                	ret

000009f6 <_sbrk_r>:
 9f6:	1141                	addi	sp,sp,-16
 9f8:	c422                	sw	s0,8(sp)
 9fa:	c226                	sw	s1,4(sp)
 9fc:	00101437          	lui	s0,0x101
 a00:	84aa                	mv	s1,a0
 a02:	852e                	mv	a0,a1
 a04:	c606                	sw	ra,12(sp)
 a06:	86042c23          	sw	zero,-1928(s0) # 100878 <errno>
 a0a:	21fd                	jal	ef8 <sbrk>
 a0c:	57fd                	li	a5,-1
 a0e:	00f51663          	bne	a0,a5,a1a <_sbrk_r+0x24>
 a12:	87842783          	lw	a5,-1928(s0)
 a16:	c391                	beqz	a5,a1a <_sbrk_r+0x24>
 a18:	c09c                	sw	a5,0(s1)
 a1a:	40b2                	lw	ra,12(sp)
 a1c:	4422                	lw	s0,8(sp)
 a1e:	4492                	lw	s1,4(sp)
 a20:	0141                	addi	sp,sp,16
 a22:	8082                	ret

00000a24 <_malloc_trim_r>:
 a24:	7179                	addi	sp,sp,-48
 a26:	d04a                	sw	s2,32(sp)
 a28:	00100937          	lui	s2,0x100
 a2c:	d422                	sw	s0,40(sp)
 a2e:	d226                	sw	s1,36(sp)
 a30:	ce4e                	sw	s3,28(sp)
 a32:	c62e                	sw	a1,12(sp)
 a34:	d606                	sw	ra,44(sp)
 a36:	89aa                	mv	s3,a0
 a38:	00090913          	mv	s2,s2
 a3c:	3f5d                	jal	9f2 <__malloc_lock>
 a3e:	00892783          	lw	a5,8(s2) # 100008 <__malloc_av_+0x8>
 a42:	45b2                	lw	a1,12(sp)
 a44:	43c4                	lw	s1,4(a5)
 a46:	6785                	lui	a5,0x1
 a48:	fef78413          	addi	s0,a5,-17 # fef <__DTOR_END__+0x93>
 a4c:	98f1                	andi	s1,s1,-4
 a4e:	8c0d                	sub	s0,s0,a1
 a50:	9426                	add	s0,s0,s1
 a52:	8031                	srli	s0,s0,0xc
 a54:	147d                	addi	s0,s0,-1
 a56:	0432                	slli	s0,s0,0xc
 a58:	00f45c63          	ble	a5,s0,a70 <_malloc_trim_r+0x4c>
 a5c:	854e                	mv	a0,s3
 a5e:	3f59                	jal	9f4 <__malloc_unlock>
 a60:	4501                	li	a0,0
 a62:	50b2                	lw	ra,44(sp)
 a64:	5422                	lw	s0,40(sp)
 a66:	5492                	lw	s1,36(sp)
 a68:	5902                	lw	s2,32(sp)
 a6a:	49f2                	lw	s3,28(sp)
 a6c:	6145                	addi	sp,sp,48
 a6e:	8082                	ret
 a70:	4581                	li	a1,0
 a72:	854e                	mv	a0,s3
 a74:	3749                	jal	9f6 <_sbrk_r>
 a76:	00892783          	lw	a5,8(s2)
 a7a:	97a6                	add	a5,a5,s1
 a7c:	fef510e3          	bne	a0,a5,a5c <_malloc_trim_r+0x38>
 a80:	408005b3          	neg	a1,s0
 a84:	854e                	mv	a0,s3
 a86:	3f85                	jal	9f6 <_sbrk_r>
 a88:	57fd                	li	a5,-1
 a8a:	02f51963          	bne	a0,a5,abc <_malloc_trim_r+0x98>
 a8e:	4581                	li	a1,0
 a90:	854e                	mv	a0,s3
 a92:	3795                	jal	9f6 <_sbrk_r>
 a94:	00892703          	lw	a4,8(s2)
 a98:	46bd                	li	a3,15
 a9a:	40e507b3          	sub	a5,a0,a4
 a9e:	faf6dfe3          	ble	a5,a3,a5c <_malloc_trim_r+0x38>
 aa2:	001016b7          	lui	a3,0x101
 aa6:	8306a683          	lw	a3,-2000(a3) # 100830 <_edata>
 aaa:	0017e793          	ori	a5,a5,1
 aae:	c35c                	sw	a5,4(a4)
 ab0:	8d15                	sub	a0,a0,a3
 ab2:	001016b7          	lui	a3,0x101
 ab6:	84a6a223          	sw	a0,-1980(a3) # 100844 <__malloc_current_mallinfo>
 aba:	b74d                	j	a5c <_malloc_trim_r+0x38>
 abc:	00892783          	lw	a5,8(s2)
 ac0:	8c81                	sub	s1,s1,s0
 ac2:	00101737          	lui	a4,0x101
 ac6:	0014e493          	ori	s1,s1,1
 aca:	c3c4                	sw	s1,4(a5)
 acc:	84472783          	lw	a5,-1980(a4) # 100844 <__malloc_current_mallinfo>
 ad0:	854e                	mv	a0,s3
 ad2:	40878433          	sub	s0,a5,s0
 ad6:	84872223          	sw	s0,-1980(a4)
 ada:	3f29                	jal	9f4 <__malloc_unlock>
 adc:	4505                	li	a0,1
 ade:	b751                	j	a62 <_malloc_trim_r+0x3e>

00000ae0 <_free_r>:
 ae0:	1a058663          	beqz	a1,c8c <_free_r+0x1ac>
 ae4:	1141                	addi	sp,sp,-16
 ae6:	c422                	sw	s0,8(sp)
 ae8:	c226                	sw	s1,4(sp)
 aea:	842a                	mv	s0,a0
 aec:	84ae                	mv	s1,a1
 aee:	c606                	sw	ra,12(sp)
 af0:	3709                	jal	9f2 <__malloc_lock>
 af2:	ffc4a503          	lw	a0,-4(s1)
 af6:	00100637          	lui	a2,0x100
 afa:	ff848693          	addi	a3,s1,-8
 afe:	ffe57793          	andi	a5,a0,-2
 b02:	00060813          	mv	a6,a2
 b06:	00f685b3          	add	a1,a3,a5
 b0a:	41d8                	lw	a4,4(a1)
 b0c:	00882803          	lw	a6,8(a6)
 b10:	00060613          	mv	a2,a2
 b14:	9b71                	andi	a4,a4,-4
 b16:	8905                	andi	a0,a0,1
 b18:	04b81263          	bne	a6,a1,b5c <_free_r+0x7c>
 b1c:	97ba                	add	a5,a5,a4
 b1e:	e909                	bnez	a0,b30 <_free_r+0x50>
 b20:	ff84a703          	lw	a4,-8(s1)
 b24:	8e99                	sub	a3,a3,a4
 b26:	468c                	lw	a1,8(a3)
 b28:	97ba                	add	a5,a5,a4
 b2a:	46d8                	lw	a4,12(a3)
 b2c:	c5d8                	sw	a4,12(a1)
 b2e:	c70c                	sw	a1,8(a4)
 b30:	0017e713          	ori	a4,a5,1
 b34:	c2d8                	sw	a4,4(a3)
 b36:	00101737          	lui	a4,0x101
 b3a:	83472703          	lw	a4,-1996(a4) # 100834 <__malloc_trim_threshold>
 b3e:	c614                	sw	a3,8(a2)
 b40:	00e7e863          	bltu	a5,a4,b50 <_free_r+0x70>
 b44:	001017b7          	lui	a5,0x101
 b48:	8747a583          	lw	a1,-1932(a5) # 100874 <__malloc_top_pad>
 b4c:	8522                	mv	a0,s0
 b4e:	3dd9                	jal	a24 <_malloc_trim_r>
 b50:	8522                	mv	a0,s0
 b52:	4422                	lw	s0,8(sp)
 b54:	40b2                	lw	ra,12(sp)
 b56:	4492                	lw	s1,4(sp)
 b58:	0141                	addi	sp,sp,16
 b5a:	bd69                	j	9f4 <__malloc_unlock>
 b5c:	c1d8                	sw	a4,4(a1)
 b5e:	4801                	li	a6,0
 b60:	e115                	bnez	a0,b84 <_free_r+0xa4>
 b62:	ff84a503          	lw	a0,-8(s1)
 b66:	001008b7          	lui	a7,0x100
 b6a:	00888893          	addi	a7,a7,8 # 100008 <__malloc_av_+0x8>
 b6e:	8e89                	sub	a3,a3,a0
 b70:	97aa                	add	a5,a5,a0
 b72:	4688                	lw	a0,8(a3)
 b74:	07150c63          	beq	a0,a7,bec <_free_r+0x10c>
 b78:	00c6a883          	lw	a7,12(a3)
 b7c:	01152623          	sw	a7,12(a0)
 b80:	00a8a423          	sw	a0,8(a7)
 b84:	00e58533          	add	a0,a1,a4
 b88:	4148                	lw	a0,4(a0)
 b8a:	8905                	andi	a0,a0,1
 b8c:	e105                	bnez	a0,bac <_free_r+0xcc>
 b8e:	97ba                	add	a5,a5,a4
 b90:	4598                	lw	a4,8(a1)
 b92:	04081f63          	bnez	a6,bf0 <_free_r+0x110>
 b96:	00100537          	lui	a0,0x100
 b9a:	00850513          	addi	a0,a0,8 # 100008 <__malloc_av_+0x8>
 b9e:	04a71963          	bne	a4,a0,bf0 <_free_r+0x110>
 ba2:	ca54                	sw	a3,20(a2)
 ba4:	ca14                	sw	a3,16(a2)
 ba6:	c6d8                	sw	a4,12(a3)
 ba8:	c698                	sw	a4,8(a3)
 baa:	4805                	li	a6,1
 bac:	0017e713          	ori	a4,a5,1
 bb0:	c2d8                	sw	a4,4(a3)
 bb2:	00f68733          	add	a4,a3,a5
 bb6:	c31c                	sw	a5,0(a4)
 bb8:	f8081ce3          	bnez	a6,b50 <_free_r+0x70>
 bbc:	1ff00713          	li	a4,511
 bc0:	02f76c63          	bltu	a4,a5,bf8 <_free_r+0x118>
 bc4:	838d                	srli	a5,a5,0x3
 bc6:	4027d593          	srai	a1,a5,0x2
 bca:	4705                	li	a4,1
 bcc:	00b71733          	sll	a4,a4,a1
 bd0:	424c                	lw	a1,4(a2)
 bd2:	0785                	addi	a5,a5,1
 bd4:	078e                	slli	a5,a5,0x3
 bd6:	97b2                	add	a5,a5,a2
 bd8:	8f4d                	or	a4,a4,a1
 bda:	c258                	sw	a4,4(a2)
 bdc:	4398                	lw	a4,0(a5)
 bde:	ff878613          	addi	a2,a5,-8
 be2:	c6d0                	sw	a2,12(a3)
 be4:	c698                	sw	a4,8(a3)
 be6:	c394                	sw	a3,0(a5)
 be8:	c754                	sw	a3,12(a4)
 bea:	b79d                	j	b50 <_free_r+0x70>
 bec:	4805                	li	a6,1
 bee:	bf59                	j	b84 <_free_r+0xa4>
 bf0:	45cc                	lw	a1,12(a1)
 bf2:	c74c                	sw	a1,12(a4)
 bf4:	c598                	sw	a4,8(a1)
 bf6:	bf5d                	j	bac <_free_r+0xcc>
 bf8:	0097d593          	srli	a1,a5,0x9
 bfc:	4711                	li	a4,4
 bfe:	02b76b63          	bltu	a4,a1,c34 <_free_r+0x154>
 c02:	0067d713          	srli	a4,a5,0x6
 c06:	03870713          	addi	a4,a4,56
 c0a:	00170593          	addi	a1,a4,1
 c0e:	058e                	slli	a1,a1,0x3
 c10:	95b2                	add	a1,a1,a2
 c12:	ff858513          	addi	a0,a1,-8
 c16:	418c                	lw	a1,0(a1)
 c18:	06b51463          	bne	a0,a1,c80 <_free_r+0x1a0>
 c1c:	4785                	li	a5,1
 c1e:	8709                	srai	a4,a4,0x2
 c20:	00e79733          	sll	a4,a5,a4
 c24:	425c                	lw	a5,4(a2)
 c26:	8f5d                	or	a4,a4,a5
 c28:	c258                	sw	a4,4(a2)
 c2a:	c6c8                	sw	a0,12(a3)
 c2c:	c68c                	sw	a1,8(a3)
 c2e:	c514                	sw	a3,8(a0)
 c30:	c5d4                	sw	a3,12(a1)
 c32:	bf39                	j	b50 <_free_r+0x70>
 c34:	4751                	li	a4,20
 c36:	00b76563          	bltu	a4,a1,c40 <_free_r+0x160>
 c3a:	05b58713          	addi	a4,a1,91
 c3e:	b7f1                	j	c0a <_free_r+0x12a>
 c40:	05400713          	li	a4,84
 c44:	00b76763          	bltu	a4,a1,c52 <_free_r+0x172>
 c48:	00c7d713          	srli	a4,a5,0xc
 c4c:	06e70713          	addi	a4,a4,110
 c50:	bf6d                	j	c0a <_free_r+0x12a>
 c52:	15400713          	li	a4,340
 c56:	00b76763          	bltu	a4,a1,c64 <_free_r+0x184>
 c5a:	00f7d713          	srli	a4,a5,0xf
 c5e:	07770713          	addi	a4,a4,119
 c62:	b765                	j	c0a <_free_r+0x12a>
 c64:	55400513          	li	a0,1364
 c68:	07e00713          	li	a4,126
 c6c:	f8b56fe3          	bltu	a0,a1,c0a <_free_r+0x12a>
 c70:	0127d713          	srli	a4,a5,0x12
 c74:	07c70713          	addi	a4,a4,124
 c78:	bf49                	j	c0a <_free_r+0x12a>
 c7a:	458c                	lw	a1,8(a1)
 c7c:	00b50663          	beq	a0,a1,c88 <_free_r+0x1a8>
 c80:	41d8                	lw	a4,4(a1)
 c82:	9b71                	andi	a4,a4,-4
 c84:	fee7ebe3          	bltu	a5,a4,c7a <_free_r+0x19a>
 c88:	45c8                	lw	a0,12(a1)
 c8a:	b745                	j	c2a <_free_r+0x14a>
 c8c:	8082                	ret

00000c8e <conv_stat>:
 c8e:	419c                	lw	a5,0(a1)
 c90:	00f51023          	sh	a5,0(a0)
 c94:	459c                	lw	a5,8(a1)
 c96:	00f51123          	sh	a5,2(a0)
 c9a:	499c                	lw	a5,16(a1)
 c9c:	c15c                	sw	a5,4(a0)
 c9e:	49dc                	lw	a5,20(a1)
 ca0:	00f51423          	sh	a5,8(a0)
 ca4:	4d9c                	lw	a5,24(a1)
 ca6:	00f51523          	sh	a5,10(a0)
 caa:	4ddc                	lw	a5,28(a1)
 cac:	00f51623          	sh	a5,12(a0)
 cb0:	519c                	lw	a5,32(a1)
 cb2:	00f51723          	sh	a5,14(a0)
 cb6:	599c                	lw	a5,48(a1)
 cb8:	c91c                	sw	a5,16(a0)
 cba:	41bc                	lw	a5,64(a1)
 cbc:	d91c                	sw	a5,48(a0)
 cbe:	5d9c                	lw	a5,56(a1)
 cc0:	d55c                	sw	a5,44(a0)
 cc2:	45bc                	lw	a5,72(a1)
 cc4:	c95c                	sw	a5,20(a0)
 cc6:	49bc                	lw	a5,80(a1)
 cc8:	cd5c                	sw	a5,28(a0)
 cca:	4dbc                	lw	a5,88(a1)
 ccc:	d15c                	sw	a5,36(a0)
 cce:	8082                	ret

00000cd0 <__syscall_error>:
 cd0:	1141                	addi	sp,sp,-16
 cd2:	c422                	sw	s0,8(sp)
 cd4:	c606                	sw	ra,12(sp)
 cd6:	842a                	mv	s0,a0
 cd8:	24ad                	jal	f42 <__errno>
 cda:	408007b3          	neg	a5,s0
 cde:	40b2                	lw	ra,12(sp)
 ce0:	4422                	lw	s0,8(sp)
 ce2:	c11c                	sw	a5,0(a0)
 ce4:	557d                	li	a0,-1
 ce6:	0141                	addi	sp,sp,16
 ce8:	8082                	ret

00000cea <__internal_syscall>:
 cea:	88aa                	mv	a7,a0
 cec:	852e                	mv	a0,a1
 cee:	85b2                	mv	a1,a2
 cf0:	8636                	mv	a2,a3
 cf2:	86ba                	mv	a3,a4
 cf4:	00000073          	ecall
 cf8:	00055363          	bgez	a0,cfe <__internal_syscall+0x14>
 cfc:	bfd1                	j	cd0 <__syscall_error>
 cfe:	8082                	ret

00000d00 <open>:
 d00:	86b2                	mv	a3,a2
 d02:	4701                	li	a4,0
 d04:	862e                	mv	a2,a1
 d06:	85aa                	mv	a1,a0
 d08:	40000513          	li	a0,1024
 d0c:	bff9                	j	cea <__internal_syscall>

00000d0e <openat>:
 d0e:	8736                	mv	a4,a3
 d10:	86b2                	mv	a3,a2
 d12:	862e                	mv	a2,a1
 d14:	85aa                	mv	a1,a0
 d16:	03800513          	li	a0,56
 d1a:	bfc1                	j	cea <__internal_syscall>

00000d1c <lseek>:
 d1c:	86b2                	mv	a3,a2
 d1e:	4701                	li	a4,0
 d20:	862e                	mv	a2,a1
 d22:	85aa                	mv	a1,a0
 d24:	03e00513          	li	a0,62
 d28:	b7c9                	j	cea <__internal_syscall>

00000d2a <read>:
 d2a:	86b2                	mv	a3,a2
 d2c:	4701                	li	a4,0
 d2e:	862e                	mv	a2,a1
 d30:	85aa                	mv	a1,a0
 d32:	03f00513          	li	a0,63
 d36:	bf55                	j	cea <__internal_syscall>

00000d38 <write>:
 d38:	86b2                	mv	a3,a2
 d3a:	4701                	li	a4,0
 d3c:	862e                	mv	a2,a1
 d3e:	85aa                	mv	a1,a0
 d40:	04000513          	li	a0,64
 d44:	b75d                	j	cea <__internal_syscall>

00000d46 <fstat>:
 d46:	7119                	addi	sp,sp,-128
 d48:	daa6                	sw	s1,116(sp)
 d4a:	0030                	addi	a2,sp,8
 d4c:	84ae                	mv	s1,a1
 d4e:	4701                	li	a4,0
 d50:	85aa                	mv	a1,a0
 d52:	4681                	li	a3,0
 d54:	05000513          	li	a0,80
 d58:	de86                	sw	ra,124(sp)
 d5a:	dca2                	sw	s0,120(sp)
 d5c:	3779                	jal	cea <__internal_syscall>
 d5e:	842a                	mv	s0,a0
 d60:	002c                	addi	a1,sp,8
 d62:	8526                	mv	a0,s1
 d64:	372d                	jal	c8e <conv_stat>
 d66:	8522                	mv	a0,s0
 d68:	50f6                	lw	ra,124(sp)
 d6a:	5466                	lw	s0,120(sp)
 d6c:	54d6                	lw	s1,116(sp)
 d6e:	6109                	addi	sp,sp,128
 d70:	8082                	ret

00000d72 <stat>:
 d72:	7119                	addi	sp,sp,-128
 d74:	daa6                	sw	s1,116(sp)
 d76:	0030                	addi	a2,sp,8
 d78:	84ae                	mv	s1,a1
 d7a:	4701                	li	a4,0
 d7c:	85aa                	mv	a1,a0
 d7e:	4681                	li	a3,0
 d80:	40e00513          	li	a0,1038
 d84:	de86                	sw	ra,124(sp)
 d86:	dca2                	sw	s0,120(sp)
 d88:	378d                	jal	cea <__internal_syscall>
 d8a:	842a                	mv	s0,a0
 d8c:	002c                	addi	a1,sp,8
 d8e:	8526                	mv	a0,s1
 d90:	3dfd                	jal	c8e <conv_stat>
 d92:	8522                	mv	a0,s0
 d94:	50f6                	lw	ra,124(sp)
 d96:	5466                	lw	s0,120(sp)
 d98:	54d6                	lw	s1,116(sp)
 d9a:	6109                	addi	sp,sp,128
 d9c:	8082                	ret

00000d9e <lstat>:
 d9e:	7119                	addi	sp,sp,-128
 da0:	daa6                	sw	s1,116(sp)
 da2:	0030                	addi	a2,sp,8
 da4:	84ae                	mv	s1,a1
 da6:	4701                	li	a4,0
 da8:	85aa                	mv	a1,a0
 daa:	4681                	li	a3,0
 dac:	40f00513          	li	a0,1039
 db0:	de86                	sw	ra,124(sp)
 db2:	dca2                	sw	s0,120(sp)
 db4:	3f1d                	jal	cea <__internal_syscall>
 db6:	842a                	mv	s0,a0
 db8:	002c                	addi	a1,sp,8
 dba:	8526                	mv	a0,s1
 dbc:	3dc9                	jal	c8e <conv_stat>
 dbe:	8522                	mv	a0,s0
 dc0:	50f6                	lw	ra,124(sp)
 dc2:	5466                	lw	s0,120(sp)
 dc4:	54d6                	lw	s1,116(sp)
 dc6:	6109                	addi	sp,sp,128
 dc8:	8082                	ret

00000dca <fstatat>:
 dca:	7119                	addi	sp,sp,-128
 dcc:	daa6                	sw	s1,116(sp)
 dce:	8736                	mv	a4,a3
 dd0:	84b2                	mv	s1,a2
 dd2:	0034                	addi	a3,sp,8
 dd4:	862e                	mv	a2,a1
 dd6:	85aa                	mv	a1,a0
 dd8:	04f00513          	li	a0,79
 ddc:	de86                	sw	ra,124(sp)
 dde:	dca2                	sw	s0,120(sp)
 de0:	3729                	jal	cea <__internal_syscall>
 de2:	842a                	mv	s0,a0
 de4:	002c                	addi	a1,sp,8
 de6:	8526                	mv	a0,s1
 de8:	355d                	jal	c8e <conv_stat>
 dea:	8522                	mv	a0,s0
 dec:	50f6                	lw	ra,124(sp)
 dee:	5466                	lw	s0,120(sp)
 df0:	54d6                	lw	s1,116(sp)
 df2:	6109                	addi	sp,sp,128
 df4:	8082                	ret

00000df6 <access>:
 df6:	862e                	mv	a2,a1
 df8:	4701                	li	a4,0
 dfa:	85aa                	mv	a1,a0
 dfc:	4681                	li	a3,0
 dfe:	40900513          	li	a0,1033
 e02:	b5e5                	j	cea <__internal_syscall>

00000e04 <faccessat>:
 e04:	8736                	mv	a4,a3
 e06:	86b2                	mv	a3,a2
 e08:	862e                	mv	a2,a1
 e0a:	85aa                	mv	a1,a0
 e0c:	03000513          	li	a0,48
 e10:	bde9                	j	cea <__internal_syscall>

00000e12 <close>:
 e12:	85aa                	mv	a1,a0
 e14:	4701                	li	a4,0
 e16:	4681                	li	a3,0
 e18:	4601                	li	a2,0
 e1a:	03900513          	li	a0,57
 e1e:	b5f1                	j	cea <__internal_syscall>

00000e20 <link>:
 e20:	862e                	mv	a2,a1
 e22:	4701                	li	a4,0
 e24:	85aa                	mv	a1,a0
 e26:	4681                	li	a3,0
 e28:	40100513          	li	a0,1025
 e2c:	bd7d                	j	cea <__internal_syscall>

00000e2e <unlink>:
 e2e:	85aa                	mv	a1,a0
 e30:	4701                	li	a4,0
 e32:	4681                	li	a3,0
 e34:	4601                	li	a2,0
 e36:	40200513          	li	a0,1026
 e3a:	bd45                	j	cea <__internal_syscall>

00000e3c <execve>:
 e3c:	1141                	addi	sp,sp,-16
 e3e:	c606                	sw	ra,12(sp)
 e40:	2209                	jal	f42 <__errno>
 e42:	40b2                	lw	ra,12(sp)
 e44:	47b1                	li	a5,12
 e46:	c11c                	sw	a5,0(a0)
 e48:	557d                	li	a0,-1
 e4a:	0141                	addi	sp,sp,16
 e4c:	8082                	ret

00000e4e <fork>:
 e4e:	1141                	addi	sp,sp,-16
 e50:	c606                	sw	ra,12(sp)
 e52:	28c5                	jal	f42 <__errno>
 e54:	40b2                	lw	ra,12(sp)
 e56:	47ad                	li	a5,11
 e58:	c11c                	sw	a5,0(a0)
 e5a:	557d                	li	a0,-1
 e5c:	0141                	addi	sp,sp,16
 e5e:	8082                	ret

00000e60 <getpid>:
 e60:	4505                	li	a0,1
 e62:	8082                	ret

00000e64 <kill>:
 e64:	1141                	addi	sp,sp,-16
 e66:	c606                	sw	ra,12(sp)
 e68:	28e9                	jal	f42 <__errno>
 e6a:	40b2                	lw	ra,12(sp)
 e6c:	47d9                	li	a5,22
 e6e:	c11c                	sw	a5,0(a0)
 e70:	557d                	li	a0,-1
 e72:	0141                	addi	sp,sp,16
 e74:	8082                	ret

00000e76 <wait>:
 e76:	1141                	addi	sp,sp,-16
 e78:	c606                	sw	ra,12(sp)
 e7a:	20e1                	jal	f42 <__errno>
 e7c:	40b2                	lw	ra,12(sp)
 e7e:	47a9                	li	a5,10
 e80:	c11c                	sw	a5,0(a0)
 e82:	557d                	li	a0,-1
 e84:	0141                	addi	sp,sp,16
 e86:	8082                	ret

00000e88 <isatty>:
 e88:	715d                	addi	sp,sp,-80
 e8a:	004c                	addi	a1,sp,4
 e8c:	c686                	sw	ra,76(sp)
 e8e:	3d65                	jal	d46 <fstat>
 e90:	57fd                	li	a5,-1
 e92:	00f50563          	beq	a0,a5,e9c <isatty+0x14>
 e96:	4522                	lw	a0,8(sp)
 e98:	8135                	srli	a0,a0,0xd
 e9a:	8905                	andi	a0,a0,1
 e9c:	40b6                	lw	ra,76(sp)
 e9e:	6161                	addi	sp,sp,80
 ea0:	8082                	ret

00000ea2 <times>:
 ea2:	87aa                	mv	a5,a0
 ea4:	00028073          	scallimm	5
 ea8:	c799                	beqz	a5,eb6 <times+0x14>
 eaa:	c388                	sw	a0,0(a5)
 eac:	0007a223          	sw	zero,4(a5)
 eb0:	c788                	sw	a0,8(a5)
 eb2:	0007a623          	sw	zero,12(a5)
 eb6:	8082                	ret

00000eb8 <gettimeofday>:
 eb8:	85aa                	mv	a1,a0
 eba:	4701                	li	a4,0
 ebc:	4681                	li	a3,0
 ebe:	4601                	li	a2,0
 ec0:	0a900513          	li	a0,169
 ec4:	b51d                	j	cea <__internal_syscall>

00000ec6 <ftime>:
 ec6:	00051223          	sh	zero,4(a0)
 eca:	00052023          	sw	zero,0(a0)
 ece:	4501                	li	a0,0
 ed0:	8082                	ret

00000ed2 <utime>:
 ed2:	557d                	li	a0,-1
 ed4:	8082                	ret

00000ed6 <chown>:
 ed6:	557d                	li	a0,-1
 ed8:	8082                	ret

00000eda <chmod>:
 eda:	557d                	li	a0,-1
 edc:	8082                	ret

00000ede <chdir>:
 ede:	557d                	li	a0,-1
 ee0:	8082                	ret

00000ee2 <getcwd>:
 ee2:	4501                	li	a0,0
 ee4:	8082                	ret

00000ee6 <sysconf>:
 ee6:	4789                	li	a5,2
 ee8:	00f50463          	beq	a0,a5,ef0 <sysconf+0xa>
 eec:	557d                	li	a0,-1
 eee:	8082                	ret
 ef0:	6561                	lui	a0,0x18
 ef2:	6a050513          	addi	a0,a0,1696 # 186a0 <_stack_len+0x166a0>
 ef6:	8082                	ret

00000ef8 <sbrk>:
 ef8:	001016b7          	lui	a3,0x101
 efc:	8406a783          	lw	a5,-1984(a3) # 100840 <heap_ptr.2582>
 f00:	00107737          	lui	a4,0x107
 f04:	00072703          	lw	a4,0(a4) # 107000 <_stack>
 f08:	953e                	add	a0,a0,a5
 f0a:	6641                	lui	a2,0x10
 f0c:	8f09                	sub	a4,a4,a0
 f0e:	00e65663          	ble	a4,a2,f1a <sbrk+0x22>
 f12:	84a6a023          	sw	a0,-1984(a3)
 f16:	853e                	mv	a0,a5
 f18:	8082                	ret
 f1a:	1141                	addi	sp,sp,-16
 f1c:	c606                	sw	ra,12(sp)
 f1e:	2015                	jal	f42 <__errno>
 f20:	40b2                	lw	ra,12(sp)
 f22:	47b1                	li	a5,12
 f24:	c11c                	sw	a5,0(a0)
 f26:	57fd                	li	a5,-1
 f28:	853e                	mv	a0,a5
 f2a:	0141                	addi	sp,sp,16
 f2c:	8082                	ret

00000f2e <_exit>:
 f2e:	1141                	addi	sp,sp,-16
 f30:	85aa                	mv	a1,a0
 f32:	4701                	li	a4,0
 f34:	4681                	li	a3,0
 f36:	4601                	li	a2,0
 f38:	05d00513          	li	a0,93
 f3c:	c606                	sw	ra,12(sp)
 f3e:	3375                	jal	cea <__internal_syscall>
 f40:	a001                	j	f40 <_exit+0x12>

00000f42 <__errno>:
 f42:	001017b7          	lui	a5,0x101
 f46:	83c7a503          	lw	a0,-1988(a5) # 10083c <_impure_ptr>
 f4a:	8082                	ret

00000f4c <__CTOR_LIST__>:
	...

00000f54 <__CTOR_END__>:
	...

Disassembly of section .data:

00100000 <__malloc_av_>:
	...
  100008:	0000                	unimp
  10000a:	0010                	addi	a2,sp,0
  10000c:	0000                	unimp
  10000e:	0010                	addi	a2,sp,0
  100010:	0008                	addi	a0,sp,0
  100012:	0010                	addi	a2,sp,0
  100014:	0008                	addi	a0,sp,0
  100016:	0010                	addi	a2,sp,0
  100018:	0010                	addi	a2,sp,0
  10001a:	0010                	addi	a2,sp,0
  10001c:	0010                	addi	a2,sp,0
  10001e:	0010                	addi	a2,sp,0
  100020:	0018                	addi	a4,sp,0
  100022:	0010                	addi	a2,sp,0
  100024:	0018                	addi	a4,sp,0
  100026:	0010                	addi	a2,sp,0
  100028:	0020                	addi	s0,sp,8
  10002a:	0010                	addi	a2,sp,0
  10002c:	0020                	addi	s0,sp,8
  10002e:	0010                	addi	a2,sp,0
  100030:	0028                	addi	a0,sp,8
  100032:	0010                	addi	a2,sp,0
  100034:	0028                	addi	a0,sp,8
  100036:	0010                	addi	a2,sp,0
  100038:	0030                	addi	a2,sp,8
  10003a:	0010                	addi	a2,sp,0
  10003c:	0030                	addi	a2,sp,8
  10003e:	0010                	addi	a2,sp,0
  100040:	0038                	addi	a4,sp,8
  100042:	0010                	addi	a2,sp,0
  100044:	0038                	addi	a4,sp,8
  100046:	0010                	addi	a2,sp,0
  100048:	0040                	addi	s0,sp,4
  10004a:	0010                	addi	a2,sp,0
  10004c:	0040                	addi	s0,sp,4
  10004e:	0010                	addi	a2,sp,0
  100050:	0048                	addi	a0,sp,4
  100052:	0010                	addi	a2,sp,0
  100054:	0048                	addi	a0,sp,4
  100056:	0010                	addi	a2,sp,0
  100058:	0050                	addi	a2,sp,4
  10005a:	0010                	addi	a2,sp,0
  10005c:	0050                	addi	a2,sp,4
  10005e:	0010                	addi	a2,sp,0
  100060:	0058                	addi	a4,sp,4
  100062:	0010                	addi	a2,sp,0
  100064:	0058                	addi	a4,sp,4
  100066:	0010                	addi	a2,sp,0
  100068:	0060                	addi	s0,sp,12
  10006a:	0010                	addi	a2,sp,0
  10006c:	0060                	addi	s0,sp,12
  10006e:	0010                	addi	a2,sp,0
  100070:	0068                	addi	a0,sp,12
  100072:	0010                	addi	a2,sp,0
  100074:	0068                	addi	a0,sp,12
  100076:	0010                	addi	a2,sp,0
  100078:	0070                	addi	a2,sp,12
  10007a:	0010                	addi	a2,sp,0
  10007c:	0070                	addi	a2,sp,12
  10007e:	0010                	addi	a2,sp,0
  100080:	0078                	addi	a4,sp,12
  100082:	0010                	addi	a2,sp,0
  100084:	0078                	addi	a4,sp,12
  100086:	0010                	addi	a2,sp,0
  100088:	0080                	addi	s0,sp,64
  10008a:	0010                	addi	a2,sp,0
  10008c:	0080                	addi	s0,sp,64
  10008e:	0010                	addi	a2,sp,0
  100090:	0088                	addi	a0,sp,64
  100092:	0010                	addi	a2,sp,0
  100094:	0088                	addi	a0,sp,64
  100096:	0010                	addi	a2,sp,0
  100098:	0090                	addi	a2,sp,64
  10009a:	0010                	addi	a2,sp,0
  10009c:	0090                	addi	a2,sp,64
  10009e:	0010                	addi	a2,sp,0
  1000a0:	0098                	addi	a4,sp,64
  1000a2:	0010                	addi	a2,sp,0
  1000a4:	0098                	addi	a4,sp,64
  1000a6:	0010                	addi	a2,sp,0
  1000a8:	00a0                	addi	s0,sp,72
  1000aa:	0010                	addi	a2,sp,0
  1000ac:	00a0                	addi	s0,sp,72
  1000ae:	0010                	addi	a2,sp,0
  1000b0:	00a8                	addi	a0,sp,72
  1000b2:	0010                	addi	a2,sp,0
  1000b4:	00a8                	addi	a0,sp,72
  1000b6:	0010                	addi	a2,sp,0
  1000b8:	00b0                	addi	a2,sp,72
  1000ba:	0010                	addi	a2,sp,0
  1000bc:	00b0                	addi	a2,sp,72
  1000be:	0010                	addi	a2,sp,0
  1000c0:	00b8                	addi	a4,sp,72
  1000c2:	0010                	addi	a2,sp,0
  1000c4:	00b8                	addi	a4,sp,72
  1000c6:	0010                	addi	a2,sp,0
  1000c8:	00c0                	addi	s0,sp,68
  1000ca:	0010                	addi	a2,sp,0
  1000cc:	00c0                	addi	s0,sp,68
  1000ce:	0010                	addi	a2,sp,0
  1000d0:	00c8                	addi	a0,sp,68
  1000d2:	0010                	addi	a2,sp,0
  1000d4:	00c8                	addi	a0,sp,68
  1000d6:	0010                	addi	a2,sp,0
  1000d8:	00d0                	addi	a2,sp,68
  1000da:	0010                	addi	a2,sp,0
  1000dc:	00d0                	addi	a2,sp,68
  1000de:	0010                	addi	a2,sp,0
  1000e0:	00d8                	addi	a4,sp,68
  1000e2:	0010                	addi	a2,sp,0
  1000e4:	00d8                	addi	a4,sp,68
  1000e6:	0010                	addi	a2,sp,0
  1000e8:	00e0                	addi	s0,sp,76
  1000ea:	0010                	addi	a2,sp,0
  1000ec:	00e0                	addi	s0,sp,76
  1000ee:	0010                	addi	a2,sp,0
  1000f0:	00e8                	addi	a0,sp,76
  1000f2:	0010                	addi	a2,sp,0
  1000f4:	00e8                	addi	a0,sp,76
  1000f6:	0010                	addi	a2,sp,0
  1000f8:	00f0                	addi	a2,sp,76
  1000fa:	0010                	addi	a2,sp,0
  1000fc:	00f0                	addi	a2,sp,76
  1000fe:	0010                	addi	a2,sp,0
  100100:	00f8                	addi	a4,sp,76
  100102:	0010                	addi	a2,sp,0
  100104:	00f8                	addi	a4,sp,76
  100106:	0010                	addi	a2,sp,0
  100108:	0100                	addi	s0,sp,128
  10010a:	0010                	addi	a2,sp,0
  10010c:	0100                	addi	s0,sp,128
  10010e:	0010                	addi	a2,sp,0
  100110:	0108                	addi	a0,sp,128
  100112:	0010                	addi	a2,sp,0
  100114:	0108                	addi	a0,sp,128
  100116:	0010                	addi	a2,sp,0
  100118:	0110                	addi	a2,sp,128
  10011a:	0010                	addi	a2,sp,0
  10011c:	0110                	addi	a2,sp,128
  10011e:	0010                	addi	a2,sp,0
  100120:	0118                	addi	a4,sp,128
  100122:	0010                	addi	a2,sp,0
  100124:	0118                	addi	a4,sp,128
  100126:	0010                	addi	a2,sp,0
  100128:	0120                	addi	s0,sp,136
  10012a:	0010                	addi	a2,sp,0
  10012c:	0120                	addi	s0,sp,136
  10012e:	0010                	addi	a2,sp,0
  100130:	0128                	addi	a0,sp,136
  100132:	0010                	addi	a2,sp,0
  100134:	0128                	addi	a0,sp,136
  100136:	0010                	addi	a2,sp,0
  100138:	0130                	addi	a2,sp,136
  10013a:	0010                	addi	a2,sp,0
  10013c:	0130                	addi	a2,sp,136
  10013e:	0010                	addi	a2,sp,0
  100140:	0138                	addi	a4,sp,136
  100142:	0010                	addi	a2,sp,0
  100144:	0138                	addi	a4,sp,136
  100146:	0010                	addi	a2,sp,0
  100148:	0140                	addi	s0,sp,132
  10014a:	0010                	addi	a2,sp,0
  10014c:	0140                	addi	s0,sp,132
  10014e:	0010                	addi	a2,sp,0
  100150:	0148                	addi	a0,sp,132
  100152:	0010                	addi	a2,sp,0
  100154:	0148                	addi	a0,sp,132
  100156:	0010                	addi	a2,sp,0
  100158:	0150                	addi	a2,sp,132
  10015a:	0010                	addi	a2,sp,0
  10015c:	0150                	addi	a2,sp,132
  10015e:	0010                	addi	a2,sp,0
  100160:	0158                	addi	a4,sp,132
  100162:	0010                	addi	a2,sp,0
  100164:	0158                	addi	a4,sp,132
  100166:	0010                	addi	a2,sp,0
  100168:	0160                	addi	s0,sp,140
  10016a:	0010                	addi	a2,sp,0
  10016c:	0160                	addi	s0,sp,140
  10016e:	0010                	addi	a2,sp,0
  100170:	0168                	addi	a0,sp,140
  100172:	0010                	addi	a2,sp,0
  100174:	0168                	addi	a0,sp,140
  100176:	0010                	addi	a2,sp,0
  100178:	0170                	addi	a2,sp,140
  10017a:	0010                	addi	a2,sp,0
  10017c:	0170                	addi	a2,sp,140
  10017e:	0010                	addi	a2,sp,0
  100180:	0178                	addi	a4,sp,140
  100182:	0010                	addi	a2,sp,0
  100184:	0178                	addi	a4,sp,140
  100186:	0010                	addi	a2,sp,0
  100188:	0180                	addi	s0,sp,192
  10018a:	0010                	addi	a2,sp,0
  10018c:	0180                	addi	s0,sp,192
  10018e:	0010                	addi	a2,sp,0
  100190:	0188                	addi	a0,sp,192
  100192:	0010                	addi	a2,sp,0
  100194:	0188                	addi	a0,sp,192
  100196:	0010                	addi	a2,sp,0
  100198:	0190                	addi	a2,sp,192
  10019a:	0010                	addi	a2,sp,0
  10019c:	0190                	addi	a2,sp,192
  10019e:	0010                	addi	a2,sp,0
  1001a0:	0198                	addi	a4,sp,192
  1001a2:	0010                	addi	a2,sp,0
  1001a4:	0198                	addi	a4,sp,192
  1001a6:	0010                	addi	a2,sp,0
  1001a8:	01a0                	addi	s0,sp,200
  1001aa:	0010                	addi	a2,sp,0
  1001ac:	01a0                	addi	s0,sp,200
  1001ae:	0010                	addi	a2,sp,0
  1001b0:	01a8                	addi	a0,sp,200
  1001b2:	0010                	addi	a2,sp,0
  1001b4:	01a8                	addi	a0,sp,200
  1001b6:	0010                	addi	a2,sp,0
  1001b8:	01b0                	addi	a2,sp,200
  1001ba:	0010                	addi	a2,sp,0
  1001bc:	01b0                	addi	a2,sp,200
  1001be:	0010                	addi	a2,sp,0
  1001c0:	01b8                	addi	a4,sp,200
  1001c2:	0010                	addi	a2,sp,0
  1001c4:	01b8                	addi	a4,sp,200
  1001c6:	0010                	addi	a2,sp,0
  1001c8:	01c0                	addi	s0,sp,196
  1001ca:	0010                	addi	a2,sp,0
  1001cc:	01c0                	addi	s0,sp,196
  1001ce:	0010                	addi	a2,sp,0
  1001d0:	01c8                	addi	a0,sp,196
  1001d2:	0010                	addi	a2,sp,0
  1001d4:	01c8                	addi	a0,sp,196
  1001d6:	0010                	addi	a2,sp,0
  1001d8:	01d0                	addi	a2,sp,196
  1001da:	0010                	addi	a2,sp,0
  1001dc:	01d0                	addi	a2,sp,196
  1001de:	0010                	addi	a2,sp,0
  1001e0:	01d8                	addi	a4,sp,196
  1001e2:	0010                	addi	a2,sp,0
  1001e4:	01d8                	addi	a4,sp,196
  1001e6:	0010                	addi	a2,sp,0
  1001e8:	01e0                	addi	s0,sp,204
  1001ea:	0010                	addi	a2,sp,0
  1001ec:	01e0                	addi	s0,sp,204
  1001ee:	0010                	addi	a2,sp,0
  1001f0:	01e8                	addi	a0,sp,204
  1001f2:	0010                	addi	a2,sp,0
  1001f4:	01e8                	addi	a0,sp,204
  1001f6:	0010                	addi	a2,sp,0
  1001f8:	01f0                	addi	a2,sp,204
  1001fa:	0010                	addi	a2,sp,0
  1001fc:	01f0                	addi	a2,sp,204
  1001fe:	0010                	addi	a2,sp,0
  100200:	01f8                	addi	a4,sp,204
  100202:	0010                	addi	a2,sp,0
  100204:	01f8                	addi	a4,sp,204
  100206:	0010                	addi	a2,sp,0
  100208:	0200                	addi	s0,sp,256
  10020a:	0010                	addi	a2,sp,0
  10020c:	0200                	addi	s0,sp,256
  10020e:	0010                	addi	a2,sp,0
  100210:	0208                	addi	a0,sp,256
  100212:	0010                	addi	a2,sp,0
  100214:	0208                	addi	a0,sp,256
  100216:	0010                	addi	a2,sp,0
  100218:	0210                	addi	a2,sp,256
  10021a:	0010                	addi	a2,sp,0
  10021c:	0210                	addi	a2,sp,256
  10021e:	0010                	addi	a2,sp,0
  100220:	0218                	addi	a4,sp,256
  100222:	0010                	addi	a2,sp,0
  100224:	0218                	addi	a4,sp,256
  100226:	0010                	addi	a2,sp,0
  100228:	0220                	addi	s0,sp,264
  10022a:	0010                	addi	a2,sp,0
  10022c:	0220                	addi	s0,sp,264
  10022e:	0010                	addi	a2,sp,0
  100230:	0228                	addi	a0,sp,264
  100232:	0010                	addi	a2,sp,0
  100234:	0228                	addi	a0,sp,264
  100236:	0010                	addi	a2,sp,0
  100238:	0230                	addi	a2,sp,264
  10023a:	0010                	addi	a2,sp,0
  10023c:	0230                	addi	a2,sp,264
  10023e:	0010                	addi	a2,sp,0
  100240:	0238                	addi	a4,sp,264
  100242:	0010                	addi	a2,sp,0
  100244:	0238                	addi	a4,sp,264
  100246:	0010                	addi	a2,sp,0
  100248:	0240                	addi	s0,sp,260
  10024a:	0010                	addi	a2,sp,0
  10024c:	0240                	addi	s0,sp,260
  10024e:	0010                	addi	a2,sp,0
  100250:	0248                	addi	a0,sp,260
  100252:	0010                	addi	a2,sp,0
  100254:	0248                	addi	a0,sp,260
  100256:	0010                	addi	a2,sp,0
  100258:	0250                	addi	a2,sp,260
  10025a:	0010                	addi	a2,sp,0
  10025c:	0250                	addi	a2,sp,260
  10025e:	0010                	addi	a2,sp,0
  100260:	0258                	addi	a4,sp,260
  100262:	0010                	addi	a2,sp,0
  100264:	0258                	addi	a4,sp,260
  100266:	0010                	addi	a2,sp,0
  100268:	0260                	addi	s0,sp,268
  10026a:	0010                	addi	a2,sp,0
  10026c:	0260                	addi	s0,sp,268
  10026e:	0010                	addi	a2,sp,0
  100270:	0268                	addi	a0,sp,268
  100272:	0010                	addi	a2,sp,0
  100274:	0268                	addi	a0,sp,268
  100276:	0010                	addi	a2,sp,0
  100278:	0270                	addi	a2,sp,268
  10027a:	0010                	addi	a2,sp,0
  10027c:	0270                	addi	a2,sp,268
  10027e:	0010                	addi	a2,sp,0
  100280:	0278                	addi	a4,sp,268
  100282:	0010                	addi	a2,sp,0
  100284:	0278                	addi	a4,sp,268
  100286:	0010                	addi	a2,sp,0
  100288:	0280                	addi	s0,sp,320
  10028a:	0010                	addi	a2,sp,0
  10028c:	0280                	addi	s0,sp,320
  10028e:	0010                	addi	a2,sp,0
  100290:	0288                	addi	a0,sp,320
  100292:	0010                	addi	a2,sp,0
  100294:	0288                	addi	a0,sp,320
  100296:	0010                	addi	a2,sp,0
  100298:	0290                	addi	a2,sp,320
  10029a:	0010                	addi	a2,sp,0
  10029c:	0290                	addi	a2,sp,320
  10029e:	0010                	addi	a2,sp,0
  1002a0:	0298                	addi	a4,sp,320
  1002a2:	0010                	addi	a2,sp,0
  1002a4:	0298                	addi	a4,sp,320
  1002a6:	0010                	addi	a2,sp,0
  1002a8:	02a0                	addi	s0,sp,328
  1002aa:	0010                	addi	a2,sp,0
  1002ac:	02a0                	addi	s0,sp,328
  1002ae:	0010                	addi	a2,sp,0
  1002b0:	02a8                	addi	a0,sp,328
  1002b2:	0010                	addi	a2,sp,0
  1002b4:	02a8                	addi	a0,sp,328
  1002b6:	0010                	addi	a2,sp,0
  1002b8:	02b0                	addi	a2,sp,328
  1002ba:	0010                	addi	a2,sp,0
  1002bc:	02b0                	addi	a2,sp,328
  1002be:	0010                	addi	a2,sp,0
  1002c0:	02b8                	addi	a4,sp,328
  1002c2:	0010                	addi	a2,sp,0
  1002c4:	02b8                	addi	a4,sp,328
  1002c6:	0010                	addi	a2,sp,0
  1002c8:	02c0                	addi	s0,sp,324
  1002ca:	0010                	addi	a2,sp,0
  1002cc:	02c0                	addi	s0,sp,324
  1002ce:	0010                	addi	a2,sp,0
  1002d0:	02c8                	addi	a0,sp,324
  1002d2:	0010                	addi	a2,sp,0
  1002d4:	02c8                	addi	a0,sp,324
  1002d6:	0010                	addi	a2,sp,0
  1002d8:	02d0                	addi	a2,sp,324
  1002da:	0010                	addi	a2,sp,0
  1002dc:	02d0                	addi	a2,sp,324
  1002de:	0010                	addi	a2,sp,0
  1002e0:	02d8                	addi	a4,sp,324
  1002e2:	0010                	addi	a2,sp,0
  1002e4:	02d8                	addi	a4,sp,324
  1002e6:	0010                	addi	a2,sp,0
  1002e8:	02e0                	addi	s0,sp,332
  1002ea:	0010                	addi	a2,sp,0
  1002ec:	02e0                	addi	s0,sp,332
  1002ee:	0010                	addi	a2,sp,0
  1002f0:	02e8                	addi	a0,sp,332
  1002f2:	0010                	addi	a2,sp,0
  1002f4:	02e8                	addi	a0,sp,332
  1002f6:	0010                	addi	a2,sp,0
  1002f8:	02f0                	addi	a2,sp,332
  1002fa:	0010                	addi	a2,sp,0
  1002fc:	02f0                	addi	a2,sp,332
  1002fe:	0010                	addi	a2,sp,0
  100300:	02f8                	addi	a4,sp,332
  100302:	0010                	addi	a2,sp,0
  100304:	02f8                	addi	a4,sp,332
  100306:	0010                	addi	a2,sp,0
  100308:	0300                	addi	s0,sp,384
  10030a:	0010                	addi	a2,sp,0
  10030c:	0300                	addi	s0,sp,384
  10030e:	0010                	addi	a2,sp,0
  100310:	0308                	addi	a0,sp,384
  100312:	0010                	addi	a2,sp,0
  100314:	0308                	addi	a0,sp,384
  100316:	0010                	addi	a2,sp,0
  100318:	0310                	addi	a2,sp,384
  10031a:	0010                	addi	a2,sp,0
  10031c:	0310                	addi	a2,sp,384
  10031e:	0010                	addi	a2,sp,0
  100320:	0318                	addi	a4,sp,384
  100322:	0010                	addi	a2,sp,0
  100324:	0318                	addi	a4,sp,384
  100326:	0010                	addi	a2,sp,0
  100328:	0320                	addi	s0,sp,392
  10032a:	0010                	addi	a2,sp,0
  10032c:	0320                	addi	s0,sp,392
  10032e:	0010                	addi	a2,sp,0
  100330:	0328                	addi	a0,sp,392
  100332:	0010                	addi	a2,sp,0
  100334:	0328                	addi	a0,sp,392
  100336:	0010                	addi	a2,sp,0
  100338:	0330                	addi	a2,sp,392
  10033a:	0010                	addi	a2,sp,0
  10033c:	0330                	addi	a2,sp,392
  10033e:	0010                	addi	a2,sp,0
  100340:	0338                	addi	a4,sp,392
  100342:	0010                	addi	a2,sp,0
  100344:	0338                	addi	a4,sp,392
  100346:	0010                	addi	a2,sp,0
  100348:	0340                	addi	s0,sp,388
  10034a:	0010                	addi	a2,sp,0
  10034c:	0340                	addi	s0,sp,388
  10034e:	0010                	addi	a2,sp,0
  100350:	0348                	addi	a0,sp,388
  100352:	0010                	addi	a2,sp,0
  100354:	0348                	addi	a0,sp,388
  100356:	0010                	addi	a2,sp,0
  100358:	0350                	addi	a2,sp,388
  10035a:	0010                	addi	a2,sp,0
  10035c:	0350                	addi	a2,sp,388
  10035e:	0010                	addi	a2,sp,0
  100360:	0358                	addi	a4,sp,388
  100362:	0010                	addi	a2,sp,0
  100364:	0358                	addi	a4,sp,388
  100366:	0010                	addi	a2,sp,0
  100368:	0360                	addi	s0,sp,396
  10036a:	0010                	addi	a2,sp,0
  10036c:	0360                	addi	s0,sp,396
  10036e:	0010                	addi	a2,sp,0
  100370:	0368                	addi	a0,sp,396
  100372:	0010                	addi	a2,sp,0
  100374:	0368                	addi	a0,sp,396
  100376:	0010                	addi	a2,sp,0
  100378:	0370                	addi	a2,sp,396
  10037a:	0010                	addi	a2,sp,0
  10037c:	0370                	addi	a2,sp,396
  10037e:	0010                	addi	a2,sp,0
  100380:	0378                	addi	a4,sp,396
  100382:	0010                	addi	a2,sp,0
  100384:	0378                	addi	a4,sp,396
  100386:	0010                	addi	a2,sp,0
  100388:	0380                	addi	s0,sp,448
  10038a:	0010                	addi	a2,sp,0
  10038c:	0380                	addi	s0,sp,448
  10038e:	0010                	addi	a2,sp,0
  100390:	0388                	addi	a0,sp,448
  100392:	0010                	addi	a2,sp,0
  100394:	0388                	addi	a0,sp,448
  100396:	0010                	addi	a2,sp,0
  100398:	0390                	addi	a2,sp,448
  10039a:	0010                	addi	a2,sp,0
  10039c:	0390                	addi	a2,sp,448
  10039e:	0010                	addi	a2,sp,0
  1003a0:	0398                	addi	a4,sp,448
  1003a2:	0010                	addi	a2,sp,0
  1003a4:	0398                	addi	a4,sp,448
  1003a6:	0010                	addi	a2,sp,0
  1003a8:	03a0                	addi	s0,sp,456
  1003aa:	0010                	addi	a2,sp,0
  1003ac:	03a0                	addi	s0,sp,456
  1003ae:	0010                	addi	a2,sp,0
  1003b0:	03a8                	addi	a0,sp,456
  1003b2:	0010                	addi	a2,sp,0
  1003b4:	03a8                	addi	a0,sp,456
  1003b6:	0010                	addi	a2,sp,0
  1003b8:	03b0                	addi	a2,sp,456
  1003ba:	0010                	addi	a2,sp,0
  1003bc:	03b0                	addi	a2,sp,456
  1003be:	0010                	addi	a2,sp,0
  1003c0:	03b8                	addi	a4,sp,456
  1003c2:	0010                	addi	a2,sp,0
  1003c4:	03b8                	addi	a4,sp,456
  1003c6:	0010                	addi	a2,sp,0
  1003c8:	03c0                	addi	s0,sp,452
  1003ca:	0010                	addi	a2,sp,0
  1003cc:	03c0                	addi	s0,sp,452
  1003ce:	0010                	addi	a2,sp,0
  1003d0:	03c8                	addi	a0,sp,452
  1003d2:	0010                	addi	a2,sp,0
  1003d4:	03c8                	addi	a0,sp,452
  1003d6:	0010                	addi	a2,sp,0
  1003d8:	03d0                	addi	a2,sp,452
  1003da:	0010                	addi	a2,sp,0
  1003dc:	03d0                	addi	a2,sp,452
  1003de:	0010                	addi	a2,sp,0
  1003e0:	03d8                	addi	a4,sp,452
  1003e2:	0010                	addi	a2,sp,0
  1003e4:	03d8                	addi	a4,sp,452
  1003e6:	0010                	addi	a2,sp,0
  1003e8:	03e0                	addi	s0,sp,460
  1003ea:	0010                	addi	a2,sp,0
  1003ec:	03e0                	addi	s0,sp,460
  1003ee:	0010                	addi	a2,sp,0
  1003f0:	03e8                	addi	a0,sp,460
  1003f2:	0010                	addi	a2,sp,0
  1003f4:	03e8                	addi	a0,sp,460
  1003f6:	0010                	addi	a2,sp,0
  1003f8:	03f0                	addi	a2,sp,460
  1003fa:	0010                	addi	a2,sp,0
  1003fc:	03f0                	addi	a2,sp,460
  1003fe:	0010                	addi	a2,sp,0
  100400:	03f8                	addi	a4,sp,460
  100402:	0010                	addi	a2,sp,0
  100404:	03f8                	addi	a4,sp,460
  100406:	0010                	addi	a2,sp,0

00100408 <impure_data>:
  100408:	0000                	unimp
  10040a:	0000                	unimp
  10040c:	06f4                	addi	a3,sp,844
  10040e:	0010                	addi	a2,sp,0
  100410:	075c                	addi	a5,sp,900
  100412:	0010                	addi	a2,sp,0
  100414:	07c4                	addi	s1,sp,964
  100416:	0010                	addi	a2,sp,0
	...
  1004b0:	0001                	nop
  1004b2:	0000                	unimp
  1004b4:	0000                	unimp
  1004b6:	0000                	unimp
  1004b8:	330e                	fld	ft6,224(sp)
  1004ba:	abcd                	j	100aac <_bss_end+0x230>
  1004bc:	1234                	addi	a3,sp,296
  1004be:	e66d                	bnez	a2,1005a8 <impure_data+0x1a0>
  1004c0:	deec                	sw	a1,124(a3)
  1004c2:	0005                	c.addi	zero,1
  1004c4:	0000000b          	p.lb	zero,0(zero!) # 0 <__DYNAMIC>
	...

Disassembly of section .sdata:

00100830 <__malloc_sbrk_base>:
  100830:	ffff                	0xffff
  100832:	ffff                	0xffff

00100834 <__malloc_trim_threshold>:
  100834:	0000                	unimp
  100836:	0002                	0x2

00100838 <_global_impure_ptr>:
  100838:	0408                	addi	a0,sp,512
  10083a:	0010                	addi	a2,sp,0

0010083c <_impure_ptr>:
  10083c:	0408                	addi	a0,sp,512
  10083e:	0010                	addi	a2,sp,0

00100840 <heap_ptr.2582>:
  100840:	087c                	addi	a5,sp,28
  100842:	0010                	addi	a2,sp,0

Disassembly of section .bss:

00100844 <__malloc_current_mallinfo>:
	...

0010086c <__malloc_max_total_mem>:
  10086c:	0000                	unimp
	...

00100870 <__malloc_max_sbrked_mem>:
  100870:	0000                	unimp
	...

00100874 <__malloc_top_pad>:
  100874:	0000                	unimp
	...

00100878 <errno>:
  100878:	0000                	unimp
	...

Disassembly of section .stack:

00106000 <_stack-0x1000>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3720                	fld	fs0,104(a4)
   c:	312e                	fld	ft2,232(sp)
   e:	312e                	fld	ft2,232(sp)
  10:	3220                	fld	fs0,96(a2)
  12:	3130                	fld	fa2,96(a0)
  14:	30353037          	lui	zero,0x30353
  18:	0039                	c.addi	zero,14

Disassembly of section .Pulp_Chip.Info:

00000000 <.Pulp_Chip.Info>:
   0:	000a                	0xa
   2:	0000                	unimp
   4:	0038                	addi	a4,sp,8
   6:	0000                	unimp
   8:	0001                	nop
   a:	0000                	unimp
   c:	7550                	flw	fa2,44(a0)
   e:	706c                	flw	fa1,100(s0)
  10:	495f 666e 006f      	0x6f666e495f
  16:	70696863          	bltu	s2,t1,726 <_malloc_r+0x1da>
  1a:	6e3d                	lui	t3,0xf
  1c:	20656e6f          	jal	t3,56222 <_stack_len+0x54222>
  20:	3d757063          	bleu	s7,a0,3e0 <kuznechik_set_csr+0x1e>
  24:	6f6e                	flw	ft10,216(sp)
  26:	656e                	flw	fa0,216(sp)
  28:	7020                	flw	fs0,96(s0)
  2a:	3d65                	jal	fffffee2 <pulp__FC+0xfffffee3>
  2c:	312d                	jal	fffffc56 <pulp__FC+0xfffffc57>
  2e:	6620                	flw	fs0,72(a2)
  30:	312d3d63          	p.bneimm	s10,-14,34a <kuznechik_write_data_in+0x2c>
  34:	6c20                	flw	fs0,88(s0)
  36:	3d32                	fld	fs10,296(sp)
  38:	312d                	jal	fffffc62 <pulp__FC+0xfffffc63>
  3a:	6c20                	flw	fs0,88(s0)
  3c:	6331                	lui	t1,0xc
  3e:	3d6c                	fld	fa1,248(a0)
  40:	312d                	jal	fffffc6a <pulp__FC+0xfffffc6b>
  42:	6c20                	flw	fs0,88(s0)
  44:	6631                	lui	a2,0xc
  46:	312d3d63          	p.bneimm	s10,-14,360 <kuznechik_write_data_in+0x42>
  4a:	0000                	unimp
	...
