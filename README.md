# Chipdev questions

Chipdev is the leetcode equivalent for verilog, and this repo is me using these questions as an
support for learning to use yosyshq for my formal verification.

## Formal 

For each subfolder, unless otherwise specified : 

To launch the formal run :

```
sby -f formal.sby
```

If the run fails, waves for the fail can be found in the `formal_basic/engine_0/trace.vcd` file.

To open these waves using gtkware :
```
gtkwave formal_basic/engine_0/trace.vcd
```

