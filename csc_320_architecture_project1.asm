# Programmer: Nick Frogley
# Project #1
# Course: CSC320, Fall 2015
# Date: 10/1/2015
# Description: This program converts cents into quarters, dimes,
# nickels, and pennies.


.text
    
    .globl    main
main:
    # Print string msg1
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg1    # load the address of msg
    syscall
    
    li    $v0, 5        # get integer input
    syscall 

    bgt     $v0, 0, input_ok    # check input greater than 0
    
    li    $v0, 4        # input 0 or less, so print error and jump back
    la    $a0, msg6
    syscall
    j     main

input_ok:
    move     $t1, $v0        # store input int in t1
    li     $t2, 0        # set counter ($t2) to 0

quarter_loop:
    subi     $t1, $t1, 25        # take away 25
    blt     $t1, 0, print_quarters    # if result under 0 exit loop
    addi     $t2, $t2, 1        # add one to coin count
    j     quarter_loop            # loop
    
    
print_quarters:    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg2    # load the address of msg
    syscall
    
    li     $v0, 1        # print number of quarters
    move     $a0, $t2
    syscall
    
    addi    $t1, $t1, 25    # this sets $t1 to the remainder
        
    li     $t2, 0        # reset counter

dime_loop:
    subi     $t1, $t1, 10        # take away 10
    blt     $t1, 0, print_dimes    # if result under 0 exit loop
    addi     $t2, $t2, 1        # add one to coin count
    j     dime_loop        # loop
    
    
print_dimes:    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg3    # load the address of msg
    syscall
    
    li     $v0, 1        # print number of dimes
    move     $a0, $t2
    syscall
    
    addi    $t1, $t1, 10    # this sets $t1 to the remainder
    
    li     $t2, 0        # reset counter

nickel_loop:
    subi     $t1, $t1, 5        # take away 5
    blt     $t1, 0, print_nickels    # if result under 0 exit loop
    addi     $t2, $t2, 1        # add one to coin count
    j     nickel_loop        # loop
    
    
print_nickels:    
    li    $v0, 4        # print_string syscall code = 4
    la    $a0, msg4    # load the address of msg
    syscall
    
    li     $v0, 1        # print number of nickels
    move     $a0, $t2
    syscall
    
    addi    $t1, $t1, 5    # this sets $t1 to the remainder
    
    li    $v0, 4        
    la    $a0, msg5
    syscall
    
    li     $v0, 1        # print pennies
    move     $a0, $t1
    syscall
    
    
end:
    li    $v0, 10        # exit
    syscall
    
    .data
    
msg1:     .asciiz    "\nEnter some number of cents: "
msg2:     .asciiz     "\nQuarters: "
msg3:     .asciiz    "\nDimes: "
msg4:     .asciiz    "\nNickels: "
msg5:     .asciiz    "\nPennies: "
msg6:     .asciiz    "\nError! You must enter a positive number. Please try again."

