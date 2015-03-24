.gba
.open "Clean\Boktai 3 (J).gba","Boktai 3 (J)(Hack).gba",0x08000000

.org 0x080000D4 // sunlight changer
.area 0xCC

ldr	r0,=3006A48h
ldr	r0,[r0]		// r0 = sunlight
bl	822C238h	// r0 = amount of bars

ldr	r1,=3005260h
ldrh	r2,[r1]		// r2 = BUTTON_HELD
ldrh	r1,[r1,2h]	// r1 = BUTTON_DOWN
mov	r3,4h
tst	r2,r3		// if Select held
beq	@@sunwrite

@@righttest:
mov	r3,10h
tst	r1,r3
beq	@@lefttest
cmp	r0,0Ah
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
ldrb	r0,[r3,r0]
ldr	r1,=3006A48h
str	r0,[r1]

bl	822C2B0h	// get modified sun level
bl	822C238h	// get modified sun bars

@@updategauge:
ldr	r2,=2037492h
ldr	r1,=0D45Fh
ldrh	r3,[r2]
cmp	r3,r1
bne	@@end
ldr	r1,=0D05Dh
mov	r3,0Ah
sub	r3,r3,r0

@@sunloop:
add	r2,2h
cmp	r0,0h
ble	@@darkgauge
strh	r1,[r2]
sub	r0,1h
b	@@sunloop

@@darkgauge:
add	r1,1h

@@darkloop:
cmp	r3,0h
ble	@@end
strh	r1,[r2]
add	r2,2h
sub	r3,1h
b	@@darkloop

@@end:
pop	r15

.pool

dataarea:
dcb 0x00,0x03,0x09,0x12,0x1D,0x2A,0x3D,0x4D,0x62,0x7D,0x8C

.endarea

.org 0x08218B6E // hook
bl	80000D4h

.org 0x0822C23C // treat negative as empty gauge
bgt	822C242h

.org 0x0822C38E // skip sunlight value adjustment
pop	r15

.org 0x08247758 // set default sensor calibration value
mov	r0,0E6h
nop

.org 0x08243DD4 // stop sensor from saving sunlight value
nop

.org 0x08243C4A // skip solar sensor reset
nop
.org 0x08243E70 // skip solar sensor reset
nop
.org 0x08243EA4 // skip solar sensor reset
nop

.close