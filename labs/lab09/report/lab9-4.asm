%include 'in_out.asm'
SECTION .data
msg DB "Результат: " ,0
msg1 DB 'Функция: f(x)=3(x+2)',0
SECTION .text
GLOBAL _start

_start:
mov eax, msg1
call sprint

pop ecx
pop edx
sub ecx,1
mov esi, 0

next:
cmp ecx,0h
jz _end

pop eax
call atoi
mov ebx,2
add eax,ebx
mov ebx,3
mul ebx
add esi,eax

loop next

_end:
mov eax,msg
call sprint
mov eax,esi
call iprintLF
call quit