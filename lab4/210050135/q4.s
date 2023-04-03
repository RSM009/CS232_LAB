.data
.text
.globl main
main:

    li t0, 1
    li t1, 2
    li t2, 3
    li t3, 4

    add t0, t0, t1                # t0 = 1 + 2
    li t1, 5                      # 

    add t2 , t2, t3               # t2 = 3 + 4
    li t3, 6

    add t0, t0, t1                # t0 = 1+ 2 + 5 
    li t1, 7
    
    add t2 , t2, t3               #  t2 = 3 + 4 + 6 
    li t3, 8                   

    add t0, t0, t1                # t0 = 1+ 2 + 5 + 7               
    li t1, 9

    add t2 , t2, t3              # t2 = 3 + 4 + 6 + 8 
    li t3, 10   

    add t0, t0, t1                # t0 = 1+ 2 + 5 + 7 + 9              
    li  t1 , 0
    
    add t2 , t2, t3              # t2 = 3 + 4 + 6 + 8 + 10
    li t3 , 0
    li t1 ,0

    add t0 ,t0 ,t2



    