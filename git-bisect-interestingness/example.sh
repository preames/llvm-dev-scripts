#!/bin/bash
# An example of what a git bisect run script looks like.

ninja -C ../build -j31 opt llc
../llvm-reduce-interestingness/llc-crash-assert.sh <filename>

