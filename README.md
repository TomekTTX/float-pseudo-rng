# float-pseudo-rng
A reasonably uniform pseudo-random floating-point number generator.

Each new number is generated by repeatedly rotating the previous one's mantissa bits while replacing the 0th bit with the XOR of bits 7 and 14.
This, after setting the exponent bits to 0x7F, generates a number between 1 (inclusive) and 2 (exclusive). Finally, subtracting 1 from that number generates a result from the \[0,1) range.
