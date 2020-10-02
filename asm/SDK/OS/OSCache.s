.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global DCEnable
DCEnable:
/* 8026A614 00266274  7C 00 04 AC */	sync 0
/* 8026A618 00266278  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 8026A61C 0026627C  60 63 40 00 */	ori r3, r3, 0x4000
/* 8026A620 00266280  7C 70 FB A6 */	mtspr 0x3f0, r3
/* 8026A624 00266284  4E 80 00 20 */	blr

.global DCInvalidateRange
DCInvalidateRange:
/* 8026A628 00266288  28 04 00 00 */	cmplwi r4, 0
/* 8026A62C 0026628C  4C 81 00 20 */	blelr
/* 8026A630 00266290  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A634 00266294  7C 84 2A 14 */	add r4, r4, r5
/* 8026A638 00266298  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A63C 0026629C  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A640 002662A0  7C 89 03 A6 */	mtctr r4
lbl_8026A644:
/* 8026A644 002662A4  7C 00 1B AC */	dcbi 0, r3
/* 8026A648 002662A8  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A64C 002662AC  42 00 FF F8 */	bdnz lbl_8026A644
/* 8026A650 002662B0  4E 80 00 20 */	blr

.global DCFlushRange
DCFlushRange:
/* 8026A654 002662B4  28 04 00 00 */	cmplwi r4, 0
/* 8026A658 002662B8  4C 81 00 20 */	blelr
/* 8026A65C 002662BC  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A660 002662C0  7C 84 2A 14 */	add r4, r4, r5
/* 8026A664 002662C4  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A668 002662C8  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A66C 002662CC  7C 89 03 A6 */	mtctr r4
lbl_8026A670:
/* 8026A670 002662D0  7C 00 18 AC */	dcbf 0, r3
/* 8026A674 002662D4  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A678 002662D8  42 00 FF F8 */	bdnz lbl_8026A670
/* 8026A67C 002662DC  44 00 00 02 */	sc
/* 8026A680 002662E0  4E 80 00 20 */	blr

.global DCStoreRange
DCStoreRange:
/* 8026A684 002662E4  28 04 00 00 */	cmplwi r4, 0
/* 8026A688 002662E8  4C 81 00 20 */	blelr
/* 8026A68C 002662EC  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A690 002662F0  7C 84 2A 14 */	add r4, r4, r5
/* 8026A694 002662F4  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A698 002662F8  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A69C 002662FC  7C 89 03 A6 */	mtctr r4
lbl_8026A6A0:
/* 8026A6A0 00266300  7C 00 18 6C */	dcbst 0, r3
/* 8026A6A4 00266304  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A6A8 00266308  42 00 FF F8 */	bdnz lbl_8026A6A0
/* 8026A6AC 0026630C  44 00 00 02 */	sc
/* 8026A6B0 00266310  4E 80 00 20 */	blr

.global DCFlushRangeNoSync
DCFlushRangeNoSync:
/* 8026A6B4 00266314  28 04 00 00 */	cmplwi r4, 0
/* 8026A6B8 00266318  4C 81 00 20 */	blelr
/* 8026A6BC 0026631C  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A6C0 00266320  7C 84 2A 14 */	add r4, r4, r5
/* 8026A6C4 00266324  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A6C8 00266328  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A6CC 0026632C  7C 89 03 A6 */	mtctr r4
lbl_8026A6D0:
/* 8026A6D0 00266330  7C 00 18 AC */	dcbf 0, r3
/* 8026A6D4 00266334  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A6D8 00266338  42 00 FF F8 */	bdnz lbl_8026A6D0
/* 8026A6DC 0026633C  4E 80 00 20 */	blr

