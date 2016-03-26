fspace	equ	0x087FFBC4

.gba
.open "blue-us.gba","bassgs.gba",0x08000000

//	6C	Flags
//		01	VanishingWorld used
//		02	DarkAura used
//		04	Sanctuary used
//		08	GetAbility used
//		10	Guardian broken
//		20	Intercept active
//		40	GigaFreeze used
//		80	PurgeBreaker pending
//	6D	Guardian cooldown
//	6E	Combo offset
//	6F	Bits
//		0F	Combo index
//		F0	HP range

// No aura
//.org 0x080D175A
//	b	80D1772h

// Log object summons
.org 0x08003088
	ldr	r7,=logObjectSummon|1b
	bx	r7
	.pool

// Battlefield
.org 0x0800BFDC
	// All sand panels
	db	  0, 10, 10,  0,  0, 10,  9,  0
	db	  0, 10, 10, 10, 10, 10,  9,  0
	db	  0, 10, 10,  0,  0, 10,  9,  0

	// With sand panels
//	db	  0, 10,  2,  0,  0,  2,  9,  0
//	db	  0,  2, 10, 10,  2,  2,  9,  0
//	db	  0, 10,  2,  0,  0,  2,  9,  0

	// Without sand panels
//	db	  0,  2,  2,  0,  0,  2,  9,  0
//	db	  0,  2,  2,  2,  2,  2,  9,  0
//	db	  0,  2,  2,  0,  0,  2,  9,  0

// Extra chip names
.org 0x08010770
	dw	chipNamePtrs

// Enemy chip reward hook
.org 0x08015178
	ldr	r3,=ignoreReward|1b
	bx	r3
	.pool

// Bass stats
.org 0x08019DA8
//	dh	1			// BassGS HP
	dh	2500			// BassGS HP

// Object setup
.org 0x0801A11C
	db	0x00,2,2,0		// MegaMan
	db	0xF2,5,2,1		// BassGS
//	db	0xF2,6,1,1		// BassGS
//	db	0xF2,6,3,1		// BassGS
	db	0xFF

// Extended animations
.org 0x08024878
	dw	bassBNSA
.org 0x08024AB0
	dw	flameBNSA

// Battle settings
.org 0x0812BE50
	db	0x16			// Background (Secret Area)
//	db	0x1D			// Background (Alpha)
.org 0x0812BE56
	db	0x00			// Battlefield
.org 0x0812BE57
	db	0x60			// Music (Great Battlers)

// Update Bass sprite during time freeze
.org 0x08000F74
	ldr	r0,=bassUpdate|1b
	bx	r0
	.pool

// Pre-AI hook
.org 0x080AD864
	ldr	r1,=preAI|1b
	bx	r1
	.pool

// Lag after flinching
.org 0x080AE660
	mov	r0,15			// default 60

// Lag after movement
.org 0x080AEE31
	db	10			// default 16

// Block status hook
.org 0x080AF46C
	ldr	r4,=guardian|1b
	bx	r4
	.pool

// Chip count for Bass
.org 0x080D0CFA
	mov	r1,2			// default 0

// Blue flashing for Bass
.org 0x080D0D74
	ldr	r0,=blueFlashing|1b
	bx	r0
	.pool

// New AI hook
.org 0x080D0F2E
	ldr	r0,=newAI|1b
	bx	r0
	.pool

// AI uses chips
.org 0x080D0F58
	mov	r0,1h
.org 0x080D0F98
	ldr	r0,=useSanctuary|1b
	mov	r14,r15
	bx	r0
	mov	r0,0h
	strb	r0,[r6,0Bh]
	b	80D100Eh
	.pool

// Amount of times to move before attacking (chosen at random)
.org 0x080D101C
	db	2,4,4,5			// default 2,2,3,3

// Lag before firing Buster Shot
.org 0x080D10FE
	mov	r0,0			// default 16

// Lag before firing Buster Rake
.org 0x080D11F6
	mov	r0,10			// default 16

// Gospel Breath movement hook
.org 0x080D12AC
	ldr	r0,=preGospelBreath|1b
	bx	r0
	.pool

// Lag before pulling out Gospel Breath
.org 0x080D12EA
	mov	r0,10			// default 16

// Buster Shot attack length
.org 0x080D1330
	mov	r0,15			// default 60
.org 0x080D133C
	cmp	r0,3			// default 30

// Lag before firing Buster Rake uncharged
.org 0x080D137C
	mov	r0,10			// default 20

// Charge time for Buster Rake
.org 0x080D1392
	mov	r0,60			// default 90
// Charge sound timings for Buster Rake
.org 0x080D13A6
	mov	r1,30			// default 32

// Shot count for charged Buster Rake
.org 0x080D13DE
	mov	r0,36			// default 15
// Shot count for uncharged Buster Rake
.org 0x080D13E6
	mov	r0,15			// default 6

// Lag after firing Buster Rake
.org 0x080D1454
	mov	r0,30			// default 120

// Extended Earth Breaker
.org 0x080D151C
	ldr	r0,=extendedEarthBreakerStart|1b
	bx	r0
	.pool

// Lag before using Earth Breaker
.org 0x080D1528
	mov	r0,15			// default 50

// Extended Earth Breaker
.org 0x080D154C
	ldr	r0,=extendedEarthBreakerEnd|1b
	bx	r0
	.pool

// Earth Breaker attack length (including lag after)
.org 0x080D1554
	mov	r0,35			// default 60
// Earth Breaker impact timing
.org 0x080D1560
	cmp	r0,28			// default 53

// Gospel Claw hook
.org 0x080D15C6
	push	r14
	ldr	r0,=enhancedGospelClaw|1b
	bx	r0
	.pool

// Hijack Vanishing World
.org 0x080D1648
	ldr	r0,=doubleVanishingWorld|1b
	bx	r0
	.pool

// Disable Vanishing World flag
.org 0x080D165A
	nop

// Lag after using Gospel Breath
.org 0x080D16EE
	mov	r0,10			// default 30

// AirShoes for movement
.org 0x080D1726
	mov	r2,0x20

// Aura respawn hook
.org 0x080D1764
	ldr	r1,=respawnAura|1b
	bx	r1
	.pool

// Extended Earth Breaker target
.org 0x080D1828
	ldr	r2,=extendedEarthBreakerTarget|1b
	bx	r2
	.pool

// Extended Earth Breaker hit
.org 0x080D1864
	ldr	r0,=extendedEarthBreakerHit|1b
	bx	r0
	.pool
.org 0x080D1880
	ldr	r4,=extendedEarthBreakerHit2|1b
	bx	r4
	.pool

// AirShoes for Gospel Breath
.org 0x080D19B8
	mov	r2,0x20

// Extended Earth Breaker panel break
.org 0x080E9C80
	ldr	r1,=extendedEarthBreakerBreak|1b
	bx	r1
	.pool

// Gospel Breath head does breaking damage
.org 0x080E9F80
	mov	r1,0Bh

// Vanishing World delay
.org 0x080E9FFE
	ldrh	r0,[r5,2Eh]

// Gospel Breath panel hook
.org 0x080EA124
	ldr	r2,=panelGospelBreath|1b
	bx	r2
	.pool

// Gospel Breath row hook
.org 0x080EA13C
	ldr	r0,=rowGospelBreath|1b
	bx	r0
	.pool

// Vanishing World delay store
.org 0x080EA1CA
	str	r6,[r0,2Ch]

// Gospel Breath element hook
.org 0x080EA214
	ldr	r0,=gospelBreathColor|1b
	bx	r0
	.pool
	bl	8002BF4h
	mov	r0,r4
	bl	8002BDCh
.org 0x080EA23A
	mov	r0,r4

// Gospel Breath width check
.org 0x080EA2CA
	cmp	r1,80h
	blt	80EA2D0h
.org 0x080EA310
	cmp	r1,80h
	blt	80EA316h
.org 0x080EA340
	cmp	r1,80h
	blt	80EA346h

// Extended Auras
.org 0x080EE214
	dw	auraData

// Update cape during time freeze
.org 0x080F07B0
	ldr	r0,=capeUpdate|1b
	bx	r0
	.pool

// Extended animations
.org 0x080F0804
	ldr	r0,=extendedAnimations|1b
	bx	r0
	.pool

// Hijacked AreaGrab
.org 0x080F8B48
	ldr	r1,=areaGrabName|1b
	bx	r1
	.pool
.org 0x080F8B68
	ldr	r0,=extendedAreaGrab|1b
	bx	r0
	.pool
.org 0x080F8B66
	bgt	80F8C04h

// ???????? name for MegaBstr
.org 0x087045EC
	db	0x11,0x2D,0x3A,0x29,0x36,0x04,0x04,0x07,0x0E7

