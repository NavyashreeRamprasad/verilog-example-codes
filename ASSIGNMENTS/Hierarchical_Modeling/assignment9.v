1) Why gate level implementation of full adder does not require any reg declaration?

In gate level modeling, the circuit is built using primitive logic gates such as and, or, xor, and not. These gates continuously drive their outputs based on the input values. Since the outputs are continuously assigned by hardware gates, they are treated as wire type by default.

reg is only needed when a value must store data inside procedural blocks like always or initial. Gate level modeling does not use procedural assignments, so no reg declaration is required.

Example:

xor (sum, a, b, cin);

Here, sum is driven directly by the gate output, so it behaves as a wire.

2) Why data flow implementation of full adder does not require any reg declaration?

In data flow modeling, the outputs are assigned using continuous assignment statements with the assign keyword. Continuous assignments automatically drive the output whenever the input changes, which means the outputs are of type wire.

Since there is no procedural block (always or initial) and no value storage operation, reg declarations are unnecessary.

Example:

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (a & cin);

The outputs sum and carry are continuously updated, so they do not need to be declared as reg.
