pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal output out;

    component low = LessEqThan(n);
    component high = GreaterEqThan(n);

    // pass the input and lower bound to the less than or equal to comparator component
    low.in[0] <== in;
    low.in[1] <== range[0];

    // pass the input and upper bound to the greater than or equal to comparator component
    high.in[0] <== in;
    high.in[1] <== range[1];

    // output signal will be 1 if both low.out and high.out are 1
    out <== low.out * high.out;
}