// BassBS name
.org 0x08711CA3
	db	0x0C	// 'B'

// Drop Bass+ X, BassGS X and MegaBstr K
.org 0x080160A8 + 0xF2 * 0x38 + 0x0 * 0x1C
	dh	0x2F37,0x2F37	// Bass+ X
	dh	0x2F38,0x2F38	// BassGS X
	dh	0x2F38,0x2F38	// BassGS X
	dh	0x2F38,0x2F38	// BassGS X
	dh	0x1400,0x1400	// ????????
	dh	0x1400,0x1400	// ????????
	dh	0x1400,0x1400	// ????????
.org 0x080160A8 + 0xF2 * 0x38 + 0x1 * 0x1C
	dh	0x2F37,0x2F37	// Bass+ X
	dh	0x2F38,0x2F38	// BassGS X
	dh	0x2F38,0x2F38	// BassGS X
	dh	0x2F38,0x2F38	// BassGS X
	dh	0x1400,0x1400	// ????????
	dh	0x1400,0x1400	// ????????
	dh	0x1400,0x1400	// ????????

// ???????? chip image
.org 0x086B710C
	.import secretchip.img.bin

// ???????? chip palette
.org 0x086B780C
	.import secretchip.pal.bin






.org fspace
.align 2

logObjectSummon:
	.msg "summon object %r0% type %r4% at %r1%,%r2% (par %r3%)"

	mov	r7,r13
	stmia	[r7]!,r0-r4
	mov	r0,3h
	mov	r1,r13

	ldr	r2,=8003091h
	bx	r2

	.pool



newAI:
	push	r14

	// Remove block status
	ldr	r0,[r5,50h]
	mov	r1,4h
	ldr	r2,=80AF199h
	mov	r14,r15
	bx	r2

	mov	r0,0h
	strh	r0,[r5,20h]	// Clear timer

	// Check if intercept active
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,20h
	mov	r3,r1
	bic	r3,r2		// Clear intercept
	strb	r3,[r5,r0]
	tst	r1,r2
	bne	@@checkPlanned	// Skip intercept checks

@@checkDarkAura:
	bl	useDarkAura
	tst	r0,r0
	bne	@@planIntercept

@@checkGetAbility:
	bl	useGetAbility
	tst	r0,r0
	bne	@@planIntercept

@@checkGigaFreeze:
	bl	useGigaFreeze
	tst	r0,r0
	bne	@@planIntercept

@@checkVanishingWorld:
	bl	useVanishingWorld
	tst	r0,r0
	bne	@@checkPlanned

@@checkSanctuary:
	bl	useSanctuary
	tst	r0,r0
	bne	@@planIntercept

@@checkPurgeBreaker:
	bl	usePurgeBreaker
	tst	r0,r0
	bne	@@planIntercept

@@checkPlanned:
	ldrb	r0,[r6,0Bh]
	lsl	r1,r0,1Ch
	lsr	r1,r1,1Ch
	lsr	r0,r0,4h

	add	r2,r0,r1
	bne	@@do

@@chooseAction:
	// Override AI with random/set actions (debug)
	ldr	r0,=randomActions
	ldrb	r0,[r0]
	tst	r0,r0
	bne	@@randomAction

	bl	getHPRange
	ldr	r3,=combo

	// Check if combo active
	mov	r1,6Eh
	ldrb	r1,[r5,r1]
	tst	r1,r1
	beq	@@newCombo

	// Check if combo ended
	ldrb	r1,[r3,r1]
	tst	r1,r1
	beq	@@newCombo

	// Check if HP range of combo matches current HP range
	mov	r2,6Fh
	ldrb	r1,[r5,r2]
	lsr	r1,r1,4h
	sub	r1,1h
	cmp	r0,r1
	beq	@@continueCombo

	// HP range changed; clear current combo
	mov	r1,0h
	strb	r1,[r5,r2]

@@newCombo:
	push	r0,r3,r6	// r0 = current HP range

	mov	r6,0FFh		// Current combo = -1

	lsl	r0,r0,2h
	ldr	r3,[r3,r0]	// Get combos for current HP range

	mov	r0,64h		// 100
	mov	r1,6Fh
	ldrb	r1,[r5,r1]	// Get current combo
	lsr	r2,r1,4h
	tst	r2,r2
	beq	@@newComboRand	// If no HP range, use full 100

	lsl	r1,r1,1Ch
	lsr	r6,r1,1Ch	// Set current combo
	lsl	r1,r6,1h
	ldrb	r1,[r3,r1]
	sub	r0,r0,r1	// Subtract ratio from current combo

@@newComboRand:
	bl	random		// r0 = random(100)

	mov	r4,0h

@@newComboLoop:
	cmp	r4,r6		// If new combo = current combo, skip
	beq	@@newComboNext

	ldrb	r2,[r3]		// Get ratio for combo
	cmp	r0,r2
	blt	@@newComboEnd

	sub	r0,r0,r2

@@newComboNext:
	add	r3,2h
	add	r4,1h
	b	@@newComboLoop

@@newComboEnd:
	ldrb	r1,[r3,1h]	// Get combo start offset
	mov	r0,6Eh
	strb	r1,[r5,r0]

	pop	r0,r3,r6

	add	r0,1h
	lsl	r0,r0,4h
	add	r0,r0,r4
	mov	r1,6Fh
	strb	r0,[r5,r1]	// Store HP range and current combo

@@continueCombo:
	// Increment combo offset
	mov	r1,6Eh
	ldrb	r0,[r5,r1]
	add	r2,r0,1h
	strb	r2,[r5,r1]

	// Get next action
	ldrb	r0,[r3,r0]
	lsl	r1,r0,1Ch
	lsr	r1,r1,1Ch
	lsr	r0,r0,4h
	b	@@do

@@randomAction:
	ldr	r1,=randomActions
	ldrb	r0,[r1]
	bl	random

	ldr	r1,=randomActions
	add	r1,1h
	ldrb	r0,[r1,r0]
	lsl	r1,r0,1Ch
	lsr	r1,r1,1Ch
	lsr	r0,r0,4h

@@do:
	bl	doAction
	b	@@end

@@planIntercept:
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,20h
	orr	r1,r2
	strb	r1,[r5,r0]
	b	@@end

@@end:
	pop	r15



getHPRange:
	push	r1-r2,r14
	ldrh	r1,[r5,24h]	// Get HP

	mov	r0,0h

	ldr	r2,=834h	// 2100
	cmp	r1,r2
	bge	@@end
	mov	r0,1h

	ldr	r2,=640h	// 1600
	cmp	r1,r2
	bge	@@end
	mov	r0,2h

	ldr	r2,=44Ch	// 1100
	cmp	r1,r2
	bge	@@end
	mov	r0,3h

	ldr	r2,=2BCh	// 700
	cmp	r1,r2
	bge	@@end
	mov	r0,4h

@@end:
	pop	r1-r2,r15



doAction:
	push	r14

	lsl	r0,r0,2h
	add	r2,=@@doActionPtrs
	add	r2,r2,r0
	ldr	r2,[r2]
	bx	r2

.align 4
@@doActionPtrs:
	dw	doMovement|1b
	dw	doAirBurst|1b
	dw	doExplosion|1b
	dw	doChargedExplosion|1b
	dw	doGospelBreath|1b
	dw	doEarthBreaker|1b
	dw	doGospelClaw|1b
	dw	doVanishingWorld|1b
	dw	doPurgeBreaker|1b
	dw	doGospelCombo|1b
	dw	doChip|1b
	dw	doCerberusVanishingWorld|1b
	dw	doNothing|1b
	dw	doNothing|1b
	dw	doNothing|1b
	dw	doNothing|1b

doNothing:
	pop	r15

doMovement:
	cmp	r0,0h
	beq	@@random
	cmp	r0,0Fh
	bne	@@set

@@random:
	mov	r0,8h
	bl	random

	// Set amount of movements
	ldr	r1,=moveCounts
	ldrb	r0,[r1,r0]

@@set:
	strh	r0,[r5,22h]

	// Set movement
	mov	r0,4h
	str	r0,[r6]

	mov	r0,0h
	strb	r0,[r6,0Bh]

	pop	r15

doAirBurst:
	mov	r0,8h
	str	r0,[r6]

	mov	r0,0h
	strb	r0,[r6,0Bh]

	sub	r1,1h
	bmi	@@end

	add	r1,10h
	strb	r1,[r6,0Bh]

@@end:
	pop	r15

doExplosion:
	mov	r0,0h
	strb	r0,[r6,0Bh]

	mov	r0,10h
	str	r0,[r6]

	pop	r15