.global DCStoreRangeNoSync
DCStoreRangeNoSync:
/* 8026A6E0 00266340  28 04 00 00 */	cmplwi r4, 0
/* 8026A6E4 00266344  4C 81 00 20 */	blelr
/* 8026A6E8 00266348  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A6EC 0026634C  7C 84 2A 14 */	add r4, r4, r5
/* 8026A6F0 00266350  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A6F4 00266354  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A6F8 00266358  7C 89 03 A6 */	mtctr r4
lbl_8026A6FC:
/* 8026A6FC 0026635C  7C 00 18 6C */	dcbst 0, r3
/* 8026A700 00266360  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A704 00266364  42 00 FF F8 */	bdnz lbl_8026A6FC
/* 8026A708 00266368  4E 80 00 20 */	blr

.global DCZeroRange
DCZeroRange:
/* 8026A70C 0026636C  28 04 00 00 */	cmplwi r4, 0
/* 8026A710 00266370  4C 81 00 20 */	blelr
/* 8026A714 00266374  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A718 00266378  7C 84 2A 14 */	add r4, r4, r5
/* 8026A71C 0026637C  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A720 00266380  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A724 00266384  7C 89 03 A6 */	mtctr r4
lbl_8026A728:
/* 8026A728 00266388  7C 00 1F EC */	dcbz 0, r3
/* 8026A72C 0026638C  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A730 00266390  42 00 FF F8 */	bdnz lbl_8026A728
/* 8026A734 00266394  4E 80 00 20 */	blr

.global ICInvalidateRange
ICInvalidateRange:
/* 8026A738 00266398  28 04 00 00 */	cmplwi r4, 0
/* 8026A73C 0026639C  4C 81 00 20 */	blelr
/* 8026A740 002663A0  54 65 06 FE */	clrlwi r5, r3, 0x1b
/* 8026A744 002663A4  7C 84 2A 14 */	add r4, r4, r5
/* 8026A748 002663A8  38 84 00 1F */	addi r4, r4, 0x1f
/* 8026A74C 002663AC  54 84 D9 7E */	srwi r4, r4, 5
/* 8026A750 002663B0  7C 89 03 A6 */	mtctr r4
lbl_8026A754:
/* 8026A754 002663B4  7C 00 1F AC */	icbi 0, r3
/* 8026A758 002663B8  38 63 00 20 */	addi r3, r3, 0x20
/* 8026A75C 002663BC  42 00 FF F8 */	bdnz lbl_8026A754
/* 8026A760 002663C0  7C 00 04 AC */	sync 0
/* 8026A764 002663C4  4C 00 01 2C */	isync
/* 8026A768 002663C8  4E 80 00 20 */	blr

.global ICFlashInvalidate
ICFlashInvalidate:
/* 8026A76C 002663CC  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 8026A770 002663D0  60 63 08 00 */	ori r3, r3, 0x800
/* 8026A774 002663D4  7C 70 FB A6 */	mtspr 0x3f0, r3
/* 8026A778 002663D8  4E 80 00 20 */	blr

.global ICEnable
ICEnable:
/* 8026A77C 002663DC  4C 00 01 2C */	isync
/* 8026A780 002663E0  7C 70 FA A6 */	mfspr r3, 0x3f0
/* 8026A784 002663E4  60 63 80 00 */	ori r3, r3, 0x8000
/* 8026A788 002663E8  7C 70 FB A6 */	mtspr 0x3f0, r3
/* 8026A78C 002663EC  4E 80 00 20 */	blr

