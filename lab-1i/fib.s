	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}


	sub		r3, r0, #0	@R3 =>  n
	cmp 	r0, #0
	ble  	.L3

	cmp		r0, #1
	ble 	.L4



	mov 	r4, #2   @use R4 as i
	mov		r5, #1	@previous
	mov  	r3, #0  @result
	mov		r6, #0 @previous#2

	.loop:
	add 	r4, r4, #1
	add 	r3, r5, r6
	mov 	r6, r5
	mov		r5, r3
	cmp 	r4,	r0
	ble .loop
	mov 	r0, r3



	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, r6, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, r6,pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