doChargedExplosion:
	mov	r0,0h
	strb	r0,[r6,0Bh]

	mov	r0,0Ch
	str	r0,[r6]

	pop	r15

doGospelBreath:
	mov	r0,0h
	strb	r0,[r6,0Bh]

	mov	r0,18h
	str	r0,[r6]

	mov	r1,0h

	mov	r0,6Ch
	ldrb	r0,[r5,r0]
	mov	r2,8h
	tst	r0,r2
	beq	@@set

	mov	r0,r10
	ldr	r0,[r0,0Ch]
	ldr	r0,[r0,44h]
	ldr	r0,[r0,50h]
	ldrb	r0,[r0,2h]

	cmp	r0,0h
	bne	@@loadOpposite

	mov	r0,4h
	bl	random

@@loadOpposite:
	ldr	r1,=80AD980h
	ldrb	r1,[r1,r0]
	lsr	r1,r1,1h

@@set:
	strb	r1,[r5,5h]

	pop	r15

doEarthBreaker:
	cmp	r1,0h
	beq	@@random

	mov	r0,0h
	cmp	r1,1h
	beq	@@set

	mov	r0,1h
	cmp	r1,2h
	beq	@@set

@@random:
	mov	r0,2h
	bl	random
	b	@@set

@@set:
	strb	r0,[r5,5h]

	mov	r0,34h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]

	mov	r0,0h
	strb	r0,[r6,0Bh]

@@end:
	pop	r15

doGospelClaw:
	mov	r0,38h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]

	mov	r0,0h
	strb	r0,[r6,0Bh]

	sub	r1,1h
	bmi	@@end

	add	r1,60h
	strb	r1,[r6,0Bh]

@@end:
	pop	r15

doVanishingWorld:
	mov	r0,0h
	strb	r0,[r5,5h]
	mov	r0,3Ch
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]

	mov	r0,0h
	strb	r0,[r6,0Bh]

	pop	r15

doPurgeBreaker:
	mov	r0,2h
	strb	r0,[r5,5h]

	mov	r0,34h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]

	cmp	r1,1h		// Check for chained Purge Breaker
	beq	@@end

	mov	r0,0h		// Plan nothing
	strb	r0,[r6,0Bh]

@@end:
	pop	r15

doGospelCombo:
	cmp	r1,0h
	beq	doGospelBurst
	cmp	r1,2h
	beq	doGospelClawBreath
	cmp	r1,3h
	bge	doGospelStorm

doGospelBurst:
	mov	r0,38h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]
	mov	r0,0h
	strb	r0,[r5,5h]

	ldrb	r0,[r6,0Bh]
	lsl	r0,r0,1Ch
	lsr	r0,r0,1Ch
	add	r0,91h
	cmp	r0,92h
	bne	@@set
	mov	r0,10h

@@set:
	strb	r0,[r6,0Bh]

	pop	r15

doGospelClawBreath:
	mov	r0,38h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]
	mov	r0,1h
	strb	r0,[r5,5h]

	mov	r0,40h
	strb	r0,[r6,0Bh]

	pop	r15

doGospelStorm:
	mov	r0,38h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]
	mov	r0,2h
	strb	r0,[r5,5h]

	add	r1,91h
	cmp	r1,98h
	blt	@@set
	mov	r1,40h

@@set:
	strb	r1,[r6,0Bh]

	pop	r15

doChip:
	cmp	r1,0h
	beq	doDarkAura
	cmp	r1,1h
	beq	doGetAbility
	cmp	r1,2h
	beq	doGigaFreeze
	cmp	r1,3h
	beq	doSanctuary

doDarkAura:
	mov	r0,0h
	mov	r1,135h-81h
	ldrb	r2,[r5,16h]
	mov	r3,0Ah

	ldr	r4,=8008E55h
	mov	r14,r15
	bx	r4

	// Set intercept active
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,20h
	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,0Fh		// Plan movement
	strb	r0,[r6,0Bh]
	pop	r15

doGetAbility:
	mov	r0,0h
	mov	r1,0FDh
	ldrb	r2,[r5,16h]
	mov	r3,0Ah

	ldr	r4,=8008E55h
	mov	r14,r15
	bx	r4

	// Set intercept active
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,20h
	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,40h		// Plan Gospel Breath
	strb	r0,[r6,0Bh]
	pop	r15

doGigaFreeze:
	mov	r0,0h
	mov	r1,0FEh
	ldrb	r2,[r5,16h]
	mov	r3,0Ah

	ldr	r4,=8008E55h
	mov	r14,r15
	bx	r4

	// Set intercept active
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,20h
	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,0Fh		// Plan movement
	strb	r0,[r6,0Bh]
	pop	r15

doSanctuary:
	mov	r0,4h
	mov	r1,7h
	ldrb	r2,[r5,16h]
	mov	r3,0Ah

	ldr	r4,=8008E55h
	mov	r14,r15
	bx	r4

	// Set intercept active
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,20h
	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,0Fh		// Plan movement
	strb	r0,[r6,0Bh]
	pop	r15

doCerberusVanishingWorld:
	// Increment parameter
	mov	r0,0B0h
	add	r0,r0,r1
	add	r0,1h
	strb	r0,[r6,0Bh]

	// Set intercept active
	mov	r0,6Ch
	ldrb	r2,[r5,r0]
	mov	r3,20h
	orr	r2,r3
	strb	r2,[r5,r0]

	cmp	r1,0h
	beq	@@objectCheck
	cmp	r1,1h
	beq	@@move
	cmp	r1,2h
	beq	@@attack

@@objectCheck:
	// Check if something in 6,2
	mov	r0,6h
	mov	r1,2h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	bne	@@end

	mov	r1,1h
	bl	doPurgeBreaker

@@move:
	mov	r0,6h
	mov	r1,2h
	strb	r0,[r6,4h]
	strb	r1,[r6,5h]

	mov	r0,28h
	strb	r0,[r5,9h]
	mov	r0,0h
	strb	r0,[r5,0Ah]
	b	@@end

@@attack:
	mov	r0,1h
	strb	r0,[r5,5h]

	mov	r0,3Ch
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]

	mov	r0,0Fh		// Plan nothing
	strb	r0,[r6,0Bh]

@@end:
	pop	r15



random:
	push	r0-r3,r14

	ldr	r0,=80016A3h
	mov	r14,r15
	bx	r0

	lsr	r0,r0,8h
	pop	r1
	swi	6h		// div

	mov	r0,r1
	pop	r1-r3,r15

	.pool



preGospelBreath:
	push	r14
	bl	moveGospelBreath
	tst	r0,r0
	ldr	r2,=80D12B5h
	bx	r2



moveGospelBreath:
	push	r4,r5,r14
	add	sp,-10h

	mov	r5,0h		// Set checked enemy panels to 0

	ldr	r2,=80013E1h
	mov	r14,r15
	bx	r2		// Get target's position
	str	r1,[sp,4h]	// Set Y to target's Y
	mov	r0,3h
	str	r0,[sp]		// Set starting X to 3

	mov	r2,2h		// Set rows to check to 2
	mov	r0,1h		// Set check position to downwards
	cmp	r1,1h		// If target in top row, check downwards 1 row
	beq	@@init

	sub	r0,2h		// Set check position to upwards
	cmp	r1,3h		// If target in bottom row, check upwards 1 row
	beq	@@init

	mov	r0,2h
	bl	random
	lsl	r2,r0,1h
	mov	r0,1h
	sub	r0,r0,r2	// Set check position to random
	mov	r2,3h		// Set rows to check to 3

@@init:
	str	r0,[sp,8h]	// Row direction
	str	r2,[sp,0Ch]	// Rows to check

@@checkPanel:
	ldr	r0,[sp]		// Panel X
	ldr	r1,[sp,4h]	// Panel Y
	ldr	r3,=800B4F3h
	mov	r14,r15
	bx	r3		// Get panel info

	mov	r1,20h
	tst	r0,r1		// Check if enemy panel
	beq	@@nextPanel	// If not, skip this panel

	add	r5,1h		// Increment checked enemy panels

	ldr	r0,[sp]		// Panel X
	ldr	r1,[sp,4h]	// Panel Y

	cmp	r0,6h		// Check if back row (if so, always check)
	beq	@@doCheck
	cmp	r5,2h		// Check if second or greater enemy panel
	blt	@@nextPanel

@@doCheck:
	mov	r2,20h		// AirShoes
	ldr	r3,=3E080080h
	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4		// Check if panel can be moved to

	tst	r0,r0		// Check result
	beq	@@nextPanel

	ldr	r0,[sp]		// Panel X
	ldr	r1,[sp,4h]	// Panel Y
	b	@@end

