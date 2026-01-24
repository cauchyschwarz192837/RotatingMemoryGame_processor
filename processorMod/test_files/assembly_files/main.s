main:

initCards:

    # initial score (set to 0)
    addi  $s7,  $zero, 0

    # threshold (pairs)
    addi  $s6,  $zero, 7

    # first matched card
    addi  $t7,  $zero, 20

    #------------------------------------------------------------------------------------
    
    # initial number of lives = 10
    addi  $k0,  $zero, 0

    # threshold (lives)
    addi  $s5,  $zero, 10

    #------------------------------------------------------------------------------------

    # card colors stored in [memory 20-35]
    addi  $s0,  $zero, 20

    addi  $t1,  $zero, 1313   # color: BROWN (0x521 = 1313)
    sw    $t1,  0($s0)         # memory[20]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[21]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 3386   # color: PINK (0xD3A = 3386)
    sw    $t1,  0($s0)         # memory[22]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[23]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 1835   # color: PURPLE (0x72B = 1835)
    sw    $t1,  0($s0)         # memory[24]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[25]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 4080   # color: YELLOW (0xFF0 = 4080)
    sw    $t1,  0($s0)         # memory[26]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[27]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 255    # color: CYAN (0x0FF = 255)
    sw    $t1,  0($s0)         # memory[28]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[29]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 3855   # color: MAGENTA (0xF0F = 3855)
    sw    $t1,  0($s0)         # memory[30]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[31]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 3473   # color: ORANGE (0xD91 = 3473)
    sw    $t1,  0($s0)         # memory[32]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[33]
    addi  $s0,  $s0, 1

    addi  $t1,  $zero, 1911   # color: GRAY (0x777 = 1911)
    sw    $t1,  0($s0)         # memory[34]
    addi  $s0,  $s0, 1
    sw    $t1,  0($s0)         # memory[35]

    #------------------------------------------------------------------------------------

    # card x-coordinates stored in [memory 40-55]

    addi  $s0, $zero, 40

    addi  $t2,  $zero, 149
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 4  # 44
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 48
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 52
    sw    $t2,  0($s0)

    addi  $s0, $zero, 41

    addi  $t2,  $zero, 239
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 4  # 45
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 49
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 53
    sw    $t2,  0($s0)

    addi  $s0,  $zero, 42

    addi  $t2,  $zero, 329
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 4  # 46
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 50
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 54
    sw    $t2,  0($s0)

    addi  $s0,  $zero, 43

    addi  $t2,  $zero, 419
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 4  # 47
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 51
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 4  # 55
    sw    $t2,  0($s0)


    # card y-coordinates stored in [memory 60-75]

    addi  $s0,  $zero, 60

    addi  $t2,  $zero, 69
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 1  # 61
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 62
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 63
    sw    $t2,  0($s0)

    addi  $s0,  $s0, 1  # 64

    addi  $t2,  $zero, 159
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 1  # 65
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 66
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 67
    sw    $t2,  0($s0)

    addi  $s0,  $s0, 1  # 68

    addi  $t2,  $zero, 249
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 1  # 69
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 70
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 71
    sw    $t2,  0($s0)

    addi  $s0,  $s0, 1  # 72

    addi  $t2,  $zero, 339
    sw    $t2,  0($s0) 
    addi  $s0,  $s0, 1  # 73
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 74
    sw    $t2,  0($s0)
    addi  $s0,  $s0, 1  # 75
    sw    $t2,  0($s0)

#-----------------------------------
gameLoop:
    # block_x is in $28 = $gp
    # block_y is in $29 = $sp
#-----------------------------------

card_1_check:

    lw    $a3,  110($zero) 
    bne   $a3,  $zero, card_2_check

    addi  $s0,  $zero, 40
    addi  $s1,  $zero, 60
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_1:
    blt   $t1,  $gp, x_right_check_1
    j     card_2_check

x_right_check_1:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_1
    j     card_2_check

y_top_check_1:
    blt   $t2,  $sp, y_bottom_check_1
    j     card_2_check

