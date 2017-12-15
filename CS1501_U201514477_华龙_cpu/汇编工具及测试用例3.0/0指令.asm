.text
beq $s1, $t0, next1
next1:
addiu $t1,$s1,100
bne $s1, $t0, next2
next2:
slt $s0, $s1, $t0
slti $t0, $s1, 32
sltu $s0, $s1, $t0
j next3
next3:
jal next4
next4:
jr $s1
srlv $s0, $t0, $s1
sltiu $t0,$s1, 32
lh $t0, 4($s1)
bltz $s1,next5
next5:

addi   $v0,$zero,10         # system call for exit
syscall                  # we are out of here. 

