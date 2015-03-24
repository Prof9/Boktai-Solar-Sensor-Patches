.gba
.open "Clean\Boktai 1 (J).gba","Boktai 1 (J)(Hack).gba",0x08000000

.org 0x080000D4 // sunlight changer
.area 0xCC

ldr	r0,=3004508h
ldr	r0,[r0]		// r0 = sunlight
bl	8012308h	// r0 = amount of bars

ldr	r1,=3004450h
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
ldr	r1,=3004508h
str	r3,[r1]

@@end:
pop	r15

.pool

dataarea:
dcb	0x00,0x04,0x0B,0x14,0x1F,0x2F,0x4D,0x77,0x8C

.endarea

.org 0x081BED2C	// hook
bl	80000D4h

.org 0x0801230C // treat negative as empty gauge
bgt	8012312h
.org 0x08012354 // treat negative as empty gauge
bgt	801235Ah

.org 0x080123C6 // skip sunlight value adjustment
b	80123E6h

.org 0x080121E0	// set default sensor calibration value
mov	r0,0E6h
nop

.org 0x081C3AC0	// stop sensor from saving sunlight value
nop

.org 0x081C393C // skip solar sensor reset
nop
.org 0x081C3B90 // skip solar sensor reset
nop
.org 0x081C3B5C // skip solar sensor reset
nop

.org 0x08044CA4	// kill "Solar Sensor is broken" screen
b	8044D1Eh

.close