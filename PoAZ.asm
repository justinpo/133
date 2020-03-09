.MODEL SMALL
.DATA
    A DB 65

.CODE
    MOV AX, @DATA  
    MOV DS, AX
    MOV DL, A

PRINT:         
    MOV AH, 02H
    INT 21H
    
    ADD DL, 1
    
    CMP DL, 91
    JE RESET
    
    MOV AH, 01H
    INT 16H
    
    CMP AL, 13
    JE END
    
    LOOP PRINT
    
RESET:
    MOV DL, 65
    JMP PRINT
    
END:
    MOV AH, 4CH
    INT 21H   

END