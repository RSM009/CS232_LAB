.data
    array: .space 400     # maximum array size of 100 integers
    size: .word 0         # integer variable to hold size of the array
    newline: .asciiz "\n" # newline character for formatting output

.text

merge:


main:
    li $v0, 5           # syscall to read integer
    syscall
    sw $v0, size        # store input in size variable

    # loop to read array values from user and store in array
    la $t0, array       # t0 will hold base address of array
    lw $t1, size        # t1 will hold size of array
    li $t2, 0           # t2 will be loop counter
    
    read_values:
        beq $t2, $t1, end_read # if loop counter equals size, exit loop
        li $v0, 5           # syscall to read integer
        syscall
        sw $v0, ($t0)       # store the integer in the current element of the array
        addi $t5, $t0, 4    # move to the next element of the array
        addi $t2, $t2, 1    # increment the loop counter
        j read_values

    end_read:
        la $t0, array       # t0 will hold base address of array
        lw $t1, size        # t1 will hold size of array
        li $t2, 0           # t2 will be loop counter

        la $a1,1            # currSize = a1
        la $a2,0 

    jal mergesort 





        print_values:
            beq $t2, $t1, end_print # if loop counter equals size, exit loop
            lw $a0, ($t0)           # load the integer from the current element of the array into $a0
            li $v0, 1               # syscall to print integer
            syscall
            la $a0, newline         # load newline character for formatting
            li $v0, 4               # syscall to print string
            syscall
            addi $t0, $t0, 4        # move to the next element of the array
            addi $t2, $t2, 1        # increment the loop counter
            j print_values

        end_print:
            # exit program
            li $v0, 10      # syscall to exit program
            syscall

    # data section
    .data
       
mergesort:
   li $a1 , 1                  # a1 == currsize
   li $a3 , size-1
   li $s5
   for_loop:
     bge $a0, $a3, done 
     li $a2 , 0                 # a2 === leftstart
     li $a4 , size-2 
      for_int_loop:
        bge $a2, $a4,done.     
        li $a5 ,1              # mid == a5  
        add $t6, $a1, $a2      # leftStart + currSize
        addi $t6, $t6, -1      # leftStart + currSize - 1
        sub $t1, $s0, 1        # n-1
        slt $t2, $t6, $t1      # t2 = 1 if leftStart + currSize - 1 < n-1, 0 otherwise
        beq $t2, $zero, skip   # if leftStart + currSize - 1 >= n-1, skip to the next instruction

        move $a5, $t6          # if leftStart + currSize - 1 < n-1, set the minimum value to leftStart + currSize - 1
        j end                  # skip the else block

        skip:
        move $a5, $t1          # set the minimum value to n-1
        
        end:
        li $a7 ,1
        sll $t0, $a1, 1        # 2*currSize
        add $t0, $t0, $a2      # leftStart + 2*currSize
        addi $t0, $t0, -1      # leftStart + 2*currSize - 1
        sub $t1, $s0, 1        # n-1
        slt $t2, $t0, $t1      # t2 = 1 if leftStart + 2*currSize - 1 < n-1, 0 otherwise
        beq $t2, $zero, skip   # if leftStart + 2*currSize - 1 >= n-1, skip to the next instruction

        move $t3, $t0          # if leftStart + 2*currSize - 1 < n-1, set the minimum value to leftStart + 2*currSize - 1
        j end                  # skip the else block

        skip:
        move $t3, $t1          # set the minimum value to n-1

        end:
        li s6,array
        jal merge


merge:
    # initialize start1 and start2
    add $t0, $a5, 1      # mid + 1
    add $t1, $a2, $zero  # left
    add $t2, $t0, $zero  # start2
    add $t3, $t1, $zero  # start1

merge_loop:
    # check if start1 <= mid and start2 <= right
    bgt $t3, $a5, merge_exit     # if start1 > mid, exit the loop
    bgt $t2, $a7, merge_exit     # if start2 > right, exit the loop

    # compare arr[start1] and arr[start2]
    sll $t4, $t3, 2     # start1 * 4
    add $t4, $t4, $s6   # memory address of arr[start1]
    lw $t5, ($t4)       # arr[start1]
    sll $t6, $t2, 2     # start2 * 4
    add $t6, $t6, $s6   # memory address of arr[start2]
    lw $t7, ($t6)       # arr[start2]
    ble $t5, $t7, merge_else    # if arr[start1] <= arr[start2], go to else block

    # swap arr[start1] and arr[start2]
    move $t8, $t7       # temp = arr[start2]
    move $t9, $t2       # i = start2
merge_inner_loop:
    bgt $t9, $t3, merge_inner_exit  # if i <= start1, exit the inner loop
    sll $t10, $t9, 2    # i * 4
    add $t10, $t10, $s6 # memory address of arr[i]
    sll $t11, $t9, 2    # (i-1) * 4
    add $t11, $t11, $s6 # memory address of arr[i-1]
    lw $t12, ($t11)     # arr[i-1]
    sw $t12, ($t10)     # arr[i] = arr[i-1]
    sub $t9, $t9, 1     # i = i - 1
    j merge_inner_loop  # go back to the inner loop

merge_inner_exit:
    sll $t13, $t3, 2    # start1 * 4
    add $t13, $t13, $s6  # memory address of arr[start1]
    sw $t8, ($t13)      # arr[start1] = temp
    addi $t3, $t3, 1    # start1++
    addi $a5, $a5, 1    # mid++
    addi $t2, $t2, 1    # start2++

merge_else:
    addi $t3, $t3, 1    # start1++

    # go back to the merge loop
    j merge_loop

merge_exit:
    jr $
        
      
    