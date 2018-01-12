#############################################
# srlv、sltiu、bltz、lh指令测试程序（CCMB） #
#############################################
 .text
 #测试sltiu
 sltiu $s0,$zero,0		#此时$zero不小于，$s0不置1
 sltiu $s0,$zero,1		#此时$zero小于1，$s0置1
 #测试srlv
 addi  $s0,$zero,0xf1		#给$s0赋初值0xf1
 sll   $s0,$s0,16			#将$s0左移16位
 addi  $s1,$zero,4		#给$s0赋初值4
 srlv  $s0,$s0,$s1		#将$s0after,$s0=0x00ffee00
 #测试lh
 sw    $s0,0			#将$s0的值存到数据存储器的0号单元
 lh    $s0,0			#将数据存储器0号单元的低半字加载到$s0,此时$s0=0x0000ee00
 add   $a0,$0,$s0
 addi  $v0,$0,34		# display hex
 syscall
 lh    $s0,2			#将数据存储器0号单元的高半字加载到$s0,此时$s0=0x0000ffee
 add   $a0,$0,$s0
 addi  $v0,$0,34		# display hex
 syscall
 #测试bltz
 bltz  $s0,exit			#此时$s0不小于0，跳转
 addi  $s0,$zero,-1		#给$s0赋值-1，使其小于0
 bltz  $s0,exit			#此时$s0不小于0，跳转到退出
 addi  $s0,$zero,0xeee
 add   $a0,$0,$s0
 addi  $v0,$0,34		# display hex
 syscall
 
 exit:				#程序退出代码部分
 addi $v0,$zero,10		# system call for exit
 syscall			# exit 
