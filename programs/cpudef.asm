#bankdef bank
{
    #bits 16
    #addr 0
    #size 1<<8
    #outp 0
    #fill
}

#subruledef opcode {
    NOP    => 0`8
    LI     => 1`8
    ADD    => 2`8
    DROP   => 3`8
    DUPE   => 4`8
    JUMP   => 5`8
    JUMPZ  => 6`8
    JUMPNZ => 7`8
    HALT   => 8`8
}

#ruledef {
    op {opcode: opcode}, {imm:s8} => imm`8 @ opcode`8

    nop            => asm { op NOP,  0 }
    li {imm:s8}    => asm { op LI,   {imm} }
    add            => asm { op ADD,  0 }
    drop           => asm { op DROP, 0 }
    dupe           => asm { op DUPE, 0 }
    jump {label}   => asm { op JUMP, {label}-$ }
    jumpz {label}  => asm { op JUMPZ, {label}-$ }
    jumpnz {label} => asm { op JUMPNZ, {label}-$ }
    halt           => asm { op HALT, 0 }

    haltnz         => asm {
        op JUMPZ, 2
        halt
    }

    haltz         => asm {
        op JUMPNZ, 2
        halt
    }
}

beginning:

test_drop:
    li 0
    li 1
    drop
    haltnz
    drop

test_addition:
    li 1
    li 2
    add
    li 4
    add
    li -7
    add
    haltnz
    drop

test_dupe:
    li 1
    dupe
    add
    li -2
    add
    haltnz
    drop

test_jump:
    li 1
    jump forward
    li 2
backward:
    li 3
    jump end
    li 4
forward:
    li 5
    jump backward
    li 6
end:
    add
    add
    li -9
    add
    haltnz
    drop

finished:
    jump beginning
