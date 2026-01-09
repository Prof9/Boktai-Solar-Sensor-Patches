.gba
.open "Clean\Boktai 1 (U)(Beta).gba","Boktai 1 (U)(Beta)(Hack).gba",0x08000000

.org 0x080000D4 // sunlight changer
.area 0xCC

// set link port to GPIO mode if not yet set
ldr	r0,=4000134h
ldrh	r1,[r0]
mov	r2,r1
ldr	r3,=0FFF0h	// all bits except data
and	r2,r3
ldr	r3,=8000h	// GPIO mode, all inputs
cmp	r2,r3
beq	@@readio
strh	r3,[r0]
b	@@end		// skip GPIO read this cycle

@@readio:
lsl	r1,r1,1Ch
lsr	r0,r1,1Ch	// keep data bits only

@@sunwrite:
add	r3,=dataarea
ldrb	r3,[r3,r0]
ldr	r1,=30046D4h
str	r3,[r1]

@@end:
pop	r15

.pool

dataarea:
// GBA GPIO pins are pulled up, so no connection reads as 0xF; treat as no sunlight
dcb	0x00,0x04,0x0B,0x14,0x1F,0x2F,0x4D,0x77,0x8C,0x8C,0x8C,0x8C,0x8C,0x8C,0x8C,0x00

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