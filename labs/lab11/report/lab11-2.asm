
%include 'in_out.asm'
SECTION .data
filename DB 'name.txt', 0h
msg DB 'Как Вас зовут?', 0h
exmes DB 'Меня зовут ', 0h

SECTION .bss
contents RESB 300

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprint

mov ecx, contents
mov edx, 300
call sread

mov ecx, 0777o
mov ebx, filename
mov eax, 8
int 80h

mov ecx, 2
mov ebx, filename
mov eax, 5
int 80h

mov esi, eax
mov eax, exmes
call slen
 
mov edx, eax
mov ecx, exmes
mov ebx, esi
mov eax, 4
int 80h

mov eax, contents
call slen

mov ecx, 1
mov ebx, filename
mov eax, 5
int 80h

mov edx, 2
mov ecx, 1
mov ebx, eax
mov eax, 19
int 80h

mov edx, 9
mov ecx, contents
mov eax, 4
int 80h

mov ebx, esi
mov eax, 6
int 80h

call quit
