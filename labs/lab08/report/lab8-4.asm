%include 'in_out.asm'
SECTION .data
msg1 DB 'Введите а' ,0h
msg2 DB 'Введите х', 0h
msg3 DB "Результат :" ,0h

SECTION .bss
c RESB 10
x RESB 10
a RESB 10
buf1 RESB 80
buf2 RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg1
call sprintLF

mov ecx,a
mov edx,10
call sread

mov eax,a
call atoi
mov [a],eax

mov eax, msg2
call sprintLF

mov ecx,x
mov edx,10
call sread

mov eax,x
call atoi
mov [x],eax

mov ecx,[x]
mov [c],ecx

mov ecx,[c]
cmp ecx,[a]
jne uneq
mov eax,[a]
mov ebx,6
mul ebx
mov [buf1],eax
mov ecx,[buf1]
jmp fin

uneq:
mov eax,[a]
mov ebx,[x]
add eax,ebx
mov [buf2],eax
mov ecx,[buf2]
jmp fin

fin:
mov eax, msg3
call sprint
mov eax,ecx
call iprintLF
call quit
