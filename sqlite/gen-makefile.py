
# Combinations are ordered to produce 128, O2, on first since that's most
# likely to give useful coverage
opt_levels = ["-O2", "-O1", "-O0", "-g -O0", "-g -O1", "-g -O2", "-Ofast"]
marchs = ["rv64gc", "rv64gcvb", "rva22u64", "rva22u64_v", "rva23u64", "rv64gcb_zve32x"]
mcpus = ["spacemit-x60", "sifive-p550", "sifive-x280", "veyron-v1", "tt-ascalon-d8", "mips-p8700"]
sourcefile = "sqlite-autoconf-3380500/sqlite3.c"

print ("default: all")

def normalize_target(target):
    return target.replace("-", "_").replace(" ","").replace("__","_")

targets = []
for opt_level in opt_levels:
    for arch in marchs:
        target = "build/sqllite_" + opt_level + "_" + arch + ".s"
        target = normalize_target(target)
        print (target + ":")
        print (f"\t$(CC) -march={arch} {opt_level} {sourcefile} -S -o {target}")
        print ("")
        targets.append(target)
        pass
    for cpu in mcpus:
        target = "build/sqllite_" + opt_level + "_" + cpu + ".s"
        target = normalize_target(target)
        print (target + ":")
        print(f"\t$(CC) -mcpu={cpu} {opt_level} {sourcefile} -S -o {target}")
        print ("")
        targets.append(target)
        pass
    pass

print("all: " + " ".join(targets))
