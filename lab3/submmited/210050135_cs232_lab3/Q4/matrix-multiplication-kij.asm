        section .text
        global matrix_mult

matrix_mult:
        push rdi                       ; pointer to mat1
        push rsi                       ; row count of mat1
        push rdx                       ; column count of mat1
        push rcx                       ; pointer to mat2
        push r8                        ; row count of mat2
        push r9                        ; column count of mat2
        push r10                       ; pointer to mat3
        push r11
        push r12
        push r13

; ; 0-indexing on all matrices
; ; mat1[i][j] = rdi+(rdx*i+j)*8
; ; assume rdx = r8
; ; GOAL - Perform matrix multiplication of mat1, mat2 and save result in mat3

; ; TODO - Fill your code here performing the matrix multiplication in the following order
; ; for k in range(c1) 
        ; { for i in range(r1)
        ;          { for j in range(c2)
        ;                 {
        ;                         mat3[i][j] += mat1[i][k]*mat2[k][j] 
        ;                 }
        ;         } 
        ; }
mov r12, 0                ; ; initialize i = 0 r12 =i                                    
    outer_loop:
        cmp r12, r8            ; ; compare i with r1
        jnl end_outer_loop             ; ; if i >= r1, end outer loop
        mov rax, 0  ;                    ; ; initialize k = 0
        middle_loop:                       
            cmp rax, rsi                      ; ; compare k with c2
            jnl end_middle_loop            ; ; if k >= c2, end middle loop
             mov r11, 0                     ; ; initialize j = 0
            inner_loop:
       
                cmp r11, r9            ; ; compare j with c2
                jnl end_inner_loop             ; ; if j >= c2, end inner loop
          
                mov  r13,  r8           ; ; mat1 
;          ; ; mat1[i][k] = rdi+( r8*i+k)*8
           ;  mat3[i][j] += mat1[i][k]*mat2[k][j]
                imul  r13,rax
                add  r13,r12
                imul  r13, 8
                add  r13 , rdi
                mov  r13 , [r13]
        
                mov  r14, r9       ; ; mat 2
;          ; ; mat2[k][j] = rdi+(r9*k+j)*8
           ;  mat3[i][j] += mat1[i][k]*mat2[k][j] 
                
                imul  r14,r12
                add  r14,r11
                imul  r14, 8
                add  r14 , rcx
                mov  r14 , [r14]
                imul  r13 ,  r14         ; ; mat1 * mat2
   
                cp1:
                mov  r15, r9            ;; mat3 (addr = mat3)
            ;    mov  r14, rcx           ; ; mat 2
            ;  ; ; mat3[i][j] = rdi+( r15*i+j)*8
                cp2:
                imul  r15,rax
                add  r15,r11
                imul  r15, 8
                add  r15 ,r10
                ; mov r15, [r15]
                cp3:
                 add  r13, [r15]       ;  r15 == mat1 * mat2
                cp4:
                mov [r15], r13

                cp5:
               inc r11
               jmp inner_loop
            end_inner_loop:
            inc rax
            jmp middle_loop
        end_middle_loop:   
        inc r12    
        jmp outer_loop
    end_outer_loop:













; ; End of code to be filled

        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        ret
