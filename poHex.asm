.MODEL SMALL
.DATA
MSG1 DB "ENTER A HEX DIGIT: ", '$'
MSG2 DB "IN DECIMAL, IT IS: ", '$'
MSG3 DB "DO YOU WANT TO DO IT AGAIN (Y/N): ", '$'
MSG4 DB "ILLEGAL CHARACTER - ONLY (0-9) OR (A-F): ", '$'
NL DB 10, 13, '$'
NUM1 DB 0
NUM2 DB 0
ONE DB "1$"

.CODE
   MOV AX, @DATA
   MOV DS, AX
   
DISPLAY_1:
   LEA DX, NL
   MOV AH, 09H
   INT 21H
   LEA DX, MSG1
   MOV AH, 09H
   INT 21H
   JMP READ_1
   
READ_1:
   MOV AH, 01H
   INT 21H
   JMP CHECK_NUMBER        

DISPLAY_3:
   LEA DX, NL
   MOV AH, 09H
   INT 21H
   
   LEA DX, MSG3
   MOV AH, 09H
   INT 21H
   
   JMP READ_2

READ_2:
   MOV AH, 01H
   INT 21H
   
   CMP AL, 'N'
   JE EXIT
      
   CMP AL, 'Y'
   JE DISPLAY_1
   
   JMP DISPLAY_3
   
CHECK_NUMBER:
   CMP AL, '0'
   JL ERROR 
   CMP AL, '9'
   JG CHECK_LETTER
   
   MOV NUM1, AL
   
   ;NEW LINE
   LEA DX, NL
   MOV AH, 09H
   INT 21H
   
   JMP DISPLAY_NUM
   
CHECK_LETTER:
   CMP AL, 'A'
   JL ERROR
   CMP AL, 'F'
   JG ERROR
   
   MOV NUM2, AL
   
   ;NEW LINE
   LEA DX, NL
   MOV AH, 09H
   INT 21H
   
   JMP DISPLAY_HEX
   
DISPLAY_NUM:
   LEA DX, MSG2
   MOV AH, 09H
   INT 21H   
              
   MOV DL, NUM1
   MOV AH, 02H
   INT 21H       
   
   JMP DISPLAY_3
   
DISPLAY_HEX:
   LEA DX, MSG2
   MOV AH, 09H
   INT 21H
   
   SUB NUM2, 17
   
   LEA DX, ONE
   MOV AH, 09H
   INT 21H
   
   MOV DL, NUM2 
   MOV AH, 02H
   INT 21H
   
   JMP DISPLAY_3   
   
ERROR:
   LEA DX, NL
   MOV AH, 09H
   INT 21H
    
   LEA DX, MSG4
   MOV AH, 09H
   INT 21H
   
   JMP READ_1   
     
     
EXIT:   
   MOV AH, 4CH
   INT 21H
           
END