.include "macros.inc"

.section .text, "ax"  # 0x80006980 - 0x803E1E60

.global C_MTXFrustum
C_MTXFrustum:
/* 8027CAA4 00278704  EC 04 18 28 */	fsubs f0, f4, f3
/* 8027CAA8 00278708  C1 22 A0 98 */	lfs f9, lbl_80642698-_SDA2_BASE_(r2)
/* 8027CAAC 0027870C  C1 62 A0 90 */	lfs f11, lbl_80642690-_SDA2_BASE_(r2)
/* 8027CAB0 00278710  ED 01 10 28 */	fsubs f8, f1, f2
/* 8027CAB4 00278714  EC E6 28 28 */	fsubs f7, f6, f5
/* 8027CAB8 00278718  C1 42 A0 94 */	lfs f10, lbl_80642694-_SDA2_BASE_(r2)
/* 8027CABC 0027871C  ED 8B 00 24 */	fdivs f12, f11, f0
/* 8027CAC0 00278720  C0 02 A0 9C */	lfs f0, lbl_8064269C-_SDA2_BASE_(r2)
/* 8027CAC4 00278724  D1 23 00 04 */	stfs f9, 4(r3)
/* 8027CAC8 00278728  D0 03 00 38 */	stfs f0, 0x38(r3)
/* 8027CACC 0027872C  D1 23 00 0C */	stfs f9, 0xc(r3)
/* 8027CAD0 00278730  D1 23 00 10 */	stfs f9, 0x10(r3)
/* 8027CAD4 00278734  ED 0B 40 24 */	fdivs f8, f11, f8
/* 8027CAD8 00278738  D1 23 00 1C */	stfs f9, 0x1c(r3)
/* 8027CADC 0027873C  D1 23 00 20 */	stfs f9, 0x20(r3)
/* 8027CAE0 00278740  D1 23 00 24 */	stfs f9, 0x24(r3)
/* 8027CAE4 00278744  D1 23 00 30 */	stfs f9, 0x30(r3)
/* 8027CAE8 00278748  D1 23 00 34 */	stfs f9, 0x34(r3)
/* 8027CAEC 0027874C  EC 01 10 2A */	fadds f0, f1, f2
/* 8027CAF0 00278750  D1 23 00 3C */	stfs f9, 0x3c(r3)
/* 8027CAF4 00278754  EC 64 18 2A */	fadds f3, f4, f3
/* 8027CAF8 00278758  ED 4A 01 72 */	fmuls f10, f10, f5
/* 8027CAFC 0027875C  EC 08 00 32 */	fmuls f0, f8, f0
/* 8027CB00 00278760  EC 4C 00 F2 */	fmuls f2, f12, f3
/* 8027CB04 00278764  EC 2A 02 32 */	fmuls f1, f10, f8
/* 8027CB08 00278768  EC 8A 03 32 */	fmuls f4, f10, f12
/* 8027CB0C 0027876C  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 8027CB10 00278770  EC C6 01 72 */	fmuls f6, f6, f5
/* 8027CB14 00278774  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 8027CB18 00278778  EC 6B 38 24 */	fdivs f3, f11, f7
/* 8027CB1C 0027877C  D0 83 00 00 */	stfs f4, 0(r3)
/* 8027CB20 00278780  D0 43 00 08 */	stfs f2, 8(r3)
/* 8027CB24 00278784  FC 20 28 50 */	fneg f1, f5
/* 8027CB28 00278788  FC 00 30 50 */	fneg f0, f6
/* 8027CB2C 0027878C  EC 21 00 F2 */	fmuls f1, f1, f3
/* 8027CB30 00278790  EC 03 00 32 */	fmuls f0, f3, f0
/* 8027CB34 00278794  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 8027CB38 00278798  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 8027CB3C 0027879C  4E 80 00 20 */	blr

