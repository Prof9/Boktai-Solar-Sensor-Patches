.gba
.open "Clean\Boktai 1 (J).gba","Boktai 1 (J)(Hack).gba",0x08000000

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
ldr	r1,=3004508h
str	r3,[r1]

@@end:
pop	r15

.pool

dataarea:
// GBA GPIO pins are pulled up, so no connection reads as 0xF; treat as no sunlight
dcb	0x00,0x04,0x0B,0x14,0x1F,0x2F,0x4D,0x77,0x8C,0x8C,0x8C,0x8C,0x8C,0x8C,0x8C,0x00

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