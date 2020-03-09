.MODEL SMALL
.DATA

MSG1 DB "First Number: ",'$'
MSG2 DB 10,13,"Second Number: ",'$'
NL DB 10,13,"Sum: ",'$' 
NUM1 DB 48
NUM2 DB 48

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
    ADD NUM1, AL 
    
    LEA DX,NL
    MOV AH, 09H
    INT 21H
    
    MOV DL, NUM1     
    MOV AH, 02H
    INT 21H  
    
    MOV AH, 4CH
    INT 21H
END