org &8000
	jp SaveScreen	;&8000
	jp LoadScreen	;&8003
	jp ClearScreen	;&8006


Mode2 equ 1	


SaveScreen:
	;Usage
	;	Call &8000,&C4		- Copy screen to &4000 in bank C4

	cp 1		
	ret nz		
	ld a,(ix+0)	
	cp &C0		
	ret C		

	di			

		call Bankswitch	

		ld hl,&C000
		ld de,&4000
		ld bc,&4000	

		ifndef Mode2
			ldir	
		else
			Call UseLDI 
		endif
	
		ld a,&C0	
		call Bankswitch
	ei			
ret

LoadScreen:


	cp 1		
	ret nz		
	ld a,(ix+0)
	cp &C0		
	ret C		

		call Bankswitch	

		ld de,&C000
		ld hl,&4000
		ld bc,&4000	

		ifndef Mode2
			ldir	
		else
			Call UseLDI 
		endif

		ld a,&C0	
		call Bankswitch
	ei			
ret

Bankswitch: 			
	LD B,&7F		
	OUT (C),A 
	ret




ifdef Mode2
UseLDI:
	ldi	
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ret PO	
jp UseLDI
endif





ClearScreen:
	di				
					

	ld (SP_Restore_Plus2-2),sp	
	ld sp,&0000
	ld de,&0000	
	ld b,0	

ClearScreenAgain:
	push de		
	push de
	push de
	push de
	push de
	push de
	push de
	push de

	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de

	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de

	push de
	push de
	push de
	push de
	push de
	push de
	push de
	push de

djnz ClearScreenAgain	

	ld sp,&0000:SP_Restore_Plus2	
	ei
ret					





