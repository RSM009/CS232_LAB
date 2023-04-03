
.text
li s0,0
li s1,1
li s2,2
li s3,3
main:
add t0, s0, s1    # 1 cycle
add t1, s3, s2    # 2 cycles
add t2, t0, s1    
