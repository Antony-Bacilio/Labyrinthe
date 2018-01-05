
        CSEG SEGMENT
        ASSUME         CS:CSEG, DS:CSEG, ES:CSEG
        ORG 100H

;*****************************
;Zone de macro debut
;******************************        
mode_video MACRO

        MOV AH, 00H
        MOV AL, 0DH
        INT 10H
        
endm
curseur_xy MACRO ligne, colonne; positionner curseur

        MOV AH,02H
        MOV DH,ligne
        MOV DL,colonne
        MOV BH,0
        INT 10H
        
endm

couleur MACRO

        MOV AH,0BH
    MOV BH,0
    MOV BL,04
    INT 10H

endm


CRLF MACRO ;//c'est pour sauter de ligne, CRLF est un mot quelconque
mov AH,2
MOV DL, 0DH
INT 21H
MOV DL,0AH
INT 21H
endm

lire_slash MACRO
        MOV AH,8H
        MOV BH, 0
        MOV AL,47
        INT 10H        
endm

dessin_carre MACRO ligi, ligf, coli, colf
        
        MOV cl, coli;
        
        etiq_lignes: 
                curseur_xy ligi, cl;
                MOV AH, 02H
                MOV DL, 178 
                INT 21H
                curseur_xy ligf, cl;
                MOV AH, 02H
                MOV DL, 178 
                INT 21H
                INC cl
                CMP cl, colf
                JNE etiq_lignes
        
        MOV cl, ligi
                
        etiq_colonnes:
                curseur_xy cl, coli
                MOV AH, 02H
                MOV DL, 178
                INT 21H
                curseur_xy cl, colf
                MOV AH, 02H
                MOV DL, 178
                INT 21H
                INC cl
                CMP cl, ligf
                JNE etiq_colonnes
                
                curseur_xy ligf,colf
                MOV AH, 02H
                MOV DL, 178;symbole des bordes
                INT 21H
        
endm

;*****************************
;Zone de macro fin
;****************************** 



;*****************************
;Zone main debut
;****************************** 