@@nextPanel:
	ldr	r0,[sp]		// Panel X
	add	r0,1h
	str	r0,[sp]
	cmp	r0,6h
	blt	@@checkPanel

	ldr	r0,[sp,0Ch]	// Rows to check
	sub	r0,1h
	beq	@@cancel
	str	r0,[sp,0Ch]

	ldr	r0,[sp,8h]	// Row direction
	ldr	r1,[sp,4h]	// Panel Y
	add	r1,r1,r0

@@checkLower:
	cmp	r1,4h
	bne	@@checkUpper
	mov	r1,1h

@@checkUpper:
	cmp	r1,0h
	bne	@@checkNextRow
	mov	r1,3h

@@checkNextRow:	
	str	r1,[sp,4h]
	mov	r5,0h
	b	@@checkPanel

@@cancel:
	mov	r0,0h

@@end:
	add	sp,10h
	pop	r4,r5,r15



panelGospelBreath:
	ldrb	r2,[r5,13h]
	ldrh	r6,[r5,2Ch]
	mov	r7,64h
	add	r7,r7,r5

	ldr	r4,[r5,4Ch]
	ldrb	r4,[r4,5h]

	ldr	r0,=80EA12Fh
	bx	r0



rowGospelBreath:
	ldrh	r0,[r5,20h]
	cmp	r0,5Ah
	beq	@@doRow
	cmp	r0,50h
	bne	@@soundEffect

@@doRow:
	ldrb	r1,[r5,12h]
	ldrb	r2,[r5,13h]
	ldrh	r6,[r5,2Ch]
	mov	r7,68h

	ldr	r4,[r5,4Ch]
	ldrb	r4,[r4,5h]
	add	r4,80h

	ldrb	r0,[r5,0Bh]
	cmp	r0,4h
	beq	@@setRow

	sub	r1,1h
	ble	@@soundEffect
	add	r7,4h

@@setRow:
	add	r0,4h
	strb	r0,[r5,0Bh]

	sub	r1,2h
	ble	@@soundEffect
	add	r7,r7,r5

	ldr	r0,=80EA36Bh
	mov	r14,r15
	bx	r0

@@soundEffect:
	ldr	r0,=80EA155h
	bx	r0



gospelBreathColor:
	mov	r0,0h
	ldrb	r1,[r5,4h]
	cmp	r1,80h
	blt	@@setAnimation
	mov	r0,3h

@@setAnimation:
	strb	r0,[r5,10h]
	strb	r0,[r5,11h]

	// Prepare palette
	lsl	r1,r1,1Ch
	lsr	r4,r1,1Ch

	ldr	r3,=80EA21Dh
	bx	r3

	.pool



enhancedGospelClaw:
	ldrb	r1,[r5,5h]	// 0 = >=75%
				// 1 = 50%-75%
				// 2 = <50%

//	ldrh	r0,[r5,24h]	// Current HP
//	ldrh	r1,[r5,26h]	// Max HP
//	lsr	r1,r1,2h
//	bgt	@@calcHP
//	mov	r1,1h
//
//@@calcHP:
//	swi	6h		// div
//	mov	r1,r0		// r1 = Current HP / (Max HP / 4)
//				// 0/1 = <50%
//				// 2 = 50%-75%
//				// 3/4 = >=75%

	ldrb	r0,[r5,0Bh]
	tst	r0,r0
	bne	@@continue

	mov	r0,17h
	strh	r0,[r5,20h]
	mov	r0,0Ch
	strb	r0,[r5,10h]
	mov	r0,4h
	strb	r0,[r5,0Bh]
	b	@@end

@@continue:
	ldrh	r0,[r5,20h]
	cmp	r0,0Dh
	beq	@@topclaw
	cmp	r0,1h
	beq	@@bottomclaw
	cmp	r1,0h
	beq	@@increment
	cmp	r0,7h
	beq	@@middleclaw
	cmp	r1,1h
	ble	@@increment
	cmp	r0,0Ah
	beq	@@bottomclaw
	cmp	r0,4h
	bne	@@increment

@@topclaw:
	mov	r0,1h
	b	@@doclaw
@@middleclaw:
	mov	r0,2h
	b	@@doclaw
@@bottomclaw:
	mov	r0,3h

@@doclaw:
	ldr	r2,=80D18A1h
	add	r2,10h
	mov	r14,r15
	bx	r2
	ldr	r0,=80D18A1h
	mov	r14,r15
	bx	r0

@@increment:
	ldrh	r0,[r5,20h]
	sub	r0,1h
	strh	r0,[r5,20h]
	bgt	@@end

	mov	r0,24h
	strb	r0,[r5,9h]
	mov	r0,0h
	strh	r0,[r5,0Ah]

@@end:
	pop	r15

	.pool



useVanishingWorld:
	push	r14

	ldrh	r0,[r5,24h]	// Current HP
	ldr	r1,=2BCh	// 700
	
	cmp	r0,r1
	bge	@@end		// Check if HP is below 700

	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,1h
	tst	r1,r2
	bne	@@end		// Check if already used

	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,0B0h
	strb	r0,[r6,0Bh]	// Plan First Vanishing World

	mov	r0,1h
	pop	r15

@@end:
	mov	r0,0h
	pop	r15



useDarkAura:
	push	r4,r14

	ldrh	r0,[r5,24h]	// Current HP
	ldr	r1,=834h	// 2100

	cmp	r0,r1
	bge	@@end		// Check if HP is below 2100

	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,2h
	tst	r1,r2
	bne	@@end		// Check if already used

	orr	r1,r2
	strb	r1,[r5,r0]

	ldrb	r0,[r5,1Ah]
	sub	r0,1h
	bmi	@@end
	strb	r0,[r5,1Ah]

	mov	r0,0A0h
	strb	r0,[r6,0Bh]	// Plan DarkAura

	mov	r0,1h
	pop	r4,r15

@@end:
	mov	r0,0h
	pop	r4,r15



useGetAbility:
	push	r4,r14

	ldrh	r0,[r5,24h]	// Current HP
	ldr	r1,=640h	// 1600

	cmp	r0,r1
	bge	@@end		// Check if HP is below 1600

	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,8h
	tst	r1,r2
	bne	@@end		// Check if already used

	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,0A1h		// Plan GetAbility
	strb	r0,[r6,0Bh]

	mov	r0,1h
	pop	r4,r15

@@end:
	mov	r0,0h
	pop	r4,r15



useGigaFreeze:
	push	r4,r14

	ldrh	r0,[r5,24h]	// Current HP
	ldr	r1,=44Ch	// 1100

	cmp	r0,r1
	bge	@@end		// Check if HP is below 1600

	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,40h
	tst	r1,r2
	bne	@@end

	orr	r1,r2
	strb	r1,[r5,r0]

	mov	r0,0A2h		// Plan GigaFreeze
	strb	r0,[r6,0Bh]

	mov	r0,1h
	pop	r4,r15

@@end:
	mov	r0,0h
	pop	r4,r15



useSanctuary:
	push	r4,r7,r14

	// Count the number of Holy Panels
	ldr	r3,=200F49Eh + 1h * 8h + 1h
	ldr	r4,=200F476h + 1h * 8h + 1h
	mov	r2,2h * 8h
	mov	r7,0h
@@rowLoop:
	mov	r1,5h
@@colLoop:
	// Check panel color
	add	r0,r3,r2
	ldrb	r0,[r0,r1]
	tst	r0,r0
	beq	@@colLoopEnd

	// Check panel type
	add	r0,r4,r2
	ldrb	r0,[r0,r1]
	// If HolyPanel found, increment
	cmp	r0,9h
	bne	@@colLoopEnd

	add	r7,1h

@@colLoopEnd:
	sub	r1,1h
	bpl	@@colLoop

	sub	r2,8h
	bpl	@@rowLoop

	// Check if less than 2 HolyPanels
	cmp	r7,2h
	bge	@@end

	// Check if Sanctuary already used
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,4h
	tst	r1,r2
	bne	@@end

	orr	r1,r2
	strb	r1,[r5,r0]

	ldrb	r0,[r5,1Ah]
	sub	r0,1h
	bmi	@@end
	strb	r0,[r5,1Ah]

	mov	r0,0A3h
	strb	r0,[r6,0Bh]	// Plan Sanctuary

	mov	r0,1h
	pop	r4,r7,r15

@@end:
	mov	r0,0h
	pop	r4,r7,r15



usePurgeBreaker:
	push	r4,r14

	// Check if something in 6,1
	mov	r0,6h
	mov	r1,1h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	beq	@@found

	// Check if something in 6,2
	mov	r0,6h
	mov	r1,2h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	beq	@@found

	// Check if something in 6,3
	mov	r0,6h
	mov	r1,3h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	bne	@@end