y_bottom_check_1:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 1
    blt   $sp,  $t2, insideCard
    j     card_2_check

#-----------------------------------------------------------------

card_2_check:

    lw    $a3,  111($zero) 
    bne   $a3,  $zero, card_3_check

    addi  $s0,  $zero, 41
    addi  $s1,  $zero, 61
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_2:
    blt   $t1,  $gp, x_right_check_2
    j     card_3_check

x_right_check_2:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_2
    j     card_3_check

y_top_check_2:
    blt   $t2,  $sp, y_bottom_check_2
    j     card_3_check

y_bottom_check_2:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 2
    blt   $sp,  $t2, insideCard
    j     card_3_check

#-----------------------------------------------------------------

card_3_check:

    lw    $a3,  112($zero) 
    bne   $a3,  $zero, card_4_check

    addi  $s0,  $zero, 42
    addi  $s1,  $zero, 62
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_3:
    blt   $t1,  $gp, x_right_check_3
    j     card_4_check

x_right_check_3:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_3
    j     card_4_check

y_top_check_3:
    blt   $t2,  $sp, y_bottom_check_3
    j     card_4_check

y_bottom_check_3:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 3
    blt   $sp,  $t2, insideCard
    j     card_4_check

#-----------------------------------------------------------------

card_4_check:

    lw    $a3,  113($zero) 
    bne   $a3,  $zero, card_5_check

    addi  $s0,  $zero, 43
    addi  $s1,  $zero, 63
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_4:
    blt   $t1,  $gp, x_right_check_4
    j     card_5_check

x_right_check_4:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_4
    j     card_5_check

y_top_check_4:
    blt   $t2,  $sp, y_bottom_check_4
    j     card_5_check

y_bottom_check_4:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 4
    blt   $sp,  $t2, insideCard
    j     card_5_check

#-----------------------------------------------------------------

card_5_check:

    lw    $a3,  114($zero) 
    bne   $a3,  $zero, card_6_check

    addi  $s0,  $zero, 44 
    addi  $s1,  $zero, 64
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_5:
    blt   $t1,  $gp, x_right_check_5
    j     card_6_check

x_right_check_5:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_5
    j     card_6_check

y_top_check_5:
    blt   $t2,  $sp, y_bottom_check_5
    j     card_6_check

y_bottom_check_5:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 5
    blt   $sp,  $t2, insideCard
    j     card_6_check

#-----------------------------------------------------------------

card_6_check:

    lw    $a3,  115($zero) 
    bne   $a3,  $zero, card_7_check

    addi  $s0,  $zero, 45
    addi  $s1,  $zero, 65
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_6:
    blt   $t1,  $gp, x_right_check_6
    j     card_7_check

x_right_check_6: 
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_6
    j     card_7_check

y_top_check_6:
    blt   $t2,  $sp, y_bottom_check_6
    j     card_7_check

y_bottom_check_6:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 6
    blt   $sp,  $t2, insideCard
    j     card_7_check

#-----------------------------------------------------------------

card_7_check:

    lw    $a3,  116($zero) 
    bne   $a3,  $zero, card_8_check

    addi  $s0,  $zero, 46  
    addi  $s1,  $zero, 66  
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_7:
    blt   $t1,  $gp, x_right_check_7
    j     card_8_check

x_right_check_7:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_7
    j     card_8_check

y_top_check_7: 
    blt   $t2,  $sp, y_bottom_check_7
    j     card_8_check

y_bottom_check_7:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 7
    blt   $sp,  $t2, insideCard
    j     card_8_check

#-----------------------------------------------------------------

card_8_check:

    lw    $a3,  117($zero) 
    bne   $a3,  $zero, card_9_check

    addi  $s0,  $zero, 47
    addi  $s1,  $zero, 67
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_8:
    blt   $t1,  $gp, x_right_check_8
    j     card_9_check

x_right_check_8:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_8
    j     card_9_check

y_top_check_8:
    blt   $t2,  $sp, y_bottom_check_8
    j     card_9_check

y_bottom_check_8:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 8
    blt   $sp,  $t2, insideCard
    j     card_9_check

