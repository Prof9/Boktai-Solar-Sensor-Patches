.gba
.open "Clean\Boktai 2 (U).gba","Boktai 2 (U)(Hack).gba",0x08000000

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
ldrb	r0,[r3,r0]
ldr	r1,=30057C8h
str	r0,[r1]

bl	82420C8h	// get modified sun level
bl	8242050h	// get modified sun bars

@@updategauge:
ldr	r2,=2037492h
ldr	r1,=0D05Ch
ldrh	r3,[r2]
cmp	r3,r1
bne	@@end
add	r1,1h
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
// GBA GPIO pins are pulled up, so no connection reads as 0xF; treat as no sunlight
dcb 0x00,0x03,0x09,0x12,0x1D,0x2A,0x3D,0x4D,0x62,0x7D,0x8C,0x8C,0x8C,0x8C,0x8C,0x00

.endarea

.org 0x0822EFD6	// hook
bl	80000D4h

.org 0x08242054 // treat negative as empty gauge
bgt	824205Ah

.org 0x082421A2 // skip sunlight value adjustment
pop	r15

.org 0x08241FBC	// set default sensor calibration value
mov	r0,0E6h
nop

.org 0x08247FD8	// stop sensor from saving sunlight value
nop

.org 0x08247E4E // skip solar sensor reset
nop
.org 0x08248074 // skip solar sensor reset
nop
.org 0x082480A8 // skip solar sensor reset
nop

.close