@@found:
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,80h
	mov	r3,r1
	orr	r3,r2
	strb	r3,[r5,r0]	// Set pending

	tst	r1,r2		// Check if previously pending
	beq	@@end		// If not, wait until next action

	mov	r0,3h		// 1-in-3 chance
	bl	random

	tst	r0,r0
	bne	@@end		// Wait until next action

	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,80h
	bic	r1,r2
	strb	r1,[r5,r0]	// Clear pending

	mov	r0,80h
	strb	r0,[r6,0Bh]	// Plan Purge Breaker

	mov	r0,1h
	pop	r4,r15

@@clear:
	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r2,80h
	bic	r1,r2
	strb	r1,[r5,r0]	// Clear pending

@@end:
	mov	r0,0h
	pop	r4,r15

	.pool



extendedAnimations:
	push	r14
	ldr	r0,[r5,4Ch]
	ldrb	r1,[r0,10h]
	cmp	r1,1Ch
	bgt	@@extended

	add	r1,0Eh
	b	@@end

@@extended:
	add	r1,2h

@@end:
	ldr	r7,=80F080Dh
	bx	r7



extendedEarthBreakerStart:
	mov	r0,0Ah
	ldrb	r1,[r5,5h]
	tst	r1,r1
	beq	@@end
	mov	r0,1Dh

@@end:
	strb	r0,[r5,10h]
	mov	r0,11h
	add	r0,0FFh
	ldr	r1,=80D1525h
	bx	r1



extendedEarthBreakerTarget:
	ldrb	r2,[r5,5h]
	cmp	r2,1h
	beq	@@reverse
	cmp	r2,2h
	beq	@@back
	b	@@normal

@@revertNormal:
	mov	r2,0h
	strb	r2,[r5,5h]

@@normal:
	add	r0,1h
	b	@@end

@@reverse:
	cmp	r0,1h
	ble	@@revertNormal
	sub	r0,1h
	b	@@end

@@back:
	push	r2-r7

@@checkMiddle:
	// Check if something in 5,2
	mov	r0,5h
	mov	r1,2h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	beq	@@checkRandom

	// Check if player owns 4,2
	mov	r0,4h
	mov	r1,2h

	ldr	r3,=800B4F3h
	mov	r14,r15
	bx	r3		// Get panel info

	mov	r1,20h
	tst	r0,r1		// Check if enemy panel
	beq	@@checkRandom	// If not, use either 5,1 or 5,3

	mov	r0,5h
	mov	r1,2h
	b	@@backEnd

@@checkRandom:
	// Choose preference randomly
	mov	r0,2h
	bl	random

	ldr	r5,=313h
	lsl	r0,r0,2h
	lsr	r5,r0
	lsl	r5,r5,18h
	lsr	r5,r5,18h

@@checkTop:
	// Check if something in 6,1
	mov	r0,6h
	mov	r1,1h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	bne	@@checkBelow

	// Prefer 5,1
	mov	r5,13h

@@checkBelow:
	// Check if something in 6,3
	mov	r0,6h
	mov	r1,3h
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	bne	@@checkPreferred

	// Prefer 5,3
	mov	r5,31h

@@checkPreferred:
	mov	r0,5h
	lsl	r1,r5,18h
	lsr	r1,r1,1Ch
	mov	r2,20h
	ldr	r3,=3E080080h

	ldr	r4,=800BF07h
	mov	r14,r15
	bx	r4

	tst	r0,r0
	beq	@@useSecond

	mov	r0,5h
	lsl	r1,r5,18h
	lsr	r1,r1,1Ch
	b	@@backEnd

@@useSecond:
	mov	r0,5h
	lsl	r1,r5,18h
	lsr	r1,r1,1Ch

@@backEnd:
	pop	r2-r7

@@end:
	str	r0,[sp]
	str	r1,[sp,4h]
	mov	r2,0h
	ldr	r3,=80D1831h
	bx	r3



extendedEarthBreakerEnd:
	mov	r0,0Bh
	ldrb	r1,[r5,5h]
	tst	r1,r1
	beq	@@end
	mov	r0,1Eh

@@end:
	strb	r0,[r5,10h]
	mov	r0,0Ah
	strh	r0,[r5,30h]
	ldr	r0,=80D1555h
	bx	r0



extendedEarthBreakerHit:
	ldrb	r0,[r5,12h]
	ldrb	r1,[r5,5h]
	tst	r1,r1
	beq	@@normal

	add	r0,1h
	b	@@end

@@normal:
	sub	r0,1h

@@end:
	str	r0,[sp]
	ldrb	r0,[r5,13h]
	ldr	r1,=80D186Dh
	bx	r1



extendedEarthBreakerHit2:
	ldrb	r4,[r5,5h]
	cmp	r4,2h		// Check if Purge Breaker
	bne	@@normal

	ldr	r6,=270Fh	// Do 9999 damage
	b	@@end

@@normal:
	ldr	r6,[r5,r6]
	ldrb	r6,[r6,4h]
	add	r6,r6,r6

@@end:
	mov	r4,0h
	ldr	r7,=80D1889h
	bx	r7



extendedEarthBreakerBreak:
	ldrb	r1,[r5,13h]

	lsl	r2,r1,3h
	add	r2,r2,r0
	lsl	r2,r2,4h
	ldr	r3,=200F520h
	add	r2,r2,r3

	ldrb	r3,[r2,1h]	// get panel color
	tst	r3,r3
	beq	@@break

	ldrb	r3,[r2]		// get panel type
	cmp	r3,9h		// check if holy panel
	beq	@@end

@@break:
	ldr	r3,=800B69Dh
	mov	r14,r15
	bx	r3

@@end:
	mov	r0,0h

	ldr	r1,=80E9C8Bh
	bx	r1

	.pool



areaGrabName:
	add	r0,0Dh
	mov	r1,23h
	ldrb	r2,[r5,5h]
	cmp	r2,0FDh
	beq	@@addSpecial
	cmp	r2,0FEh
	beq	@@addSpecial
	b	@@end

@@addSpecial:
	add	r2,82h

@@end:
	add	r2,81h
	ldr	r4,=80F8B51h
	bx	r4



extendedAreaGrab:
	ldrb	r0,[r5,5h]
	cmp	r0,135h-81h
	bne	@@checkGetAbility
	bl	@@darkAura

@@checkGetAbility:
	cmp	r0,0FDh
	bne	@@checkGigaFreeze
	bl	@@getAbility

@@checkGigaFreeze:
	cmp	r0,0FEh
	bne	@@checkAreaGrab
	bl	@@gigaFreeze

@@checkAreaGrab:
	tst	r0,r0
	bne	@@areaGrab

@@panelGrab:
	ldrb	r0,[r5,6h]
	ldr	r3,=80F8B71h
	bx	r3

@@areaGrab:
	ldr	r3,=80F8BA9h
	bx	r3

@@gigaFreeze:
	push	r4-r5,r7
	ldr	r5,[r5,10h]

	ldrh	r0,[r5,20h]
	sub	r0,1h
	beq	@@gigaFreezeMidEnd
	bmi	@@gigaFreezeStart

	strh	r0,[r5,20h]

	mov	r1,0FFh
	add	r1,28h
	cmp	r0,r1
	beq	@@gigaFreezeCharge
	mov	r1,0FFh
	add	r1,0Ah
	cmp	r0,r1
	beq	@@gigaFreezeCharge
	cmp	r0,0EBh
	beq	@@gigaFreezeCharge
	cmp	r0,0BEh
	beq	@@gigaFreezePrep
	cmp	r0,0AEh
	beq	@@gigaFreezePrep2
	cmp	r0,092h
	beq	@@gigaFreezeRumble
	cmp	r0,82h
	beq	@@gigaFreezeAttack
	cmp	r0,78h
	beq	@@gigaFreezeFlashIn
	cmp	r0,68h
	beq	@@gigaFreezeFlashOut
	cmp	r0,48h
	beq	@@gigaFreezeRumble
	cmp	r0,28h
	beq	@@gigaFreezeRumble
	cmp	r0,14h
	beq	@@gigaFreezeReTimeStop
	cmp	r0,1h
	beq	@@gigaFreezeFinish

	b	@@gigaFreezeNext

@@gigaFreezeStart:
	// Prepare SlowGauge arrow
	ldr	r7,=80FA794h
	ldmia	[r7]!,r0-r2

	push	r5

	ldr	r3,=8000A35h
	mov	r14,r15
	bx	r3

	pop	r5

	mov	r0,6h		// Set charging animation
	strb	r0,[r5,10h]

	mov	r4,0h
	mov	r7,4Ch
	add	r7,r7,r5
	ldr	r0,=80F0937h
	mov	r14,r15
	bx	r0		// Set charging arm

	mov	r1,1h
	strb	r1,[r0,5h]	// Animate arm during time freeze

	mov	r0,46h
	add	r0,0FFh		// Start timer
	strh	r0,[r5,20h]

