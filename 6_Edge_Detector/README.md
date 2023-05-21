# 6 Edge Detector

Build a circuit that pulses dout one cycle after the rising edge of din. A pulse is defined as writing a single-cycle 1 as shown in the examples below. When resetn is asserted, the value of din should be treated as 0.

Bonus - can you enhance your design to pulse dout on the same cycle as the rising edge? Note that this enhancement will not pass our test suite, but is still a useful exercise.
Input and Output Signals

    clk - Clock signal
    resetn - Synchronous reset-low signal
    din - Input signal
    dout - Output signal

Output signals during reset

    dout - 0 when resetn is active

*Note* : I know using the reset signal in logic will never fly if 
        implemented. 

## Formal 

We have an extra module for the bonus question in `bonus.v` accompanied by an extra `bonus.sby` file.

```
sby -f bonus.sby
```

Waves will be in the `bonus_basic/engine_0/trace.vcd` file.

```
gtkwave bonus_basic/engine_0/trace.vcd model.gtkw
```