.global __LCEnable
__LCEnable:
/* 8026A790 002663F0  7C A0 00 A6 */	mfmsr r5
/* 8026A794 002663F4  60 A5 10 00 */	ori r5, r5, 0x1000
/* 8026A798 002663F8  7C A0 01 24 */	mtmsr r5
/* 8026A79C 002663FC  3C 60 80 00 */	lis r3, 0x80000020@ha
/* 8026A7A0 00266400  38 80 04 00 */	li r4, 0x400
/* 8026A7A4 00266404  7C 89 03 A6 */	mtctr r4
lbl_8026A7A8:
/* 8026A7A8 00266408  7C 00 1A 2C */	dcbt 0, r3
/* 8026A7AC 0026640C  7C 00 18 6C */	dcbst 0, r3
/* 8026A7B0 00266410  38 63 00 20 */	addi r3, r3, 0x80000020@l
/* 8026A7B4 00266414  42 00 FF F4 */	bdnz lbl_8026A7A8
/* 8026A7B8 00266418  7C 98 E2 A6 */	mfspr r4, 0x398
/* 8026A7BC 0026641C  64 84 10 0F */	oris r4, r4, 0x100f
/* 8026A7C0 00266420  7C 98 E3 A6 */	mtspr 0x398, r4
/* 8026A7C4 00266424  60 00 00 00 */	nop
/* 8026A7C8 00266428  60 00 00 00 */	nop
/* 8026A7CC 0026642C  60 00 00 00 */	nop
/* 8026A7D0 00266430  60 00 00 00 */	nop
/* 8026A7D4 00266434  60 00 00 00 */	nop
/* 8026A7D8 00266438  60 00 00 00 */	nop
/* 8026A7DC 0026643C  60 00 00 00 */	nop
/* 8026A7E0 00266440  60 00 00 00 */	nop
/* 8026A7E4 00266444  60 00 00 00 */	nop
/* 8026A7E8 00266448  60 00 00 00 */	nop
/* 8026A7EC 0026644C  60 00 00 00 */	nop
/* 8026A7F0 00266450  60 00 00 00 */	nop
/* 8026A7F4 00266454  3C 60 E0 00 */	lis r3, 0xE0000002@h
/* 8026A7F8 00266458  60 63 00 02 */	ori r3, r3, 0xE0000002@l
/* 8026A7FC 0026645C  7C 7F 83 A6 */	mtdbatl 3, r3
/* 8026A800 00266460  60 63 01 FE */	ori r3, r3, 0x1fe
/* 8026A804 00266464  7C 7E 83 A6 */	mtdbatu 3, r3
/* 8026A808 00266468  4C 00 01 2C */	isync
/* 8026A80C 0026646C  3C 60 E0 00 */	lis r3, 0xE0000020@ha
/* 8026A810 00266470  38 C0 02 00 */	li r6, 0x200
/* 8026A814 00266474  7C C9 03 A6 */	mtctr r6
/* 8026A818 00266478  38 C0 00 00 */	li r6, 0
lbl_8026A81C:
/* 8026A81C 0026647C  10 06 1F EC */	dcbz_l r6, r3
/* 8026A820 00266480  38 63 00 20 */	addi r3, r3, 0xE0000020@l
/* 8026A824 00266484  42 00 FF F8 */	bdnz lbl_8026A81C
/* 8026A828 00266488  60 00 00 00 */	nop
/* 8026A82C 0026648C  60 00 00 00 */	nop
/* 8026A830 00266490  60 00 00 00 */	nop
/* 8026A834 00266494  60 00 00 00 */	nop
/* 8026A838 00266498  60 00 00 00 */	nop
/* 8026A83C 0026649C  60 00 00 00 */	nop
/* 8026A840 002664A0  60 00 00 00 */	nop
/* 8026A844 002664A4  60 00 00 00 */	nop
/* 8026A848 002664A8  60 00 00 00 */	nop
/* 8026A84C 002664AC  60 00 00 00 */	nop
/* 8026A850 002664B0  60 00 00 00 */	nop
/* 8026A854 002664B4  60 00 00 00 */	nop
/* 8026A858 002664B8  4E 80 00 20 */	blr

.global LCEnable
LCEnable:
/* 8026A85C 002664BC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8026A860 002664C0  7C 08 02 A6 */	mflr r0
/* 8026A864 002664C4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8026A868 002664C8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8026A86C 002664CC  48 00 3E F1 */	bl OSDisableInterrupts
/* 8026A870 002664D0  7C 7F 1B 78 */	mr r31, r3
/* 8026A874 002664D4  4B FF FF 1D */	bl __LCEnable
/* 8026A878 002664D8  7F E3 FB 78 */	mr r3, r31
/* 8026A87C 002664DC  48 00 3F 09 */	bl OSRestoreInterrupts
/* 8026A880 002664E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8026A884 002664E4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8026A888 002664E8  7C 08 03 A6 */	mtlr r0
/* 8026A88C 002664EC  38 21 00 10 */	addi r1, r1, 0x10
/* 8026A890 002664F0  4E 80 00 20 */	blr

