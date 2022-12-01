%include 'in_out.asm'
SECTION .data
msg2 DB "Наименьшее число:" ,0h
A DD '45'
B DD '67'
C DD '15'

SECTION .bss
min RESB 10

SECTION .text
GLOBAL _start
_start:

mov ecx,[A]
mov [min],ecx

cmp ecx,[C]
jl check_C
mov ecx,[C]
mov [min],ecx

check_C:
mov eax,min
call atoi
mov [min],eax

mov ecx,[min]
cmp ecx,[B]
jl fin
mov ecx,[B]
mov [min],ecx

fin:
mov eax, msg2
call sprint
mov eax,[min]
call iprintLF
call quit