@@gigaFreezeCharge:
	mov	r0,8Fh
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	b	@@gigaFreezeNext

@@gigaFreezePrep:
	// Start animation
	ldrh	r0,[r5,2Eh]
	mov	r1,5h
	bic	r0,r1
	strh	r0,[r5,2Eh]

	mov	r0,0Ah		// Set EarthBreaker prep animation
	strb	r0,[r5,10h]

	mov	r0,0h		// Remove arm
	str	r0,[r5,4Ch]

	mov	r0,0B5h		// MegaMan charge SFX
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	// Start rumble
	mov	r0,1h
	mov	r1,46h
	ldr	r2,=8022B69h
	mov	r14,r15
	bx	r2

	b	@@gigaFreezeNext

@@gigaFreezePrep2:
	// Start fade out
	mov	r0,14h
	mov	r1,8h
	ldr	r2,=8005289h
	mov	r14,r15
	bx	r2

	b	@@gigaFreezeNext

@@gigaFreezeAttack:
	mov	r0,0Bh		// Set EarthBreaker animation
	strb	r0,[r5,10h]

	b	@@gigaFreezeNext

@@gigaFreezeFlashIn:
	// Play SFX
	mov	r0,0DFh
//	mov	r0,0EBh
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	// Heavy rumble
	mov	r0,3h
	mov	r1,7Ah
	ldr	r2,=8022B69h
	mov	r14,r15
	bx	r2

	ldr	r1,=200F520h
	mov	r2,0h

@@gigaFreezeFlashInLoop:
	ldrb	r0,[r1,1h]	// get panel color
	tst	r0,r0
	bne	@@gigaFreezeFlashInLoopEnd

	ldrb	r0,[r1]		// get panel type
	cmp	r0,0h
	beq	@@gigaFreezeFlashInLoopEnd

	bl	gigaFreezePanelEffect

@@gigaFreezeFlashInLoopEnd:
	add	r1,10h
	add	r2,1h
	cmp	r2,28h
	blt	@@gigaFreezeFlashInLoop

	b	@@gigaFreezeNext

@@gigaFreezeRumble:
	mov	r0,0D8h
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	b	@@gigaFreezeNext

@@gigaFreezeMidEnd:
	b	@@gigaFreezeEnd

@@gigaFreezeFlashOut:
	bl	gigaFreezeFlashOut

	b	@@gigaFreezeRumble

@@gigaFreezeReTimeStop:
	mov	r0,6h
	mov	r1,8h
	ldr	r2,=8005289h
	mov	r14,r15
	bx	r2

	b	@@gigaFreezeNext

@@gigaFreezeFinish:
	mov	r0,1h		// Light rumble
	mov	r1,1Eh
	ldr	r2,=8022B69h
	mov	r14,r15
	bx	r2

	mov	r0,0h		// Set standard animation
	strb	r0,[r5,10h]

	b	@@gigaFreezeNext

@@gigaFreezeNext:
	ldrh	r0,[r5,20h]
	cmp	r0,5Ah
	bgt	@@gigaFreezeNextEnd

	// Set SlowGauge arrow
	mov	r0,78h
	mov	r1,0Ch
	ldr	r2,=800A113h
	mov	r14,r15
	bx	r2

@@gigaFreezeNextEnd:
	// Start animation
	ldrh	r0,[r5,2Eh]
	mov	r1,5h
	bic	r0,r1
	strh	r0,[r5,2Eh]

	pop	r4-r5,r7
	mov	r0,1h
	strh	r0,[r5,8h]
	pop	r15	

@@gigaFreezeEnd:
	pop	r4-r5,r7

	ldr	r3,=80F8BFDh
	bx	r3

@@getAbility:
	push	r4-r5,r7
	ldr	r5,[r5,10h]
	
	ldrh	r0,[r5,20h]
	sub	r0,1h
	beq	@@getAbilityEnd
	bmi	@@getAbilityStart

	strh	r0,[r5,20h]

	cmp	r0,69h
	beq	@@getAbilitySFX
	cmp	r0,4Bh
	beq	@@getAbilitySFX
	cmp	r0,2Dh
	beq	@@getAbilitySFX
	cmp	r0,1h
	beq	@@getAbilityFinish
	b	@@getAbilityNext

@@getAbilityStart:
	mov	r0,6h		// Set charging animation
	strb	r0,[r5,10h]

	mov	r4,0h
	mov	r7,4Ch
	add	r7,r7,r5
	ldr	r0,=80F0937h
	mov	r14,r15
	bx	r0		// Set charging arm

	mov	r1,1h
	strb	r1,[r0,5h]	// Animate arm during time freeze

	mov	r0,87h		// Start timer
	strh	r0,[r5,20h]

@@getAbilitySFX:
	mov	r0,8Fh
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	b	@@getAbilityNext

@@getAbilityFinish:
	mov	r0,84h		// ping
	//mov	r0,79h		// AreaGrab
	//mov	r0,0DFh		// clash?
	//mov	r0,0EBh		// ice appear?
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	mov	r0,0Ch		// Set pointing animation
	strb	r0,[r5,10h]

	mov	r0,0h		// Remove arm
	str	r0,[r5,4Ch]

@@getAbilityNext:
	pop	r4-r5,r7
	mov	r0,1h
	strh	r0,[r5,8h]
	pop	r15	

@@getAbilityEnd:
	pop	r4-r5,r7

	ldr	r3,=80F8BFDh
	bx	r3

@@darkAura:
	push	r5,r7
	ldr	r5,[r5,10h]

	// Remove current Aura
	ldr	r1,[r5,50h]
	ldrb	r0,[r1,6h]
	tst	r0,r0
	beq	@@spawnAura

	mov	r0,0h
	strb	r0,[r1,6h]
	pop	r5,r7
	mov	r0,1h
	strh	r0,[r5,8h]
	pop	r15

@@spawnAura:
	mov	r0,20h
	ldr	r1,[r5,50h]
	strb	r0,[r1,6h]
	mov	r4,0Ch
	ldr	r7,=80EE2C7h
	mov	r14,r15
	bx	r7
	str	r7,[r5,60h]

	pop	r5,r7

	ldr	r3,=80F8BFDh
	bx	r3



gigaFreezePanelEffect:
	push	r0-r4,r14

	lsl	r0,r2,1Dh
	lsr	r0,r0,1Dh
	lsr	r1,r2,3h

	ldr	r2,=801455Bh
	mov	r14,r15
	bx	r2

	mov	r2,r1
	mov	r1,r0
	mov	r3,0h
	mov	r4,32h

	ldr	r0,=80EDE81h
	mov	r14,r15
	bx	r0

	pop	r0-r4,r15



gigaFreezeFlashOut:
	push	r14

	// Start fade in
	mov	r0,13h
	mov	r1,3h
	ldr	r2,=8005289h
	mov	r14,r15
	bx	r2

	// Stop animation
	ldrh	r0,[r5,2Eh]
	mov	r1,4h
	orr	r0,r1
	strh	r0,[r5,2Eh]

	// Set SlowGauge
	mov	r1,r10
	ldr	r1,[r1,0Ch]
	mov	r0,10h
	strb	r0,[r1,0Fh]

	// Remove all obstacles
	ldr	r4,=800302Ch
	ldr	r3,[r4,4h]

@@gigaFreezeObjectLoop:
	ldr	r2,=obstacleValues

@@gigaFreezeObjectCheck:
	ldrb	r1,[r2]
	cmp	r1,0FFh
	beq	@@gigaFreezeObjectNext
	ldrb	r0,[r3,11h]
	cmp	r0,r1
	bne	@@gigaFreezeObjectCheckNext

	mov	r0,0h
	strh	r0,[r3,34h]
	mov	r0,2h
	strh	r0,[r3,3Eh]
	mov	r1,94h
	ldr	r0,[r3,r1]
	mov	r1,26h
	strb	r0,[r3,r1]
	mov	r0,10h
	strb	r0,[r3,19h]
	mov	r0,0h
	strh	r0,[r3,1Ah]
	mov	r0,14h
	mov	r1,28h
	strb	r0,[r3,r1]

@@gigaFreezeObjectCheckNext:
	add	r2,1h
	b	@@gigaFreezeObjectCheck

@@gigaFreezeObjectNext:
	ldrb	r0,[r4,0Ch]
	add	r3,r3,r0
	ldr	r0,[r4,8h]
	cmp	r3,r0
	blt	@@gigaFreezeObjectLoop

	// Set all player panels to Ice
	ldr	r1,=200F520h
	mov	r2,0h

