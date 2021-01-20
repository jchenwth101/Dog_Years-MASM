TITLE Dog_Years    (DogYears.asm)

; Author: Joel Chenoweth
; Last Modified:01/19/21
; OSU email address: chenowej@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number:          1       Due Date: 01/24/21
; Description: This file calculates dog years from human years.

INCLUDE Irvine32.inc

DOG_Factor = 7

.data

userName BYTE 33 DUP(0)      ;string to be entered by user

userAge DWORD ?           ;integer to be entered by the user

intro_1 BYTE  "Hi, my name is Lassie and I'm here to tell you your age in dog years!" ,0

prompt_1 BYTE "What's your name? ",0

intro_2 BYTE "Nice to meet you, ",0

prompt_2 BYTE "What's your age? ",0

dogAge DWORD ? ,0   ;to be calculated

result_1 BYTE "Wow, that's ",0

result_2 BYTE " in dog years. ",0

goodbye BYTE "so long and farewell, ",0

.code

main PROC

; introduce programmer

mov    EDX, OFFSET intro_1
call   WriteString
call   Crlf

; get user's name
mov EDX, OFFSET prompt_1
call WriteString
; Preconditions of Readstring: (1) Max length saved in EDX holds pointer to string
mov EDX, OFFSET userName
mov ECX, 32
call Readstring

; Get user's age

mov EDX, OFFSET prompt_2
call writeString

; Preconditions of ReadDec: none
call ReadDec

; Postconditions of ReadDec: value is saved in EAX
mov userAge, EAX

; insert a bunch of stuff


; calculate age in dog years
mov EAX, userAge
mov EBX, DOG_FACTOR
mul EBX
mov dogAge, EAX


; report the result

mov EDX, OFFSET result_1
call WriteString
mov EAX, dogAge
call WriteDec
mov EDX, OFFSET result_2
call WriteString
call Crlf


;say goodbye

mov EDX, OFFSET goodbye
call WriteString
mov EDX, OFFSET userName
call WriteString
call Crlf

	Invoke ExitProcess,0	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
