# 24 Ripple Carry Adder (Multiple Modules)

A Ripple Carry Adder (RCA) is a multi-bit addition circuit composed of a number of cascaded full adders (FAs).  In an RCA, the carry-out bit of stage i is propagated to the carry-in port, cin, of stage i+1 so that the carry bit ripples through the entire chain of FAs, from the least significant bit (LSB) to the most significant bit (MSB).

Use the solution to question 22 (Full Adder) and implement a flexible data width RCA.  The RCA module takes two integers a and b, and produces two output words sum and cout_fa1.  Output cout_fa1 corresponds to the carry-out nets of each FA stage.

Important
This question must be solved using a multimodule approach.  That is, there must be a module for a single-bit FA that is instantiated DATA_WIDTH times in order to build a multi-bit RCA.  You will be able to use the solution to question 22 (Full Adder) as the single-bit FA module.

Input and Output Signals

    a - First operand input word
    b - Second operand input word
    sum - Output word corresponding to a plus b operation (note that sum has DATA_WIDTH+1 bits to account for the carry-out/overflow bit)
    cout_int - Internal carry-out nets, ouputs of the full adder instances
