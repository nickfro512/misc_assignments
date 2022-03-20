# Programmer: Nick Frogley
# Project #2
# Course: CSC320, Fall 2015
# Date: 10/13/2015
# Description: This program uses the Euclidean Algorithm to calculate GCD


.text
    
    .globl    main
main:
    # Print string msg1
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg1    # load the address of msg
    syscall

input_A:    
    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg2    # load the address of msg
    syscall

    li    $v0, 5        # get integer input A
    syscall 
    
    bgt     $v0, 0, input_A_ok    # check input greater than 0
    
    li    $v0, 4        # input 0 or less, so print error and jump back
    la    $a0, msg4
    syscall
    j     input_A

input_A_ok:
    move     $t0, $v0        # store input int A in t0

input_B:
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg3    # load the address of msg
    syscall
    
    li    $v0, 5        # get integer input B
    syscall 

    bgt     $v0, 0, input_B_ok    # check input greater than 0
    
    li    $v0, 4        # input 0 or less, so print error and jump back
    la    $a0, msg4
    syscall
    j     input_B

input_B_ok:
    move     $t1, $v0        # store input int B in t1

    bgt    $t0, $t1, calculate_GCD        # if t0 > t1 order is correct, goto calculate_GCD

    move    $t2, $t0    # swap t0 and t1
    move    $t0, $t1
    move    $t1, $t2

calculate_GCD:
    
    move    $a0, $t0
    move    $a1, $t1    
    #li    $a1, 0
        
    li    $s0, 97
    li    $s1, 98
    
    addi    $sp, $sp, -12    # reserve stack for 3 variables
    sw    $ra, 8($sp)    # push variables to stack
    sw    $s0, 4($sp)    
    sw    $s1, 0($sp)
    
    jal    GCD_loop
    
    
    lw    $s1, 0($sp)    # pop variables back off stack
    lw    $s0, 4($sp)    
    lw    $ra, 8($sp)
    addi    $sp, $sp, 12    # clear stack of 3 variables
    
    
    
    move    $t0, $v0

    
    
print_stuff:    
    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg5    # load the address of msg
    syscall
    
    li     $v0, 1        # A
    move     $a0, $t0
    syscall
    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg6    # load the address of msg
    syscall
    
    li     $v0, 1        # A
    move     $a0, $s0
    syscall
    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg7    # load the address of msg
    syscall
    
    li     $v0, 1        # print B
    move     $a0, $s1
    syscall
    
    
    
end:
    li    $v0, 10        # exit
    syscall

GCD_loop:

    move     $t0, $a0
    move     $t1, $a1
    
    beq    $t1, $zero, finish
    
    div     $t0, $t1
    move    $a0, $t1
    mfhi    $a1
    
    
    
    #addi    $sp, $sp, -12    # reserve stack for 3 variables
    #sw    $ra, 8($sp)    # push variables to stack
    #sw    $s0, 4($sp)    
    #sw    $s1, 0($sp)
    
    addi    $sp, $sp, -4    # reserve stack for 3 variables
    sw    $ra, 0($sp)    # push return address to stack
    
    
    jal    GCD_loop
    
    #lw    $s1, 0($sp)    # pop variables back off stack
    #lw    $s0, 4($sp)    
    #lw    $ra, 8($sp)
    #addi    $sp, $sp, 12    # clear stack of 3 variables
    
    lw    $ra, 0($sp)    # pop reutrn address off stack
    addi    $sp, $sp, 4    # clear stack of 3 variables
    
finish:
    move     $v0, $t0
    jr    $ra


    

    .data
    
msg1:     .asciiz        "\nThe Euclidean Algorithm to calculate GCD."
msg2:     .asciiz     "\nEnter a positive integer A: "
msg3:     .asciiz        "\nEnter a positive integer B: "
msg4:     .asciiz        "\nError, please enter a positive (>0) integer."
msg5:     .asciiz        "\nThe GCD is: "
msg6:     .asciiz        "\nA: "
msg7:     .asciiz        "\nB: "
msg8:     .asciiz        "\nGERE"



newline:     .asciiz        "\n"

