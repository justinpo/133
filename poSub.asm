.MODEL SMALL
.DATA

MSG1 DB "First Number: ",'$'
MSG2 DB 10,13,"Second Number: ",'$'
MSG3 DB 10,13,"Operation: ",'$'
NL DB 10,13,"Result: ",'$' 
NUM1 DB 48
NUM2 DB 48
ANS DB 48

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
PRINT_1:
    LEA DX,MSG1
    MOV AH, 09H
    INT 21H
        
READ_1:
    MOV AH, 01H
    INT 21H     
    ;NORMALIZE
    SUB AL, 48
    ADD NUM1, AL 
    
PRINT_2:
    LEA DX,MSG2
    MOV AH, 09H
    INT 21H
         
READ_2:
    MOV AH, 01H
    INT 21H
    ;NORMALIZE
    SUB AL, 48
    ADD NUM2, AL  

PRINT_3:
    LEA DX,MSG3
    MOV AH, 09H
    INT 21H
        
READ_3:
    MOV AH, 01H
    INT 21H
         
    CMP AL, '+'
    JE ADDITION
    
    CMP AL, '-'
    JE SUBTRACTION

ADDITION:
    MOV AL, NUM1   
    ADD AL, NUM2
    
    ;NORMALIZE
    SUB AL, 48
    
    MOV ANS, AL

    LEA DX,NL
    MOV AH, 09H
    INT 21H
    
    MOV DL, ANS     
    MOV AH, 02H
    INT 21H  
    
    MOV AH, 4CH
    INT 21H

SUBTRACTION:
    MOV AL, NUM1    
    SUB AL, NUM2
    
    ;NORMALIZE
    ADD AL, 48
    
    MOV ANS, AL
   
    LEA DX,NL
    MOV AH, 09H
    INT 21H
    
    MOV DL, ANS     
    MOV AH, 02H
    INT 21H  
    
    MOV AH, 4CH
    INT 21H  

END