.global LCDisable
LCDisable:
/* 8026A894 002664F4  3C 60 E0 00 */	lis r3, 0xE0000020@ha
/* 8026A898 002664F8  38 80 02 00 */	li r4, 0x200
/* 8026A89C 002664FC  7C 89 03 A6 */	mtctr r4
lbl_8026A8A0:
/* 8026A8A0 00266500  7C 00 1B AC */	dcbi 0, r3
/* 8026A8A4 00266504  38 63 00 20 */	addi r3, r3, 0xE0000020@l
/* 8026A8A8 00266508  42 00 FF F8 */	bdnz lbl_8026A8A0
/* 8026A8AC 0026650C  7C 98 E2 A6 */	mfspr r4, 0x398
/* 8026A8B0 00266510  54 84 01 04 */	rlwinm r4, r4, 0, 4, 2
/* 8026A8B4 00266514  7C 98 E3 A6 */	mtspr 0x398, r4
/* 8026A8B8 00266518  4E 80 00 20 */	blr

.global LCStoreBlocks
LCStoreBlocks:
/* 8026A8BC 0026651C  54 A6 F6 FE */	rlwinm r6, r5, 0x1e, 0x1b, 0x1f
/* 8026A8C0 00266520  54 63 00 FE */	clrlwi r3, r3, 3
/* 8026A8C4 00266524  7C C6 1B 78 */	or r6, r6, r3
/* 8026A8C8 00266528  7C DA E3 A6 */	mtspr 0x39a, r6
/* 8026A8CC 0026652C  54 A6 17 3A */	rlwinm r6, r5, 2, 0x1c, 0x1d
/* 8026A8D0 00266530  7C C6 23 78 */	or r6, r6, r4
/* 8026A8D4 00266534  60 C6 00 02 */	ori r6, r6, 2
/* 8026A8D8 00266538  7C DB E3 A6 */	mtspr 0x39b, r6
/* 8026A8DC 0026653C  4E 80 00 20 */	blr

.global LCStoreData
LCStoreData:
/* 8026A8E0 00266540  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8026A8E4 00266544  7C 08 02 A6 */	mflr r0
/* 8026A8E8 00266548  90 01 00 24 */	stw r0, 0x24(r1)
/* 8026A8EC 0026654C  38 05 00 1F */	addi r0, r5, 0x1f
/* 8026A8F0 00266550  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8026A8F4 00266554  54 1F D9 7E */	srwi r31, r0, 5
/* 8026A8F8 00266558  38 1F 00 7F */	addi r0, r31, 0x7f
/* 8026A8FC 0026655C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8026A900 00266560  54 1E C9 FE */	srwi r30, r0, 7
/* 8026A904 00266564  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8026A908 00266568  7C 9D 23 78 */	mr r29, r4
/* 8026A90C 0026656C  93 81 00 10 */	stw r28, 0x10(r1)
/* 8026A910 00266570  7C 7C 1B 78 */	mr r28, r3
/* 8026A914 00266574  48 00 00 40 */	b lbl_8026A954
lbl_8026A918:
/* 8026A918 00266578  28 1F 00 80 */	cmplwi r31, 0x80
/* 8026A91C 0026657C  40 80 00 1C */	bge lbl_8026A938
/* 8026A920 00266580  7F 83 E3 78 */	mr r3, r28
/* 8026A924 00266584  7F A4 EB 78 */	mr r4, r29
/* 8026A928 00266588  7F E5 FB 78 */	mr r5, r31
/* 8026A92C 0026658C  4B FF FF 91 */	bl LCStoreBlocks
/* 8026A930 00266590  3B E0 00 00 */	li r31, 0
/* 8026A934 00266594  48 00 00 20 */	b lbl_8026A954
lbl_8026A938:
/* 8026A938 00266598  7F 83 E3 78 */	mr r3, r28
/* 8026A93C 0026659C  7F A4 EB 78 */	mr r4, r29
/* 8026A940 002665A0  38 A0 00 00 */	li r5, 0
/* 8026A944 002665A4  4B FF FF 79 */	bl LCStoreBlocks
/* 8026A948 002665A8  3B FF FF 80 */	addi r31, r31, -128
/* 8026A94C 002665AC  3B 9C 10 00 */	addi r28, r28, 0x1000
/* 8026A950 002665B0  3B BD 10 00 */	addi r29, r29, 0x1000
lbl_8026A954:
/* 8026A954 002665B4  2C 1F 00 00 */	cmpwi r31, 0
/* 8026A958 002665B8  40 82 FF C0 */	bne lbl_8026A918
/* 8026A95C 002665BC  7F C3 F3 78 */	mr r3, r30
/* 8026A960 002665C0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8026A964 002665C4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8026A968 002665C8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8026A96C 002665CC  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8026A970 002665D0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8026A974 002665D4  7C 08 03 A6 */	mtlr r0
/* 8026A978 002665D8  38 21 00 20 */	addi r1, r1, 0x20
/* 8026A97C 002665DC  4E 80 00 20 */	blr

