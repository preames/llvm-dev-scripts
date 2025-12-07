set -e
#set -x

SOURCEFILE=$(readlink -f sqlite-autoconf-3380500/sqlite3.c)

# Combinations are ordered to produce 128, O2, on first since that's most
# likely to give useful coverage
for OPTLEVEL in "-O2" "-O1" "-O0" "-g -O0" "-g -O1" "-g -O2"
do
    for MARCH in "rv64gc" "rv64gcvb" "rva23u64"
    do
        echo "Building -march=$MARCH $OPTLEVEL"
        $CC -march=$MARCH $OPTLEVEL $SOURCEFILE -S
    done
    for MCPU in "spacemit-x60" "sifive-x280"
    do
        echo "Building -mcpu=$MCPU $OPTLEVEL"
        $CC -mcpu=$MCPU $OPTLEVEL $SOURCEFILE -S
    done
done


