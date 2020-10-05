.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global ProbeBarnacle
ProbeBarnacle:
/* 80275DEC 00271A4C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80275DF0 00271A50  7C 08 02 A6 */	mflr r0
/* 80275DF4 00271A54  2C 03 00 02 */	cmpwi r3, 2
/* 80275DF8 00271A58  90 01 00 24 */	stw r0, 0x24(r1)
/* 80275DFC 00271A5C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80275E00 00271A60  7C BF 2B 78 */	mr r31, r5
/* 80275E04 00271A64  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80275E08 00271A68  7C 9E 23 78 */	mr r30, r4
/* 80275E0C 00271A6C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80275E10 00271A70  7C 7D 1B 78 */	mr r29, r3
/* 80275E14 00271A74  93 81 00 10 */	stw r28, 0x10(r1)
/* 80275E18 00271A78  41 82 00 24 */	beq lbl_80275E3C
/* 80275E1C 00271A7C  2C 04 00 00 */	cmpwi r4, 0
/* 80275E20 00271A80  40 82 00 1C */	bne lbl_80275E3C
/* 80275E24 00271A84  38 80 00 00 */	li r4, 0
/* 80275E28 00271A88  4B FF F0 B9 */	bl EXIAttach
/* 80275E2C 00271A8C  2C 03 00 00 */	cmpwi r3, 0
/* 80275E30 00271A90  40 82 00 0C */	bne lbl_80275E3C
/* 80275E34 00271A94  38 60 00 00 */	li r3, 0
/* 80275E38 00271A98  48 00 01 0C */	b lbl_80275F44
lbl_80275E3C:
/* 80275E3C 00271A9C  7F A3 EB 78 */	mr r3, r29
/* 80275E40 00271AA0  7F C4 F3 78 */	mr r4, r30
/* 80275E44 00271AA4  38 A0 00 00 */	li r5, 0
/* 80275E48 00271AA8  4B FF F9 FD */	bl EXILock
/* 80275E4C 00271AAC  7C 60 00 34 */	cntlzw r0, r3
/* 80275E50 00271AB0  54 1C D9 7F */	rlwinm. r28, r0, 0x1b, 5, 0x1f
/* 80275E54 00271AB4  40 82 00 B4 */	bne lbl_80275F08
/* 80275E58 00271AB8  7F A3 EB 78 */	mr r3, r29
/* 80275E5C 00271ABC  7F C4 F3 78 */	mr r4, r30
/* 80275E60 00271AC0  38 A0 00 00 */	li r5, 0
/* 80275E64 00271AC4  4B FF F2 4D */	bl EXISelect
/* 80275E68 00271AC8  7C 60 00 34 */	cntlzw r0, r3
/* 80275E6C 00271ACC  54 1C D9 7F */	rlwinm. r28, r0, 0x1b, 5, 0x1f
/* 80275E70 00271AD0  40 82 00 90 */	bne lbl_80275F00
/* 80275E74 00271AD4  3C 80 20 01 */	lis r4, 0x20011300@ha
/* 80275E78 00271AD8  7F A3 EB 78 */	mr r3, r29
/* 80275E7C 00271ADC  38 04 13 00 */	addi r0, r4, 0x20011300@l
/* 80275E80 00271AE0  38 A0 00 04 */	li r5, 4
/* 80275E84 00271AE4  90 01 00 08 */	stw r0, 8(r1)
/* 80275E88 00271AE8  38 81 00 08 */	addi r4, r1, 8
/* 80275E8C 00271AEC  38 C0 00 01 */	li r6, 1
/* 80275E90 00271AF0  38 E0 00 00 */	li r7, 0
/* 80275E94 00271AF4  4B FF E7 B5 */	bl EXIImm
/* 80275E98 00271AF8  7C 60 00 34 */	cntlzw r0, r3
/* 80275E9C 00271AFC  7F A3 EB 78 */	mr r3, r29
/* 80275EA0 00271B00  54 1C D9 7E */	srwi r28, r0, 5
/* 80275EA4 00271B04  4B FF EB BD */	bl EXISync
/* 80275EA8 00271B08  7C 60 00 34 */	cntlzw r0, r3
/* 80275EAC 00271B0C  7F A3 EB 78 */	mr r3, r29
/* 80275EB0 00271B10  54 00 D9 7E */	srwi r0, r0, 5
/* 80275EB4 00271B14  7F E4 FB 78 */	mr r4, r31
/* 80275EB8 00271B18  7F 9C 03 78 */	or r28, r28, r0
/* 80275EBC 00271B1C  38 A0 00 04 */	li r5, 4
/* 80275EC0 00271B20  38 C0 00 00 */	li r6, 0
/* 80275EC4 00271B24  38 E0 00 00 */	li r7, 0
/* 80275EC8 00271B28  4B FF E7 81 */	bl EXIImm
/* 80275ECC 00271B2C  7C 60 00 34 */	cntlzw r0, r3
/* 80275ED0 00271B30  7F A3 EB 78 */	mr r3, r29
/* 80275ED4 00271B34  54 00 D9 7E */	srwi r0, r0, 5
/* 80275ED8 00271B38  7F 9C 03 78 */	or r28, r28, r0
/* 80275EDC 00271B3C  4B FF EB 85 */	bl EXISync
/* 80275EE0 00271B40  7C 60 00 34 */	cntlzw r0, r3
/* 80275EE4 00271B44  7F A3 EB 78 */	mr r3, r29
/* 80275EE8 00271B48  54 00 D9 7E */	srwi r0, r0, 5
/* 80275EEC 00271B4C  7F 9C 03 78 */	or r28, r28, r0
/* 80275EF0 00271B50  4B FF F2 F1 */	bl EXIDeselect
/* 80275EF4 00271B54  7C 60 00 34 */	cntlzw r0, r3
/* 80275EF8 00271B58  54 00 D9 7E */	srwi r0, r0, 5
/* 80275EFC 00271B5C  7F 9C 03 78 */	or r28, r28, r0
lbl_80275F00:
/* 80275F00 00271B60  7F A3 EB 78 */	mr r3, r29
/* 80275F04 00271B64  4B FF FA 3D */	bl EXIUnlock
lbl_80275F08:
/* 80275F08 00271B68  2C 1D 00 02 */	cmpwi r29, 2
/* 80275F0C 00271B6C  41 82 00 14 */	beq lbl_80275F20
/* 80275F10 00271B70  2C 1E 00 00 */	cmpwi r30, 0
/* 80275F14 00271B74  40 82 00 0C */	bne lbl_80275F20
/* 80275F18 00271B78  7F A3 EB 78 */	mr r3, r29
/* 80275F1C 00271B7C  4B FF F0 DD */	bl EXIDetach
lbl_80275F20:
/* 80275F20 00271B80  2C 1C 00 00 */	cmpwi r28, 0
/* 80275F24 00271B84  41 82 00 0C */	beq lbl_80275F30
/* 80275F28 00271B88  38 60 00 00 */	li r3, 0
/* 80275F2C 00271B8C  48 00 00 18 */	b lbl_80275F44
lbl_80275F30:
/* 80275F30 00271B90  80 9F 00 00 */	lwz r4, 0(r31)
/* 80275F34 00271B94  20 64 FF FF */	subfic r3, r4, -1
/* 80275F38 00271B98  38 04 00 01 */	addi r0, r4, 1
/* 80275F3C 00271B9C  7C 60 03 78 */	or r0, r3, r0
/* 80275F40 00271BA0  54 03 0F FE */	srwi r3, r0, 0x1f
lbl_80275F44:
/* 80275F44 00271BA4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80275F48 00271BA8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80275F4C 00271BAC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80275F50 00271BB0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80275F54 00271BB4  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80275F58 00271BB8  7C 08 03 A6 */	mtlr r0
/* 80275F5C 00271BBC  38 21 00 20 */	addi r1, r1, 0x20
/* 80275F60 00271BC0  4E 80 00 20 */	blr

