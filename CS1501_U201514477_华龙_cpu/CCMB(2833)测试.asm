#############################################
# srlv��sltiu��bltz��lhָ����Գ���CCMB�� #
#############################################
 .text
 #����sltiu
 sltiu $s0,$zero,0		#��ʱ$zero��С�ڣ�$s0����1
 sltiu $s0,$zero,1		#��ʱ$zeroС��1��$s0��1
 #����srlv
 addi  $s0,$zero,0xf1		#��$s0����ֵ0xf1
 sll   $s0,$s0,16			#��$s0����16λ
 addi  $s1,$zero,4		#��$s0����ֵ4
 srlv  $s0,$s0,$s1		#��$s0after,$s0=0x00ffee00
 #����lh
 sw    $s0,0			#��$s0��ֵ�浽���ݴ洢����0�ŵ�Ԫ
 lh    $s0,0			#�����ݴ洢��0�ŵ�Ԫ�ĵͰ��ּ��ص�$s0,��ʱ$s0=0x0000ee00
 add   $a0,$0,$s0
 addi  $v0,$0,34		# display hex
 syscall
 lh    $s0,2			#�����ݴ洢��0�ŵ�Ԫ�ĸ߰��ּ��ص�$s0,��ʱ$s0=0x0000ffee
 add   $a0,$0,$s0
 addi  $v0,$0,34		# display hex
 syscall
 #����bltz
 bltz  $s0,exit			#��ʱ$s0��С��0����ת
 addi  $s0,$zero,-1		#��$s0��ֵ-1��ʹ��С��0
 bltz  $s0,exit			#��ʱ$s0��С��0����ת���˳�
 addi  $s0,$zero,0xeee
 add   $a0,$0,$s0
 addi  $v0,$0,34		# display hex
 syscall
 
 exit:				#�����˳����벿��
 addi $v0,$zero,10		# system call for exit
 syscall			# exit 
