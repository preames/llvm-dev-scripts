git diff -U1 upstream/main | PATH=../../build/bin/:$PATH ../clang/tools/clang-format/clang-format-diff.py -i -p2
