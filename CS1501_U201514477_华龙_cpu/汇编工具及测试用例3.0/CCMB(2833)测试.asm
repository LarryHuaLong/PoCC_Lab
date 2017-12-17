#################################################################################
# srlv、sltiu、bltz、lh指令测试程序
#################################################################################
 .text
 
 sltiu $s0,$zero,0 
 sltiu $s0,$zero,1 
 
 addi $s0,$zero,0xf1
 sll $s0,$s0,16
 addi $s1,$zero,4
 srlv $s0,$s0,$s1     #after,$s0=0x00ffee00
 
 sw $s0,0
 lh $s0,0		#after,$s0=0x0000ee00
 add    $a0,$0,$s0      
 addi   $v0,$0,34         # display hex
 syscall
 lh $s0,2		#after,$s0=0x0000ffee
 add    $a0,$0,$s0      
 addi   $v0,$0,34         # display hex
 syscall
  
 bltz $s0,exit
 addi $s0,$zero,-1
 bltz $s0,exit
 #不执行下面语句
 addi $s0,$zero,0xeee	
 add    $a0,$0,$s0      
 addi   $v0,$0,34       # display hex
 syscall
 
 exit:
 addi   $v0,$zero,10         # system call for exit
 syscall                  # we are out of here. 
 
 
