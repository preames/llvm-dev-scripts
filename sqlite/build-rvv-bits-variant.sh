set -e
#set -x

SOURCEFILE=$(readlink -f sqlite-autoconf-3380500/sqlite3.c)

# Combinations are ordered to produce 128, O2, on first since that's most
# likely to give useful coverage
for OPTLEVEL in "-O2" "-O1" "-O0" "-g -O0" "-g -O1" "-g -O2"
do
    for VLEN in 128 256 512 1024 4096
    do
        for SCALABLE in "on" "off"
        do
            echo "Building VLEN=$VLEN, OPTLEVEL=$OPTLEVEL, SCALABLE=$SCALABLE"
            echo $CC -mllvm -riscv-v-vector-bits-min=$VLEN -mllvm -scalable-vectorization=$SCALABLE -Xclang -target-feature -Xclang +v,+f,+m,+c,+d,+zba $SOURCEFILE -c $OPTLEVEL
             $CC -mllvm -riscv-v-vector-bits-min=$VLEN -mllvm -scalable-vectorization=$SCALABLE -Xclang -target-feature -Xclang +v,+f,+m,+c,+d,+zba $SOURCEFILE -c $OPTLEVEL
            done
    done
done