@@gigaFreezeFlashLoop:
	ldrb	r0,[r1,1h]
	tst	r0,r0
	bne	@@gigaFreezeFlashLoopEnd

	ldrb	r0,[r1]
	cmp	r0,0h
	beq	@@gigaFreezeFlashLoopEnd

	//mov	r0,7h
	//strb	r0,[r1]

	push	r0-r3,r7

	ldrb	r3,[r1,1h]
	lsl	r0,r2,1Dh
	lsr	r0,r0,1Dh
	lsr	r1,r2,3h
	mov	r2,7h

	push	r0-r3

	ldr	r7,=800B791h
	mov	r14,r15
	bx	r7

	pop	r0-r3

	ldr	r7,=800B7F9h
	mov	r14,r15
	bx	r7

	pop	r0-r3,r7

	//bl	gigaFreezePanelEffect

@@gigaFreezeFlashLoopEnd:
	add	r1,10h
	add	r2,1h
	cmp	r2,28h
	blt	@@gigaFreezeFlashLoop

	pop	r15



respawnAura:
	cmp	r0,2h*2h
	bne	@@normal

	mov	r0,6Ch
	ldrb	r1,[r5,r0]
	mov	r0,2h
	tst	r1,r0
	beq	@@normal	// Check if DarkAura wasn't used

	mov	r0,20h
	mov	r4,0Ch
	b	@@setAura

@@normal:
	ldrb	r0,[r2]
	ldrb	r4,[r2,1h]

@@setAura:
	ldr	r1,[r5,50h]
	strb	r0,[r1,6h]
	ldr	r7,=80D176Dh
	bx	r7

	.pool



bassUpdate:
	ldrh	r0,[r5,2Eh]
	tst	r0,r1
	beq	@@update

	ldrb	r0,[r5,0Fh]	// Check enemy value
	cmp	r0,0F0h
	beq	@@next
	cmp	r0,0F1h
	beq	@@next
	cmp	r0,0F2h
	beq	@@next
	cmp	r0,0F3h
	bne	@@end

@@next:
	ldr	r2,=200A810h
	ldr	r0,[r2,10h]	// Get object that used chip
	cmp	r0,r5
	bne	@@end

	ldrb	r0,[r2]
	cmp	r0,4h
	bne	@@end

	ldrh	r0,[r5,20h]	// Get Bass timer
	cmp	r0,1h
	ble	@@end

@@update:
	ldr	r3,=8002635h
	mov	r14,r15
	bx	r3

@@end:
	pop	r15



capeUpdate:
	ldrb	r0,[r5,4h]
	tst	r0,r0
	bne	@@updateSprite

	ldr	r0,=80149BFh
	mov	r14,r15
	bx	r0
	beq	@@updateSprite

	ldr	r2,=200A810h
	ldr	r0,[r2,10h]	// Get object that used chip
	ldr	r1,[r5,4Ch]	// Get Bass object
	cmp	r0,r1
	bne	@@end

	ldrb	r0,[r2]
	cmp	r0,4h
	bne	@@end

	ldrh	r0,[r1,20h]	// Get Bass timer
	cmp	r0,0h
	beq	@@end

@@updateSprite:
	ldr	r0,=8000F39h
	mov	r14,r15
	bx	r0

@@end:
	pop	r15

	.pool



blueFlashing:
	ldr	r0,[r5,50h]
	ldrb	r0,[r0,5h]
	mov	r1,4h
	tst	r0,r1
	beq	@@end

	mov	r1,r10
	ldr	r1,[r1,50h]
	ldrh	r0,[r1]

	// Slow flicker (invincibility style)
//	lsl	r0,r0,1Dh
//	lsr	r0,r0,1Fh
//	mov	r1,11h
//	mul	r0,r1
//	mov	r1,r0
//	add	r1,1h
//	lsl	r0,r0,5h
//	lsl	r1,r1,0Ah
//	add	r0,r0,r1

	// Cutscene style
//	lsl	r0,r0,1Bh
//	lsr	r0,r0,16h
//	lsl	r1,r0,5h
//	add	r0,r0,r1

	// Hybrid (fast flicker)
	lsl	r0,r0,1Dh
	lsr	r0,r0,16h
	lsl	r1,r0,5h
	add	r0,r0,r1
	lsr	r1,r0,2h
	sub	r0,r0,r1
	

	ldr	r3,=8002D19h
	mov	r14,r15
	bx	r3

@@end:
	ldr	r0,=80AF085h
	mov	r14,r15
	bx	r0

	ldr	r0,=8000F59h
	mov	r14,r15
	bx	r0

	ldr	r0,=80D0D7Dh
	bx	r0



guardian:
	mov	r4,0Ch
	ldr	r1,[r0,2Ch]
	mov	r2,10h
	tst	r1,r2
	bne	@@end

	ldrb	r1,[r5,0Fh]
	cmp	r1,0F0h
	beq	@@bassBlock
	cmp	r1,0F1h
	beq	@@bassBlock
	cmp	r1,0F2h
	beq	@@bassBlock
	cmp	r1,0F3h
	beq	@@bassBlock
	b	@@normalBlock

@@bassBlock:
//	mov	r4,0Eh		// Prism reflect graphic
	mov	r4,0Dh		// Block graphic

	push	r0-r7

	// Check cooldown timer
	mov	r1,6Dh
	ldrb	r0,[r5,r1]
	tst	r0,r0
	bne	@@bassBlockEnd

	// Set cooldown timer
	mov	r0,1Eh
	strb	r0,[r5,r1]

	// Summon shockwave
//	ldrb	r1,[r5,12h]
//	sub	r1,1h
//	cmp	r1,0h
//	beq	@@bassBlockEnd
//	ldrb	r2,[r5,13h]
//	mov	r3,0h
//	mov	r4,1h
//	mov	r6,64h
//	mov	r7,0h

//	ldr	r0,=80D6B6Bh
//	mov	r14,r15
//	bx	r0

	// Summon Alpha wave
	ldrb	r1,[r5,12h]
	ldrb	r2,[r5,13h]
	mov	r3,6h
	lsl	r3,r3,10h
	mov	r4,0h
	mov	r6,64h

	ldr	r0,=80ECBF9h
	mov	r14,r15
	bx	r0

@@bassBlockEnd:
	pop	r0-r7

	b	@@block

@@normalBlock:
	mov	r4,0Dh

@@block:
	// Play block sound effect
	push	r0

	mov	r0,13h
	add	r0,0FFh
	ldr	r1,=80005B9h
	mov	r14,r15
	bx	r1

	pop	r0

@@end:
	ldr	r1,=80AF485h
	bx	r1



preAI:
	ldrb	r1,[r5,0Fh]
	cmp	r1,0F0h
	beq	@@bass
	cmp	r1,0F1h
	beq	@@bass
	cmp	r1,0F2h
	beq	@@bass
	cmp	r1,0F3h
	beq	@@bass
	b	@@end

@@bass:
	// Decrement Guardian cooldown
	mov	r1,6Dh
	ldrb	r2,[r5,r1]
	sub	r2,1h
	bmi	@@checkExplosion
	strb	r2,[r5,r1]

@@checkExplosion:
	// Check if Explosion (charged)
	cmp	r0,30h
	beq	@@setBlock

@@removeBlock:
	// Check if flinching
	cmp	r0,20h
	bne	@@end

	// Check if blocking
	ldr	r1,[r5,50h]
	ldrb	r1,[r1,5h]
	mov	r2,4h
	tst	r1,r2
	beq	@@end

	// Set Guardian broken
	mov	r1,6Ch
	ldrb	r2,[r5,r1]
	mov	r3,10h
	orr	r2,r3
	strb	r2,[r5,r1]

	// Remove block status
	push	r0

	ldr	r0,[r5,50h]
	mov	r1,4h
	ldr	r2,=80AF199h
	mov	r14,r15
	bx	r2

	pop	r0
	b	@@end

@@setBlock:
	// Check if Guardian broken
	mov	r1,6Ch
	ldrb	r1,[r5,r1]
	mov	r2,10h
	tst	r1,r2
	bne	@@end

	push	r0

	ldr	r0,[r5,50h]
	mov	r1,4h
	ldr	r2,=80AF191h
	mov	r14,r15
	bx	r2

	pop	r0

@@end:
	ldr	r7,[r7,r0]
	mov	r14,r15
	bx	r7

	pop	r15

	.pool



