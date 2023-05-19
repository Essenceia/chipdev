# 3 Rounding Division 

Divide an input number by a power of two and round the result to the nearest integer. The power of two is calculated using 2DIV_LOG2 where DIV_LOG2 is a module parameter. Remainders of 0.5 or greater should be rounded up to the nearest integer. If the output were to overflow, then the result should be saturated instead.
Input and Output Signals

    din - Input number
    dout - Rounded result