.global LCQueueWait
LCQueueWait:
/* 8026A980 002665E0  7C 98 E2 A6 */	mfspr r4, 0x398
/* 8026A984 002665E4  54 84 47 3E */	rlwinm r4, r4, 8, 0x1c, 0x1f
/* 8026A988 002665E8  7C 04 18 00 */	cmpw r4, r3
/* 8026A98C 002665EC  41 81 FF F4 */	bgt LCQueueWait
/* 8026A990 002665F0  4E 80 00 20 */	blr

.global DMAErrorHandler
DMAErrorHandler:
/* 8026A994 002665F4  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 8026A998 002665F8  7C 08 02 A6 */	mflr r0
/* 8026A99C 002665FC  90 01 00 84 */	stw r0, 0x84(r1)
/* 8026A9A0 00266600  93 E1 00 7C */	stw r31, 0x7c(r1)
/* 8026A9A4 00266604  93 C1 00 78 */	stw r30, 0x78(r1)
/* 8026A9A8 00266608  93 A1 00 74 */	stw r29, 0x74(r1)
/* 8026A9AC 0026660C  7C 9D 23 78 */	mr r29, r4
/* 8026A9B0 00266610  40 86 00 24 */	bne cr1, lbl_8026A9D4
/* 8026A9B4 00266614  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 8026A9B8 00266618  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 8026A9BC 0026661C  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 8026A9C0 00266620  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 8026A9C4 00266624  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 8026A9C8 00266628  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 8026A9CC 0026662C  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 8026A9D0 00266630  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_8026A9D4:
/* 8026A9D4 00266634  3F E0 80 42 */	lis r31, lbl_80426A60@ha
/* 8026A9D8 00266638  90 61 00 08 */	stw r3, 8(r1)
/* 8026A9DC 0026663C  3B FF 6A 60 */	addi r31, r31, lbl_80426A60@l
/* 8026A9E0 00266640  90 81 00 0C */	stw r4, 0xc(r1)
/* 8026A9E4 00266644  90 A1 00 10 */	stw r5, 0x10(r1)
/* 8026A9E8 00266648  90 C1 00 14 */	stw r6, 0x14(r1)
/* 8026A9EC 0026664C  90 E1 00 18 */	stw r7, 0x18(r1)
/* 8026A9F0 00266650  91 01 00 1C */	stw r8, 0x1c(r1)
/* 8026A9F4 00266654  91 21 00 20 */	stw r9, 0x20(r1)
/* 8026A9F8 00266658  91 41 00 24 */	stw r10, 0x24(r1)
/* 8026A9FC 0026665C  4B FF D8 F9 */	bl PPCMfhid2
/* 8026AA00 00266660  7C 7E 1B 78 */	mr r30, r3
/* 8026AA04 00266664  38 7F 00 30 */	addi r3, r31, 0x30
/* 8026AA08 00266668  4C C6 31 82 */	crclr 6
/* 8026AA0C 0026666C  4B D9 D0 B9 */	bl func_80007AC4
/* 8026AA10 00266670  80 BD 01 9C */	lwz r5, 0x19c(r29)
/* 8026AA14 00266674  7F C4 F3 78 */	mr r4, r30
/* 8026AA18 00266678  38 7F 00 48 */	addi r3, r31, 0x48
/* 8026AA1C 0026667C  4C C6 31 82 */	crclr 6
/* 8026AA20 00266680  4B D9 D0 A5 */	bl func_80007AC4
/* 8026AA24 00266684  57 C0 02 17 */	rlwinm. r0, r30, 0, 8, 0xb
/* 8026AA28 00266688  41 82 00 10 */	beq lbl_8026AA38
/* 8026AA2C 0026668C  80 1D 01 9C */	lwz r0, 0x19c(r29)
/* 8026AA30 00266690  54 00 02 95 */	rlwinm. r0, r0, 0, 0xa, 0xa
/* 8026AA34 00266694  40 82 00 1C */	bne lbl_8026AA50
lbl_8026AA38:
/* 8026AA38 00266698  38 7F 00 68 */	addi r3, r31, 0x68
/* 8026AA3C 0026669C  4C C6 31 82 */	crclr 6
/* 8026AA40 002666A0  4B D9 D0 85 */	bl func_80007AC4
/* 8026AA44 002666A4  7F A3 EB 78 */	mr r3, r29
/* 8026AA48 002666A8  48 00 07 29 */	bl OSDumpContext
/* 8026AA4C 002666AC  4B FF D8 1D */	bl PPCHalt
lbl_8026AA50:
/* 8026AA50 002666B0  38 7F 00 98 */	addi r3, r31, 0x98
/* 8026AA54 002666B4  4C C6 31 82 */	crclr 6
/* 8026AA58 002666B8  4B D9 D0 6D */	bl func_80007AC4
/* 8026AA5C 002666BC  38 7F 00 D4 */	addi r3, r31, 0xd4
/* 8026AA60 002666C0  4C C6 31 82 */	crclr 6
/* 8026AA64 002666C4  4B D9 D0 61 */	bl func_80007AC4
/* 8026AA68 002666C8  57 C0 02 11 */	rlwinm. r0, r30, 0, 8, 8
/* 8026AA6C 002666CC  41 82 00 10 */	beq lbl_8026AA7C
/* 8026AA70 002666D0  38 7F 01 0C */	addi r3, r31, 0x10c
/* 8026AA74 002666D4  4C C6 31 82 */	crclr 6
/* 8026AA78 002666D8  4B D9 D0 4D */	bl func_80007AC4
lbl_8026AA7C:
/* 8026AA7C 002666DC  57 C0 02 53 */	rlwinm. r0, r30, 0, 9, 9
/* 8026AA80 002666E0  41 82 00 10 */	beq lbl_8026AA90
/* 8026AA84 002666E4  38 7F 01 4C */	addi r3, r31, 0x14c
/* 8026AA88 002666E8  4C C6 31 82 */	crclr 6
/* 8026AA8C 002666EC  4B D9 D0 39 */	bl func_80007AC4
lbl_8026AA90:
/* 8026AA90 002666F0  57 C0 02 95 */	rlwinm. r0, r30, 0, 0xa, 0xa
/* 8026AA94 002666F4  41 82 00 10 */	beq lbl_8026AAA4
/* 8026AA98 002666F8  38 7F 01 78 */	addi r3, r31, 0x178
/* 8026AA9C 002666FC  4C C6 31 82 */	crclr 6
/* 8026AAA0 00266700  4B D9 D0 25 */	bl func_80007AC4
lbl_8026AAA4:
/* 8026AAA4 00266704  57 C0 02 D7 */	rlwinm. r0, r30, 0, 0xb, 0xb
/* 8026AAA8 00266708  41 82 00 10 */	beq lbl_8026AAB8
/* 8026AAAC 0026670C  38 7F 01 98 */	addi r3, r31, 0x198
/* 8026AAB0 00266710  4C C6 31 82 */	crclr 6
/* 8026AAB4 00266714  4B D9 D0 11 */	bl func_80007AC4
lbl_8026AAB8:
/* 8026AAB8 00266718  7F C3 F3 78 */	mr r3, r30
/* 8026AABC 0026671C  4B FF D8 41 */	bl PPCMthid2
/* 8026AAC0 00266720  80 01 00 84 */	lwz r0, 0x84(r1)
/* 8026AAC4 00266724  83 E1 00 7C */	lwz r31, 0x7c(r1)
/* 8026AAC8 00266728  83 C1 00 78 */	lwz r30, 0x78(r1)
/* 8026AACC 0026672C  83 A1 00 74 */	lwz r29, 0x74(r1)
/* 8026AAD0 00266730  7C 08 03 A6 */	mtlr r0
/* 8026AAD4 00266734  38 21 00 80 */	addi r1, r1, 0x80
/* 8026AAD8 00266738  4E 80 00 20 */	blr

