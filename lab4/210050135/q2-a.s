# Read after write hazard (RAW)
.text

main:
   li s0 , 1
   li s1 , 2  
   add t0, s0, s1
   nop
   nop
   add a0, t0 , x0