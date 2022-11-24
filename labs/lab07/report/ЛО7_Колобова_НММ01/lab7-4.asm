%include 'in_out.asm'

SECTION .data
msg: DB 'Введите значение х',0
div: DB 'Результат: ',0 

SECTION .bss
x:  RESB 80
buf1: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprintLF

mov ecx,x
mov edx,80
call sread

mov eax,x
call atoi

mov ebx,1
neg ebx
add eax,ebx
mul eax

mov ecx,5
mul ecx

mov edi,eax

mov eax,div
call sprint
mov eax,edi
call iprintLF

call quit