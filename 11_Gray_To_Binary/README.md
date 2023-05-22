# 11 Gray Code to Binary 

Given a value, output its index in the standard Gray code sequence. This is known as converting a Gray code value to binary.

Each input value's binary representation is an element in the Gray code sequence, and your circuit should output the index of the Gray code sequence the input value corresponds to.

In the standard encoding the least significant bit follows a repetitive pattern of 2 on, 2 off ( ... 11001100 ... ); the next digit a pattern of 4 on, 4 off ( ... 1111000011110000 ... ); the nth least significant bit a pattern of 2n on 2n off.
Input and Output Signals

    gray - Input signal, interpreted as an element of the Gray code sequence
    bin - Index of the Gray code sequence the input corresponds to