MAIN:
        
        
        jmp emenu
        
        LABYRINTHE: mode_video
                
        dessin_carre li,lf,ci,cf
        couleur
         
        inc li
        inc ci
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        laby:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc colonne
                cmp colonne,38
                jne laby
                
                 mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,6
        add ligne,1
        
        laby2:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc ligne
                cmp ligne,8
                jne laby2
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add ligne,4
        
        laby3:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc ligne
                cmp ligne,23
                jne laby3
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add ligne,9
        
        laby4:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc colonne
                cmp colonne,12
                jne laby4
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add ligne,9
        add colonne,10
        
        laby5:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                dec ligne
                cmp ligne,4
                jne laby5
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add ligne,3
        add colonne,10
        
        laby6:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc colonne
                cmp colonne,21
                jne laby6
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,35
        
        laby7:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h                                
                inc ligne
                cmp ligne,10
                jne laby7
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,35
        add ligne,9
        
        laby8:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc ligne
                cmp ligne,23
                jne laby8
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add ligne,20
        
        laby9:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc colonne
                cmp colonne,38
                jne laby9
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,35
        add ligne,7
        
        laby10:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                dec colonne
                cmp colonne,17
                jne laby10
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,35
        add ligne,9
        
        laby11:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                dec colonne
                cmp colonne,29
                jne laby11
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,28
        add ligne,9
        
        laby12:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc ligne
                cmp ligne,19
                jne laby12
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,28
        add ligne,17
        
        laby13:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                dec colonne
                cmp colonne,16
                jne laby13
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,24
        add ligne,7
        
        laby14:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                dec ligne
                cmp ligne,4
                jne laby14
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,16
        add ligne,8
        
        laby15:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc ligne
                cmp ligne,14
                jne laby15
                
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,16
        add ligne,12
        
        laby16:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                dec colonne
                cmp colonne,9
                jne laby16
                
               mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        add colonne,7
        add ligne,12
        
        laby17:
                
                curseur_xy ligne,colonne
                                 mov ah,0Ah
                                mov al,'/'
                                mov bh,0
                                mov bl,95
                                mov cx,1
                                int 10h
                inc ligne
                cmp ligne, 19
                jne laby17
        
        add li,1
        
        mov al,li
        mov ligne,al
        mov al,ci
        mov colonne,al
        
        curseur_xy li,ci
        
        mov ah,02h
        mov dl,'*'
        int 21h
 
        repeter:
                mov ah,08h; lecture clavier
                int 21h
 
                cmp al,52;4
                je left
 
                cmp al,54;6
                je right
 
                cmp al,56;8
                je up
 
                cmp al,50;2
                je down
                
        cmp al,57;9
        jne repeter
 
        jmp fin
 
        left:
                cmp colonne,2 ;coli ++
                je fin_perdre
                
                
                        curseur_xy ligne, colonne
        mov ah,02h
        mov dl,' '
        int 21h
                dec colonne
                curseur_xy ligne, colonne
                
                lire_slash
                cmp al,47
                je fin_perdre
                
        mov ah,02h
        mov dl,'*'
        int 21h
        jmp repeter
 
                 
 
        right:
   
                cmp colonne,37 ;coli ++
                je fin_perdre
                
                     cmp colonne,36 ;colf --
                je etiq1
                jne ee
                
                etiq1: cmp ligne,10
                je fin_gagne
                jne ee
                               
                        
                        ee:
                        curseur_xy ligne, colonne
        mov ah,02h
        mov dl,' '
        int 21h
                inc colonne
                curseur_xy ligne, colonne
                lire_slash
                cmp al,47
                je fin_perdre
                
                
        mov ah,02h
        mov dl,'*'
        int 21h
        
        jmp repeter 
 
        up:
                cmp ligne,3 ;lig++
                je fin_perdre
                curseur_xy ligne, colonne
        mov ah,02h
        mov dl,' '
        int 21h
         
                dec ligne
                curseur_xy ligne, colonne
                lire_slash
                cmp al,47
                je fin_perdre
        mov ah,02h
        mov dl,'*'
        int 21h
        jmp repeter
 
        down:
                cmp ligne,21 ;ligf--
                je fin_perdre         

                curseur_xy ligne, colonne
        mov ah,02h
        mov dl,' '
        int 21h

                inc ligne
                curseur_xy ligne, colonne
                lire_slash
                cmp al,47
                je fin_perdre
        mov ah,02h
        mov dl,'*'
        int 21h
        jmp repeter
            
            fin:            
            
                    mode_video
                
                CRLF
                
                LEA DX,sortie
                MOV AH,09H
                INT 21H
                
                MOV AH,4CH
                INT 21h
            
            
            
                fin_perdre:
            mode_video
                
                CRLF
                
                LEA DX,perdre
                MOV AH,09H
                INT 21H
                
                MOV AH,4CH
                INT 21h

                fin_gagne:
                
                        mode_video
                        
                        CRLF
                
                        LEA DX,gagne
                MOV AH,09H
                INT 21H
                        
                MOV AH,4CH
                INT 21h
                
               emenu:
               
                          mode_video
                           
                           CRLF
                           
                        LEA DX,debut
                MOV AH,09H
                INT 21H                           
                
                CRLF
                
                        LEA DX,entree
                MOV AH,09H
                INT 21H 
                
                CRLF
                
                LEA DX,exit
                MOV AH,09H
                INT 21H
                
                MOV AH,08H
                INT 21H
                
                CMP AL,49
                JE LABYRINTHE
                JNE etiqu
                
                etiqu: CMP AL,50
                JE fin

                
                

;************************************
;zone data debut
;************************************

    ligne db 0
    colonne db 0
    li db 1
    lf db 23
    ci db 1
    cf db 38
    
    perdre db "Vous avez perdu$"
    gagne db "    CHAMPION!!!  $"
    sortie db "   Fin du jeu$"
    
    debut db "           Bienvenue au labyrinthe$    "
    entree db "1.- Jouer$"
    exit db "2.- Exit$" 

;************************************
;zone data fin
;************************************

CSEG ENDS; fin du segment

END MAIN

;*****************************
;Zone main fin
;*****************************