.global C_MTXPerspective
C_MTXPerspective:
/* 8027CB40 002787A0  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8027CB44 002787A4  7C 08 02 A6 */	mflr r0
/* 8027CB48 002787A8  90 01 00 44 */	stw r0, 0x44(r1)
/* 8027CB4C 002787AC  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 8027CB50 002787B0  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 8027CB54 002787B4  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 8027CB58 002787B8  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 8027CB5C 002787BC  DB A1 00 10 */	stfd f29, 0x10(r1)
/* 8027CB60 002787C0  F3 A1 00 18 */	psq_st f29, 24(r1), 0, qr0
/* 8027CB64 002787C4  FF A0 10 90 */	fmr f29, f2
/* 8027CB68 002787C8  C0 A2 A0 A0 */	lfs f5, lbl_806426A0-_SDA2_BASE_(r2)
/* 8027CB6C 002787CC  FF C0 18 90 */	fmr f30, f3
/* 8027CB70 002787D0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8027CB74 002787D4  FF E0 20 90 */	fmr f31, f4
/* 8027CB78 002787D8  EC 25 00 72 */	fmuls f1, f5, f1
/* 8027CB7C 002787DC  C0 02 A0 A4 */	lfs f0, lbl_806426A4-_SDA2_BASE_(r2)
/* 8027CB80 002787E0  7C 7F 1B 78 */	mr r31, r3
/* 8027CB84 002787E4  EC 20 00 72 */	fmuls f1, f0, f1
/* 8027CB88 002787E8  4B F5 79 D5 */	bl tan
/* 8027CB8C 002787EC  FC 80 08 18 */	frsp f4, f1
/* 8027CB90 002787F0  C0 62 A0 98 */	lfs f3, lbl_80642698-_SDA2_BASE_(r2)
/* 8027CB94 002787F4  C0 A2 A0 90 */	lfs f5, lbl_80642690-_SDA2_BASE_(r2)
/* 8027CB98 002787F8  EC 5F F0 28 */	fsubs f2, f31, f30
/* 8027CB9C 002787FC  C0 02 A0 9C */	lfs f0, lbl_8064269C-_SDA2_BASE_(r2)
/* 8027CBA0 00278800  EC 3F 07 B2 */	fmuls f1, f31, f30
/* 8027CBA4 00278804  EC C5 20 24 */	fdivs f6, f5, f4
/* 8027CBA8 00278808  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 8027CBAC 0027880C  D0 7F 00 04 */	stfs f3, 4(r31)
/* 8027CBB0 00278810  D0 7F 00 08 */	stfs f3, 8(r31)
/* 8027CBB4 00278814  D0 7F 00 0C */	stfs f3, 0xc(r31)
/* 8027CBB8 00278818  D0 7F 00 10 */	stfs f3, 0x10(r31)
/* 8027CBBC 0027881C  EC A5 10 24 */	fdivs f5, f5, f2
/* 8027CBC0 00278820  D0 7F 00 18 */	stfs f3, 0x18(r31)
/* 8027CBC4 00278824  D0 DF 00 14 */	stfs f6, 0x14(r31)
/* 8027CBC8 00278828  D0 7F 00 1C */	stfs f3, 0x1c(r31)
/* 8027CBCC 0027882C  D0 7F 00 20 */	stfs f3, 0x20(r31)
/* 8027CBD0 00278830  D0 7F 00 24 */	stfs f3, 0x24(r31)
/* 8027CBD4 00278834  EC 86 E8 24 */	fdivs f4, f6, f29
/* 8027CBD8 00278838  D0 7F 00 30 */	stfs f3, 0x30(r31)
/* 8027CBDC 0027883C  D0 7F 00 34 */	stfs f3, 0x34(r31)
/* 8027CBE0 00278840  D0 7F 00 3C */	stfs f3, 0x3c(r31)
/* 8027CBE4 00278844  FC 00 08 50 */	fneg f0, f1
/* 8027CBE8 00278848  D0 9F 00 00 */	stfs f4, 0(r31)
/* 8027CBEC 0027884C  FC 40 F0 50 */	fneg f2, f30
/* 8027CBF0 00278850  EC 05 00 32 */	fmuls f0, f5, f0
/* 8027CBF4 00278854  EC 22 01 72 */	fmuls f1, f2, f5
/* 8027CBF8 00278858  D0 1F 00 2C */	stfs f0, 0x2c(r31)
/* 8027CBFC 0027885C  D0 3F 00 28 */	stfs f1, 0x28(r31)
/* 8027CC00 00278860  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 8027CC04 00278864  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 8027CC08 00278868  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 8027CC0C 0027886C  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 8027CC10 00278870  E3 A1 00 18 */	psq_l f29, 24(r1), 0, qr0
/* 8027CC14 00278874  CB A1 00 10 */	lfd f29, 0x10(r1)
/* 8027CC18 00278878  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8027CC1C 0027887C  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8027CC20 00278880  7C 08 03 A6 */	mtlr r0
/* 8027CC24 00278884  38 21 00 40 */	addi r1, r1, 0x40
/* 8027CC28 00278888  4E 80 00 20 */	blr

