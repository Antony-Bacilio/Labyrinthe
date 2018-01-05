; Template for DOS .com file

.model tiny

        code    segment

        org     100h

start:

; ...Put your code here...

; exit to DOS
        mov     ax, 4c00h
        int     21h

        code    ends

end start