#-----------------------------------------------------------------

card_9_check:

    lw    $a3,  118($zero) 
    bne   $a3,  $zero, card_10_check

    addi  $s0,  $zero, 48
    addi  $s1,  $zero, 68
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_9:
    blt   $t1,  $gp, x_right_check_9
    j     card_10_check

x_right_check_9:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_9
    j     card_10_check

y_top_check_9:
    blt   $t2,  $sp, y_bottom_check_9
    j     card_10_check

y_bottom_check_9: 
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 9
    blt   $sp,  $t2, insideCard
    j     card_10_check

#-----------------------------------------------------------------

card_10_check:

    lw    $a3,  119($zero) 
    bne   $a3,  $zero, card_11_check

    addi  $s0,  $zero, 49
    addi  $s1,  $zero, 69 
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_10: 
    blt   $t1,  $gp, x_right_check_10
    j     card_11_check

x_right_check_10: 
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_10
    j     card_11_check

y_top_check_10: 
    blt   $t2,  $sp, y_bottom_check_10
    j     card_11_check

y_bottom_check_10:  
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 10
    blt   $sp,  $t2, insideCard
    j     card_11_check

#-----------------------------------------------------------------

card_11_check:

    lw    $a3,  120($zero) 
    bne   $a3,  $zero, card_12_check

    addi  $s0,  $zero, 50
    addi  $s1,  $zero, 70
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_11:
    blt   $t1,  $gp, x_right_check_11
    j     card_12_check

x_right_check_11:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_11
    j     card_12_check

y_top_check_11:
    blt   $t2,  $sp, y_bottom_check_11
    j     card_12_check

y_bottom_check_11:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 11
    blt   $sp,  $t2, insideCard
    j     card_12_check

#-----------------------------------------------------------------

card_12_check:

    lw    $a3,  121($zero) 
    bne   $a3,  $zero, card_13_check

    addi  $s0,  $zero, 51
    addi  $s1,  $zero, 71
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_12:
    blt   $t1,  $gp, x_right_check_12
    j     card_13_check

x_right_check_12:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_12
    j     card_13_check

y_top_check_12:
    blt   $t2,  $sp, y_bottom_check_12
    j     card_13_check

y_bottom_check_12:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 12
    blt   $sp,  $t2, insideCard
    j     card_13_check

#-----------------------------------------------------------------

card_13_check:

    lw    $a3,  122($zero) 
    bne   $a3,  $zero, card_14_check

    addi  $s0,  $zero, 52 
    addi  $s1,  $zero, 72
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_13:
    blt   $t1,  $gp, x_right_check_13
    j     card_14_check

x_right_check_13:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_13
    j     card_14_check

y_top_check_13:
    blt   $t2,  $sp, y_bottom_check_13
    j     card_14_check

y_bottom_check_13:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 13
    blt   $sp,  $t2, insideCard
    j     card_14_check

#-----------------------------------------------------------------

card_14_check:

    lw    $a3,  123($zero) 
    bne   $a3,  $zero, card_15_check

    addi  $s0,  $zero, 53
    addi  $s1,  $zero, 73
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_14:
    blt   $t1,  $gp, x_right_check_14
    j     card_15_check

x_right_check_14:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_14
    j     card_15_check

y_top_check_14:
    blt   $t2,  $sp, y_bottom_check_14
    j     card_15_check

y_bottom_check_14:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 14
    blt   $sp,  $t2, insideCard
    j     card_15_check

#-----------------------------------------------------------------

card_15_check:

    lw    $a3,  124($zero) 
    bne   $a3,  $zero, card_16_check

    addi  $s0,  $zero, 54
    addi  $s1,  $zero, 74
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_15:
    blt   $t1,  $gp, x_right_check_15
    j     card_16_check

x_right_check_15:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_15
    j     card_16_check

y_top_check_15:
    blt   $t2,  $sp, y_bottom_check_15
    j     card_16_check

y_bottom_check_15:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 15
    blt   $sp,  $t2, insideCard
    j     card_16_check

#-----------------------------------------------------------------

