# 25 Flip-Flop Array

Design a simple 1-read/write (1RW) register file (RF) by using a
multidimentional array of flip-flops in Verilog.

The RF should have 8 entries with each entry being an 8-bit digital word.  The
input word din is written to one of the 8 entries of the RF by using the 3-bit
port addr and asserting signal wr.  An entry is retrieved from the RF by
selecting the address and asserting the rd signal.  If one tries to read from an
address that has never been written to, ~then dout and error should both output zero~
dout should output 0 and error 1.

This is a simple RF so it should support only one operation per clock cycle,
either a read or write.  If both rd and wr ports are set to logic level high in
a cycle, then error is asserted, and dout is set to zero in order to indicate
the operation has failed.  Input and Output Signals

    din - Input data port
    addr - Address input to the flip-flop array
    wr - Write-enable input signal
    rd - Read-enable input signal
    clk - Clock signal
    resetn - Synchronous, active-low, reset signal
    dout - Output data port
    error - Error signal - Invalid operation

Output signals during reset

    dout - 0
    error - 0