.global __OSCacheInit
__OSCacheInit:
/* 8026AADC 0026673C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8026AAE0 00266740  7C 08 02 A6 */	mflr r0
/* 8026AAE4 00266744  90 01 00 14 */	stw r0, 0x14(r1)
/* 8026AAE8 00266748  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8026AAEC 0026674C  3F E0 80 42 */	lis r31, lbl_80426A60@ha
/* 8026AAF0 00266750  3B FF 6A 60 */	addi r31, r31, lbl_80426A60@l
/* 8026AAF4 00266754  93 C1 00 08 */	stw r30, 8(r1)
/* 8026AAF8 00266758  4B FF D7 41 */	bl PPCMfhid0
/* 8026AAFC 0026675C  54 60 04 21 */	rlwinm. r0, r3, 0, 0x10, 0x10
/* 8026AB00 00266760  40 82 00 14 */	bne lbl_8026AB14
/* 8026AB04 00266764  4B FF FC 79 */	bl ICEnable
/* 8026AB08 00266768  38 7F 01 B4 */	addi r3, r31, 0x1b4
/* 8026AB0C 0026676C  4C C6 31 82 */	crclr 6
/* 8026AB10 00266770  48 00 C9 39 */	bl DBPrintf
lbl_8026AB14:
/* 8026AB14 00266774  4B FF D7 25 */	bl PPCMfhid0
/* 8026AB18 00266778  54 60 04 63 */	rlwinm. r0, r3, 0, 0x11, 0x11
/* 8026AB1C 0026677C  40 82 00 14 */	bne lbl_8026AB30
/* 8026AB20 00266780  4B FF FA F5 */	bl DCEnable
/* 8026AB24 00266784  38 7F 01 D0 */	addi r3, r31, 0x1d0
/* 8026AB28 00266788  4C C6 31 82 */	crclr 6
/* 8026AB2C 0026678C  48 00 C9 1D */	bl DBPrintf
lbl_8026AB30:
/* 8026AB30 00266790  4B FF D7 19 */	bl PPCMfl2cr
/* 8026AB34 00266794  54 60 00 01 */	rlwinm. r0, r3, 0, 0, 0
/* 8026AB38 00266798  40 82 00 A8 */	bne lbl_8026ABE0
/* 8026AB3C 0026679C  4B FF D6 ED */	bl PPCMfmsr
/* 8026AB40 002667A0  7C 7E 1B 78 */	mr r30, r3
/* 8026AB44 002667A4  7C 00 04 AC */	sync 0
/* 8026AB48 002667A8  38 60 00 30 */	li r3, 0x30
/* 8026AB4C 002667AC  4B FF D6 E5 */	bl PPCMtmsr
/* 8026AB50 002667B0  7C 00 04 AC */	sync 0
/* 8026AB54 002667B4  7C 00 04 AC */	sync 0
/* 8026AB58 002667B8  4B FF D6 F1 */	bl PPCMfl2cr
/* 8026AB5C 002667BC  54 63 00 7E */	clrlwi r3, r3, 1
/* 8026AB60 002667C0  4B FF D6 F1 */	bl PPCMtl2cr
/* 8026AB64 002667C4  7C 00 04 AC */	sync 0
/* 8026AB68 002667C8  7C 00 04 AC */	sync 0
/* 8026AB6C 002667CC  4B FF D6 DD */	bl PPCMfl2cr
/* 8026AB70 002667D0  54 63 00 7E */	clrlwi r3, r3, 1
/* 8026AB74 002667D4  4B FF D6 DD */	bl PPCMtl2cr
/* 8026AB78 002667D8  7C 00 04 AC */	sync 0
/* 8026AB7C 002667DC  4B FF D6 CD */	bl PPCMfl2cr
/* 8026AB80 002667E0  64 63 00 20 */	oris r3, r3, 0x20
/* 8026AB84 002667E4  4B FF D6 CD */	bl PPCMtl2cr
lbl_8026AB88:
/* 8026AB88 002667E8  4B FF D6 C1 */	bl PPCMfl2cr
/* 8026AB8C 002667EC  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8026AB90 002667F0  40 82 FF F8 */	bne lbl_8026AB88
/* 8026AB94 002667F4  4B FF D6 B5 */	bl PPCMfl2cr
/* 8026AB98 002667F8  54 63 02 D2 */	rlwinm r3, r3, 0, 0xb, 9
/* 8026AB9C 002667FC  4B FF D6 B5 */	bl PPCMtl2cr
/* 8026ABA0 00266800  48 00 00 10 */	b lbl_8026ABB0
lbl_8026ABA4:
/* 8026ABA4 00266804  38 7F 00 00 */	addi r3, r31, 0
/* 8026ABA8 00266808  4C C6 31 82 */	crclr 6
/* 8026ABAC 0026680C  48 00 C8 9D */	bl DBPrintf
lbl_8026ABB0:
/* 8026ABB0 00266810  4B FF D6 99 */	bl PPCMfl2cr
/* 8026ABB4 00266814  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8026ABB8 00266818  40 82 FF EC */	bne lbl_8026ABA4
/* 8026ABBC 0026681C  7F C3 F3 78 */	mr r3, r30
/* 8026ABC0 00266820  4B FF D6 71 */	bl PPCMtmsr
/* 8026ABC4 00266824  4B FF D6 85 */	bl PPCMfl2cr
/* 8026ABC8 00266828  64 60 80 00 */	oris r0, r3, 0x8000
/* 8026ABCC 0026682C  54 03 02 D2 */	rlwinm r3, r0, 0, 0xb, 9
/* 8026ABD0 00266830  4B FF D6 81 */	bl PPCMtl2cr
/* 8026ABD4 00266834  38 7F 01 EC */	addi r3, r31, 0x1ec
/* 8026ABD8 00266838  4C C6 31 82 */	crclr 6
/* 8026ABDC 0026683C  48 00 C8 6D */	bl DBPrintf
lbl_8026ABE0:
/* 8026ABE0 00266840  3C 80 80 27 */	lis r4, DMAErrorHandler@ha
/* 8026ABE4 00266844  38 60 00 01 */	li r3, 1
/* 8026ABE8 00266848  38 84 A9 94 */	addi r4, r4, DMAErrorHandler@l
/* 8026ABEC 0026684C  48 00 09 DD */	bl OSSetErrorHandler
/* 8026ABF0 00266850  38 7F 02 04 */	addi r3, r31, 0x204
/* 8026ABF4 00266854  4C C6 31 82 */	crclr 6
/* 8026ABF8 00266858  48 00 C8 51 */	bl DBPrintf
/* 8026ABFC 0026685C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8026AC00 00266860  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8026AC04 00266864  83 C1 00 08 */	lwz r30, 8(r1)
/* 8026AC08 00266868  7C 08 03 A6 */	mtlr r0
/* 8026AC0C 0026686C  38 21 00 10 */	addi r1, r1, 0x10
/* 8026AC10 00266870  4E 80 00 20 */	blr
