PUSH = 1 << 0
POP  = 1 << 1

WE_I_TOS = 1 << 2
WE_NOS_TOS = 1 << 3
WE_Y_TOS = 1 << 4


#ruledef {
    op {flags} => le(flags`8)
}

#bankdef bank
{
    #bits 8
    #addr 0
    #size 1<<5
    #outp 0
    #fill
}

nop: ; 0b0000
    op 0

li: ; 0b0001
    op PUSH | WE_I_TOS

add: ; 0b0010
    op POP | WE_Y_TOS

drop: ; 0b0011
    op POP | WE_NOS_TOS

dupe: ; 0b0100
    op PUSH | WE_NOS_TOS
