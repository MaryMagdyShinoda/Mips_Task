.data
  array: .word 3, 2, 4, 5, 7, 8
  size: .word 6
  noOfOdd: .word 0
  noOfEven: .word 0
  newline : .asciiz "\n"
.text
  addi $s0, $zero, 0  
  la $t0, size
  lw $s1, ($t0)
  la $t0, array
  lw $s3, noOfOdd($zero)
  lw $s4, noOfEven($zero)
  
Loop:

  slt $t1, $s0, $s1
  beq $t1, $zero, endLoop

  sll $t1, $s0, 2   # arr[i]
  add $t1, $t0, $t1
  lw $s2, ($t1)
  
  div  $t3, $s2, 2
  mfhi $t3
 
  bne $t3, 0, Oddnum
  addi $s4, $s4, 1
  
  j continue
  
Oddnum:

  addi $s3, $s3, 1
  
continue:
  addi $s0, $s0, 1
  j Loop

endLoop:
li $v0,1
add $a0,$zero ,$s4
syscall
   	
 li $v0, 4 
 la $a0, newline 
 syscall
         
  li $v0,1
add $a0,$zero ,$s3
  syscall
   	
