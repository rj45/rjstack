#bankdef bank
{
    #bits 16
    #addr 0
    #size 1<<5
    #outp 0
    #fill
}

#subruledef opcode {
    NOP  => 0`8
    LI   => 1`8
    ADD  => 2`8
    DROP => 3`8
    DUPE => 4`8
}

#ruledef {
    op {opcode: opcode}, {imm:s8} => imm`8 @ opcode`8

    nop         => asm { op NOP,  0 }
    li {imm:s8} => asm { op LI,   {imm} }
    add         => asm { op ADD,  0 }
    drop        => asm { op DROP, 0 }
    dupe        => asm { op DUPE, 0 }
}

program:
    li 1
    li 2
    add
    li 4
    add