doubleVanishingWorld:
	lsl	r6,r6,10h
	lsr	r6,r6,10h

	ldrb	r0,[r5,5h]
	cmp	r0,0h
	bne	@@triple

	mov	r0,0Fh
	lsl	r0,r0,10h
	add	r6,r6,r0
	ldr	r0,=80EA1B7h
	mov	r14,r15
	bx	r0

	b	@@end

@@triple:
	mov	r0,2h
	bl	random
	mov	r2,2h
	mul	r0,r2
	add	r0,1h

	push	r0-r1,r6-r7
	mov	r2,r0
	mov	r0,0Fh
	lsl	r0,r0,10h
	add	r6,r6,r0
	ldr	r0,=80EA1B7h
	mov	r14,r15
	bx	r0
	pop	r0-r1,r6-r7

	push	r0-r1,r6-r7
	mov	r2,r0
	mov	r0,2h
	eor	r2,r0
	mov	r0,3Ch
	lsl	r0,r0,10h
	add	r6,r6,r0
	ldr	r0,=80EA1B7h
	mov	r14,r15
	bx	r0
	pop	r0-r1,r6-r7

	push	r0-r1,r6-r7
	mov	r2,2h
	mov	r0,69h
	lsl	r0,r0,10h
	add	r6,r6,r0
	ldr	r0,=80EA1B7h
	mov	r14,r15
	bx	r0
	pop	r0-r1,r6-r7

@@end:
	mov	r0,4h
	strb	r0,[r5,0Bh]

	ldr	r0,=80D1651h
	bx	r0

	.pool



ignoreReward:
	cmp	r0,0h
	beq	@@end

	push	r0

	ldr	r3,=8011281h
	mov	r14,r15
	bx	r3

	pop	r0

@@end:
	ldr	r1,=8015181h
	bx	r1

	.pool



.align 1
moveCounts:
	db	0x02,0x03,0x04,0x04,0x04,0x04,0x05,0x05

.align 1
randomActions:
	db	0x00
	db	0xF0
//	db	0x01
//	db	0x0F
//	db	0x0A
//	db	0x10,0x12,0x20,0x30,0x40,0x50,0x70,0x90,0x92,0x93

// 0X	Move X spaces
// 0F	Move randomly
// 1X	Do X-1 AirBurst in a row
// 20	Do Explosion
// 30	Do Explosion (Charged)
// 40	Do Gospel Cannon
// 50	Do Earth Breaker (50% front, 50% back)
// 51	Do Earth Breaker (front)
// 52	Do Reverse Breaker
// 6X	Do X-1 Gospel Claw in a row
// 70	Do Vanishing World
// 80	Do Purge Breaker
// 90	Do Gospel Burst
// 92	Do Gospel Claw/Cannon
// 93	Do Gospel Storm
// A0	Do DarkAura
// A1	Do GetAbility
// A2	Do GigaFreeze
// A3	Do Sanctuary
// B0	Do First Vanishing World

.align 1
obstacleValues:
	db	0x12	// RockCube
	db	0x20	// Plasma
	db	0x24	// FireRatton
	db	0x29	// TimeBomb/TimeBomb+
	db	0x2D	// Wind/Fan
	db	0x30	// Random/Hole/Shot Meteor
	db	0x32	// Guardian
	db	0x42	// BlackBomb
	db	0x4C	// Anubis/PoisonPharaoh
	db	0x4E	// Prism
	db	0x58	// Fanfare/Discord/Timpani
	db	0x5C	// Needler
	db	0x6C	// Hole
	db	0x73	// Pawn/Knight/Rook
	db	0x83	// Sensor
	db	0x8C	// Totem
	db	0x8D	// Team1/Team2
	db	0xFF

.align 4
combo:
	dw	combo1
	dw	combo2
	dw	combo3
	dw	combo4
	dw	combo5



combo1:
	db	20,combo1a-combo
	db	15,combo1b-combo
	db	30,combo1c-combo
	db	15,combo1d-combo
	db	20,combo1e-combo
combo1a:
	db	0x0F,0x10,0x0F,0x12,0x30,0x00
combo1b:
	db	0x0F,0x60,0x0F,0x40,0x00
combo1c:
	db	0x0F,0x90,0x0F,0x12,0x0F,0x20,0x00
combo1d:
	db	0x0F,0x10,0x0F,0x10,0x0F,0x40,0x00
combo1e:
	db	0x0F,0x60,0x0F,0x12,0x0F,0x20,0x00



combo2:
	db	25,combo2a-combo
	db	10,combo2b-combo
	db	30,combo2c-combo
	db	15,combo2d-combo
	db	20,combo2e-combo
combo2a:
	db	0x0F,0x60,0x0F,0x12,0x30,0x00
combo2b:
	db	0x0F,0x60,0x0F,0x40,0x00
combo2c:
	db	0x0F,0x12,0x0F,0x50,0x0F,0x40,0x00
combo2d:
	db	0x0F,0x10,0x0F,0x10,0x0F,0x12,0x20,0x00
combo2e:
	db	0x0F,0x12,0x0F,0x60,0x40,0x00



combo3:
	db	30,combo3a-combo
	db	15,combo3b-combo
	db	15,combo3c-combo
	db	20,combo3d-combo
	db	20,combo3e-combo
combo3a:
	db	0x0F,0x93,0x00
combo3b:
	db	0x0F,0x10,0x0F,0x10,0x0F,0x12,0x30,0x00
combo3c:
	db	0x0F,0x10,0x0F,0x20,0x0F,0x50,0x00
combo3d:
	db	0x0F,0x12,0x0F,0x12,0x52,0x51,0x00
combo3e:
	db	0x0F,0x50,0x0F,0x12,0x0F,0x20,0x00



combo4:
	db	20,combo4a-combo
	db	15,combo4b-combo
	db	15,combo4c-combo
	db	30,combo4d-combo
	db	20,combo4e-combo
combo4a:
	db	0x10,0x0F,0x12,0x0F,0x20,0x00
combo4b:
	db	0x10,0x0F,0x50,0x12,0x30,0x00
combo4c:
	db	0x12,0x0F,0x10,0x40,0x00
combo4d:
	db	0x01,0x93,0x0F,0x52,0x51,0x00
combo4e:
	db	0x50,0x0F,0x93,0x20,0x00




combo5:
	db	20,combo5a-combo
	db	25,combo5b-combo
	db	20,combo5c-combo
	db	15,combo5d-combo
	db	20,combo5e-combo
combo5a:
	db	0x10,0x0F,0x12,0x01,0x93,0x00
combo5b:
	db	0x01,0x52,0x51,0x0F,0x10,0x70,0x00
combo5c:
	db	0x01,0x50,0x0F,0x10,0x01,0x52,0x51,0x30,0x00
combo5d:
	db	0x10,0x01,0x60,0x01,0x50,0x70,0x00
combo5e:
	db	0x93,0x0F,0x12,0x20,0x00



.align 4
chipNamePtrs:
	dw	0x087043EC
	dw	0x08704E14
	dw	extraChipNames

.align 4
extraChipNames:
	dh	@@script0-extraChipNames
	dh	@@script1-extraChipNames
@@script0:
	db	0x11,0x29,0x38,0x0B,0x26,0x30,0x38,0x3D
	db	0xE7
@@script1:
	db	0x11,0x2D,0x2B,0x10,0x36,0x29,0x29,0x3E
	db	0xE7

.align 4
auraData:
	db	0x0C,0x04,0x00,0x00,0x00,0x00,0x00,0xCE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x04,0x00,0x00,0x00,0x00,0xCE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x04,0x00,0x00,0x01,0x00,0xCE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x04,0x00,0x00,0x02,0x00,0xCE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x04,0x00,0x00,0x03,0x00,0xCE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x08,0x02,0x01,0x00,0x02,0x00,0x00,0x93,0x00,0x00,0xB0,0x03,0xAD,0x00,0x00,0x00
	db	0x0C,0x04,0x00,0xFC,0x01,0x00,0x01,0xCE,0x00,0x00,0xB0,0x03,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x00,0xFC,0x01,0x01,0x01,0xCE,0x00,0x00,0xD0,0x03,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x00,0xFC,0x01,0x02,0x01,0xCE,0x00,0x00,0xE0,0x03,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x02,0x00,0x01,0x00,0x01,0xCE,0x00,0x3F,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x02,0x00,0x03,0x00,0x01,0xCE,0x00,0x3B,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x02,0x00,0x03,0x01,0x01,0xCE,0x00,0x3D,0x00,0x00,0x00,0x00,0x00,0x00
	db	0x0C,0x04,0x02,0x00,0x03,0x02,0x01,0xCE,0x00,0x3E,0x00,0x00,0x00,0x00,0x00,0x00

.align 4
bassBNSA:
	.import bass2.bnsa

.align 4
flameBNSA:
	.import flame-new2.bnsa

.close


