card_16_check:

    lw    $a3,  125($zero) 
    bne   $a3,  $zero, gameLoop

    addi  $s0,  $zero, 55
    addi  $s1,  $zero, 75
    lw    $t1,  0($s0)  # DELIMIT_X
    lw    $t2,  0($s1)  # DELIMIT_Y

x_left_check_16:
    blt   $t1,  $gp, x_right_check_16
    j     gameLoop

x_right_check_16:
    addi  $t1,  $t1, 72
    blt   $gp,  $t1, y_top_check_16
    j     gameLoop

y_top_check_16:
    blt   $t2,  $sp, y_bottom_check_16
    j     gameLoop

y_bottom_check_16:
    addi  $t2,  $t2, 72
    addi  $at,  $zero, 16
    blt   $sp,  $t2, insideCard
    j     gameLoop










#-----------------------------------------------------------------

insideCard: 
    blt   $t7,  $at, timeToFlip
    sub   $a3,  $t7, $at  # POSITIVE difference

returnFlip:
    addi  $a2,  $zero, 1
    blt   $a3,  $a2, gameLoop

    addi  $t6,  $zero, 1
    sw    $t6,  79($at)

    bne   $t9,  $zero, stateChange_1_to_2_or_3
    j     stateChange_0_to_1

#-----------------------------------------------------------------

stateChange_0_to_1:

    addi  $t7,  $at, 0  # UPDATE previous card

    addi  $t9,  $zero, 1  # UPDATE STATE

    addi  $a1,  $zero, 1
    sw    $a1,  79($at)  # ON of current card

    sw    $at,  56($zero)  # Memory[56] stores previous card
    j     gameLoop


stateChange_1_to_2_or_3:

    lw    $t6,  56($zero)  # no. of previous card
    lw    $a2,  19($t6)    # color of previous card
    lw    $t5,  19($at)    # color of new card
    bne   $a2,  $t5, stateChange_1_to_2


stateChange_1_to_3:

    addi  $t9, $zero, 3   # UPDATE STATE

    addi  $a1,  $zero, 1
    sw    $a1,  79($t7)  # ON of previous card
    sw    $a1,  79($at)  # ON of current card

    nop
    nop
    nop
    nop
    nop

    sw    $a1,  109($at)  # SOLVED of current card
    sw    $a1,  109($t7)  # SOLVED of previous card

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    addi  $s7,  $s7, 1    # UPDATE CURRENT SCORE AND CHECK IF GAME OVER
    blt   $s6,  $s7, gameOver

    addi  $t7,  $zero, 20  # UPDATE previous card

    addi  $t9, $zero, 0    # UPDATE STATE

    j     gameLoop


stateChange_1_to_2:  # NEED TO ENSURE THAT WHILE WE ARE STILL IN THE SECOND WRONG CARD, NO FURTHER PENALTY

    addi  $t9, $zero, 2   # UPDATE STATE

    addi  $a1,  $zero, 1
    sw    $a1,  79($at)   # ON of current card
    sw    $a1,  79($t7)   # ON of new card

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    sw    $zero,  109($at)  # not SOLVED of current card
    sw    $zero,  109($t7)  # not SOLVED of previous card
    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    sw    $zero,  79($at)   # OFF of new card

    addi  $k0,  $k0, 1    # UPDATE CURRENT LIVES AND CHECK IF GAME OVER
    blt   $s5,  $k0, gameOver

loopMe:

    lw    $t1,  0($s0)
    lw    $t2,  0($s1)

    blt   $t1,  $gp, new_rc
    j     exitOut

new_rc:

    addi  $t1,  $t1, 72
    blt   $gp,  $t1, new_tc
    j     exitOut

new_tc:

    blt   $t2,  $sp, new_bc
    j     exitOut

new_bc:    

    addi  $t2,  $t2, 72
    blt   $sp,  $t2, loopMe

exitOut:

    addi  $t9,  $zero, 1   # UPDATE STATE
    j     gameLoop


timeToFlip:
    sub   $a3,  $at, $t7
    j     returnFlip

gameOver:
    nop
    nop
    nop