.global C_MTXOrtho
C_MTXOrtho:
/* 8027CC2C 0027888C  ED 64 18 28 */	fsubs f11, f4, f3
/* 8027CC30 00278890  C1 02 A0 98 */	lfs f8, lbl_80642698-_SDA2_BASE_(r2)
/* 8027CC34 00278894  C1 42 A0 90 */	lfs f10, lbl_80642690-_SDA2_BASE_(r2)
/* 8027CC38 00278898  EC E1 10 28 */	fsubs f7, f1, f2
/* 8027CC3C 0027889C  EC 06 28 28 */	fsubs f0, f6, f5
/* 8027CC40 002788A0  C1 22 A0 94 */	lfs f9, lbl_80642694-_SDA2_BASE_(r2)
/* 8027CC44 002788A4  ED 8A 58 24 */	fdivs f12, f10, f11
/* 8027CC48 002788A8  C0 A2 A0 9C */	lfs f5, lbl_8064269C-_SDA2_BASE_(r2)
/* 8027CC4C 002788AC  D1 03 00 04 */	stfs f8, 4(r3)
/* 8027CC50 002788B0  D1 03 00 08 */	stfs f8, 8(r3)
/* 8027CC54 002788B4  D1 03 00 10 */	stfs f8, 0x10(r3)
/* 8027CC58 002788B8  D1 03 00 18 */	stfs f8, 0x18(r3)
/* 8027CC5C 002788BC  ED 6A 38 24 */	fdivs f11, f10, f7
/* 8027CC60 002788C0  D1 03 00 20 */	stfs f8, 0x20(r3)
/* 8027CC64 002788C4  D1 03 00 24 */	stfs f8, 0x24(r3)
/* 8027CC68 002788C8  D1 03 00 30 */	stfs f8, 0x30(r3)
/* 8027CC6C 002788CC  D1 03 00 34 */	stfs f8, 0x34(r3)
/* 8027CC70 002788D0  D1 03 00 38 */	stfs f8, 0x38(r3)
/* 8027CC74 002788D4  EC EA 00 24 */	fdivs f7, f10, f0
/* 8027CC78 002788D8  D1 43 00 3C */	stfs f10, 0x3c(r3)
/* 8027CC7C 002788DC  FC 00 30 50 */	fneg f0, f6
/* 8027CC80 002788E0  EC 21 10 2A */	fadds f1, f1, f2
/* 8027CC84 002788E4  EC 64 18 2A */	fadds f3, f4, f3
/* 8027CC88 002788E8  EC C9 03 32 */	fmuls f6, f9, f12
/* 8027CC8C 002788EC  EC 00 01 F2 */	fmuls f0, f0, f7
/* 8027CC90 002788F0  FC 40 18 50 */	fneg f2, f3
/* 8027CC94 002788F4  EC 69 02 F2 */	fmuls f3, f9, f11
/* 8027CC98 002788F8  D0 C3 00 00 */	stfs f6, 0(r3)
/* 8027CC9C 002788FC  FC 20 08 50 */	fneg f1, f1
/* 8027CCA0 00278900  EC 8C 00 B2 */	fmuls f4, f12, f2
/* 8027CCA4 00278904  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 8027CCA8 00278908  EC 4B 00 72 */	fmuls f2, f11, f1
/* 8027CCAC 0027890C  D0 63 00 14 */	stfs f3, 0x14(r3)
/* 8027CCB0 00278910  EC 25 01 F2 */	fmuls f1, f5, f7
/* 8027CCB4 00278914  D0 83 00 0C */	stfs f4, 0xc(r3)
/* 8027CCB8 00278918  D0 43 00 1C */	stfs f2, 0x1c(r3)
/* 8027CCBC 0027891C  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 8027CCC0 00278920  4E 80 00 20 */	blr
