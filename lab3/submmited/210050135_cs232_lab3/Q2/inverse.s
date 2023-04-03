.data

newline: .asciiz "\n"

.text
 
main:
li $v0, 5
syscall
move $a2, $v0           # a2 ====   a

li $v0, 5
syscall
move $a3, $v0           # a3  ====  m

move $t0 , $a3        # int m0 = M;
li	$a1, 1			# x = 1;	
li	$a0, 0		#  int y = 0, 
li	$t3, 0		#  int q = 0, 
li	$t4, 0	#  $t1 = 5   ("load immediate")

jal loop

li $v0, 1
move $a0, $a1
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 10
syscall

loop:                     
     move $t3 ,$a2              # q = A ; $t3 == a,$a2 == A 
     div $t3,$a3
     move $t4 , $a3         # q = q / M;       q =A/M 
     mflo $t3            # q = q/m $t3 == q/m
     mfhi $a3           # M  ==  A % M 
     move $a2 , $t4       # A = t
     move $t4 , $a0        # t = y;
     mult $t3,$a0      # y = q*y
     mflo $a0
     subu $a0,$a1,$a0   # y = x - q * y;
     move $a1 , $t4          # x = t;
     bgt $a2, 1, loop
    blt $a1, 0, funct
    jr $ra


funct:
     add $a1 , $a1, $t0
     jr $ra


    li $v0, 4
    move $a0, $a1
    syscall

loopdone:
    jr $ra
    