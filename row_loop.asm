section .data
end db 0x0A
star db'*'
len1 equ $ -star
equl db '='
len2 equ $ -equl
space db 0x09
len3 equ $ -space

section .bss
num1 resb 1
num2 resb 1
res resb 1

section .text
	global _start
_start:
	jmp main

main:
	mov rcx, 9
	mov rax, '1'

L1:
	mov [num1], rax
	push rcx
	mov rcx, 9
	mov rbx, '1'
	L2:
		push rcx
		mov [num2], rbx

		call num2_print
		call star_print
		call num1_print
		call equl_print
		call res_print
		call spaceprint
		mov rbx, [num2]
		inc rbx

		pop rcx

		loop L2
	
		call endprint
		mov rax, [num1]
		inc rax
		pop rcx
loop L1
	mov rax, 1
	int 0x80

num1_print:
	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 1
	int 0x80
	ret
num2_print:
	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 1
	int 0x80
	ret

star_print:
	mov eax, 4
	mov ebx, 1
	mov ecx, star
	mov edx, len1
	int 0x80
	ret

equl_print:
	mov eax, 4
	mov ebx, 1
	mov ecx, equl
	mov edx, len2
	int 0x80
	ret

res_print:
	mov al,[num2]
	sub al, '0'
	mov bl, [num1]
	sub bl, '0'
	mul bl
	mov bl, 10
	div bl
	add al, '0'
	add ah, '0'
	
	cmp al,'0'
	je _mov
	
	mov [res], al
	mov [res+1],ah
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 2
	int 0x80
	ret
	
_mov:
	mov [res], ah
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 2
	int 0x80	
	ret

spaceprint:
	mov eax, 4
	mov ebx, 1
	mov ecx, space
	mov edx, len3
	int 0x80	
	ret

endprint:
	mov eax, 4
	mov ebx, 1
	mov ecx, end
	mov edx, 1
	int 0x80	
	ret