.global __OSEnableBarnacle
__OSEnableBarnacle:
/* 80275F64 00271BC4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80275F68 00271BC8  7C 08 02 A6 */	mflr r0
/* 80275F6C 00271BCC  90 01 00 24 */	stw r0, 0x24(r1)
/* 80275F70 00271BD0  38 A1 00 08 */	addi r5, r1, 8
/* 80275F74 00271BD4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80275F78 00271BD8  7C 9F 23 78 */	mr r31, r4
/* 80275F7C 00271BDC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80275F80 00271BE0  7C 7E 1B 78 */	mr r30, r3
/* 80275F84 00271BE4  4B FF FA BD */	bl EXIGetID
/* 80275F88 00271BE8  2C 03 00 00 */	cmpwi r3, 0
/* 80275F8C 00271BEC  41 82 01 7C */	beq lbl_80276108
/* 80275F90 00271BF0  80 81 00 08 */	lwz r4, 8(r1)
/* 80275F94 00271BF4  3C 00 01 02 */	lis r0, 0x102
/* 80275F98 00271BF8  7C 04 00 00 */	cmpw r4, r0
/* 80275F9C 00271BFC  41 82 01 6C */	beq lbl_80276108
/* 80275FA0 00271C00  40 80 00 94 */	bge lbl_80276034
/* 80275FA4 00271C04  2C 04 00 04 */	cmpwi r4, 4
/* 80275FA8 00271C08  41 82 01 60 */	beq lbl_80276108
/* 80275FAC 00271C0C  40 80 00 54 */	bge lbl_80276000
/* 80275FB0 00271C10  3C 60 80 00 */	lis r3, 0x80000010@ha
/* 80275FB4 00271C14  38 03 00 10 */	addi r0, r3, 0x80000010@l
/* 80275FB8 00271C18  7C 04 00 00 */	cmpw r4, r0
/* 80275FBC 00271C1C  41 82 01 4C */	beq lbl_80276108
/* 80275FC0 00271C20  40 80 00 24 */	bge lbl_80275FE4
/* 80275FC4 00271C24  38 03 00 08 */	addi r0, r3, 8
/* 80275FC8 00271C28  7C 04 00 00 */	cmpw r4, r0
/* 80275FCC 00271C2C  41 82 01 3C */	beq lbl_80276108
/* 80275FD0 00271C30  40 80 01 08 */	bge lbl_802760D8
/* 80275FD4 00271C34  38 03 00 04 */	addi r0, r3, 4
/* 80275FD8 00271C38  7C 04 00 00 */	cmpw r4, r0
/* 80275FDC 00271C3C  41 82 01 2C */	beq lbl_80276108
/* 80275FE0 00271C40  48 00 00 F8 */	b lbl_802760D8
lbl_80275FE4:
/* 80275FE4 00271C44  2C 04 FF FF */	cmpwi r4, -1
/* 80275FE8 00271C48  41 82 01 20 */	beq lbl_80276108
/* 80275FEC 00271C4C  40 80 00 EC */	bge lbl_802760D8
/* 80275FF0 00271C50  38 03 00 20 */	addi r0, r3, 0x20
/* 80275FF4 00271C54  7C 04 00 00 */	cmpw r4, r0
/* 80275FF8 00271C58  41 82 01 10 */	beq lbl_80276108
/* 80275FFC 00271C5C  48 00 00 DC */	b lbl_802760D8
lbl_80276000:
/* 80276000 00271C60  2C 04 00 20 */	cmpwi r4, 0x20
/* 80276004 00271C64  41 82 01 04 */	beq lbl_80276108
/* 80276008 00271C68  40 80 00 1C */	bge lbl_80276024
/* 8027600C 00271C6C  2C 04 00 10 */	cmpwi r4, 0x10
/* 80276010 00271C70  41 82 00 F8 */	beq lbl_80276108
/* 80276014 00271C74  40 80 00 C4 */	bge lbl_802760D8
/* 80276018 00271C78  2C 04 00 08 */	cmpwi r4, 8
/* 8027601C 00271C7C  41 82 00 EC */	beq lbl_80276108
/* 80276020 00271C80  48 00 00 B8 */	b lbl_802760D8
lbl_80276024:
/* 80276024 00271C84  3C 00 01 01 */	lis r0, 0x101
/* 80276028 00271C88  7C 04 00 00 */	cmpw r4, r0
/* 8027602C 00271C8C  41 82 00 DC */	beq lbl_80276108
/* 80276030 00271C90  48 00 00 A8 */	b lbl_802760D8
lbl_80276034:
/* 80276034 00271C94  3C 60 04 04 */	lis r3, 0x04040404@ha
/* 80276038 00271C98  38 03 04 04 */	addi r0, r3, 0x04040404@l
/* 8027603C 00271C9C  7C 04 00 00 */	cmpw r4, r0
/* 80276040 00271CA0  41 82 00 C8 */	beq lbl_80276108
/* 80276044 00271CA4  40 80 00 58 */	bge lbl_8027609C
/* 80276048 00271CA8  3C 60 04 02 */	lis r3, 0x04020100@ha
/* 8027604C 00271CAC  38 03 01 00 */	addi r0, r3, 0x04020100@l
/* 80276050 00271CB0  7C 04 00 00 */	cmpw r4, r0
/* 80276054 00271CB4  41 82 00 B4 */	beq lbl_80276108
/* 80276058 00271CB8  40 80 00 24 */	bge lbl_8027607C
/* 8027605C 00271CBC  3C 00 03 01 */	lis r0, 0x301
/* 80276060 00271CC0  7C 04 00 00 */	cmpw r4, r0
/* 80276064 00271CC4  41 82 00 A4 */	beq lbl_80276108
/* 80276068 00271CC8  40 80 00 70 */	bge lbl_802760D8
/* 8027606C 00271CCC  3C 00 02 02 */	lis r0, 0x202
/* 80276070 00271CD0  7C 04 00 00 */	cmpw r4, r0
/* 80276074 00271CD4  41 82 00 94 */	beq lbl_80276108
/* 80276078 00271CD8  48 00 00 60 */	b lbl_802760D8
lbl_8027607C:
/* 8027607C 00271CDC  38 03 03 00 */	addi r0, r3, 0x300
/* 80276080 00271CE0  7C 04 00 00 */	cmpw r4, r0
/* 80276084 00271CE4  41 82 00 84 */	beq lbl_80276108
/* 80276088 00271CE8  40 80 00 50 */	bge lbl_802760D8
/* 8027608C 00271CEC  38 03 02 00 */	addi r0, r3, 0x200
/* 80276090 00271CF0  7C 04 00 00 */	cmpw r4, r0
/* 80276094 00271CF4  41 82 00 74 */	beq lbl_80276108
/* 80276098 00271CF8  48 00 00 40 */	b lbl_802760D8
lbl_8027609C:
/* 8027609C 00271CFC  3C 00 04 13 */	lis r0, 0x413
/* 802760A0 00271D00  7C 04 00 00 */	cmpw r4, r0
/* 802760A4 00271D04  41 82 00 64 */	beq lbl_80276108
/* 802760A8 00271D08  40 80 00 24 */	bge lbl_802760CC
/* 802760AC 00271D0C  3C 00 04 12 */	lis r0, 0x412
/* 802760B0 00271D10  7C 04 00 00 */	cmpw r4, r0
/* 802760B4 00271D14  41 82 00 54 */	beq lbl_80276108
/* 802760B8 00271D18  40 80 00 20 */	bge lbl_802760D8
/* 802760BC 00271D1C  3C 00 04 06 */	lis r0, 0x406
/* 802760C0 00271D20  7C 04 00 00 */	cmpw r4, r0
/* 802760C4 00271D24  41 82 00 44 */	beq lbl_80276108
/* 802760C8 00271D28  48 00 00 10 */	b lbl_802760D8
lbl_802760CC:
/* 802760CC 00271D2C  3C 00 04 22 */	lis r0, 0x422
/* 802760D0 00271D30  7C 04 00 00 */	cmpw r4, r0
/* 802760D4 00271D34  41 82 00 34 */	beq lbl_80276108
lbl_802760D8:
/* 802760D8 00271D38  7F C3 F3 78 */	mr r3, r30
/* 802760DC 00271D3C  7F E4 FB 78 */	mr r4, r31
/* 802760E0 00271D40  38 A1 00 08 */	addi r5, r1, 8
/* 802760E4 00271D44  4B FF FD 09 */	bl ProbeBarnacle
/* 802760E8 00271D48  2C 03 00 00 */	cmpwi r3, 0
/* 802760EC 00271D4C  41 82 00 1C */	beq lbl_80276108
/* 802760F0 00271D50  3C 60 A5 FF */	lis r3, 0xA5FF005A@ha
/* 802760F4 00271D54  93 CD A8 9C */	stw r30, lbl_8063FB5C-_SDA_BASE_(r13)
/* 802760F8 00271D58  38 03 00 5A */	addi r0, r3, 0xA5FF005A@l
/* 802760FC 00271D5C  93 ED A8 98 */	stw r31, lbl_8063FB58-_SDA_BASE_(r13)
/* 80276100 00271D60  90 0D A8 94 */	stw r0, lbl_8063FB54-_SDA_BASE_(r13)
/* 80276104 00271D64  90 0D A8 90 */	stw r0, lbl_8063FB50-_SDA_BASE_(r13)
lbl_80276108:
/* 80276108 00271D68  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8027610C 00271D6C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80276110 00271D70  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80276114 00271D74  7C 08 03 A6 */	mtlr r0
/* 80276118 00271D78  38 21 00 20 */	addi r1, r1, 0x20
/* 8027611C 00271D7C  4E 80 00 20 */	blr