.gba
.open "Clean\Boktai 1 (U)(Beta).gba","Boktai 1 (U)(Beta)(Hack).gba",0x08000000

.org 0x080000D4 // sunlight changer
.area 0xCC

ldr	r0,=30046D4h
ldr	r0,[r0]		// r0 = sunlight
bl	801212Ch	// r0 = amount of bars

ldr	r1,=3004620h
ldrh	r2,[r1]		// r2 = BUTTON_HELD
ldrh	r1,[r1,2h]	// r1 = BUTTON_DOWN
ldr	r3,=101h
and	r2,r3
cmp	r2,r3		// if R+A held
bne	@@sunwrite

@@righttest:
mov	r3,10h
tst	r1,r3
beq	@@lefttest
cmp	r0,8h
bge	@@sunwrite
add	r0,1h

@@lefttest:
mov	r3,20h
tst	r1,r3
beq	@@sunwrite
cmp	r0,0h
ble	@@sunwrite
sub	r0,1h

@@sunwrite:
add	r3,=dataarea
ldrb	r3,[r3,r0]
ldr	r1,=30046D4h
str	r3,[r1]

@@end:
pop	r15

.pool

dataarea:
dcb	0x00,0x04,0x0B,0x15,0x23,0x35,0x4E,0x6F,0x82

.endarea

.org 0x08192D38	// hook
bl	80000D4h

.org 0x08012130 // treat negative as empty gauge
bgt	8012136h
.org 0x08012178 // treat negative as empty gauge
bgt	801217Eh

.org 0x080121EA // skip sunlight value adjustment
b	801220Ah

.org 0x08012004	// set default sensor calibration value
mov	r0,0E6h
nop

.org 0x08197AA4	// stop sensor from saving sunlight value
nop

.org 0x08197930 // skip solar sensor reset
nop
.org 0x08197B34 // skip solar sensor reset
nop
.org 0x08197B68 // skip solar sensor reset
nop

// there doesn't seem to be a "Solar Sensor is broken" screen in the beta

.close