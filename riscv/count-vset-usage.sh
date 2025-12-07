echo "vsetivli"
for i in {1..31}
do
    echo "$i: $(fgrep "vsetivli" $1 | fgrep "zero, $i" | wc -l)"  
done
echo "vsetvli"
echo "zero, zero: $(fgrep "vsetvli" $1 | fgrep "zero, zero" | wc -l)"  
echo "reg, zero : $(fgrep "vsetvli" $1 | fgrep -v "zero, zero" | fgrep "zero, e" | wc -l)"  
echo "zero, reg : $(fgrep "vsetvli" $1 | fgrep -v "zero, zero" | fgrep -v "zero, e" | fgrep "zero, " | wc -l)"  
echo "reg, reg  : $(fgrep "vsetvli" $1 | fgrep -v "zero, zero" | fgrep -v "zero, e" | fgrep -v "zero, " | wc -l)"  
echo "vsetvl"
echo "$(fgrep "vset" $1 | fgrep -v vsetvli | fgrep -v vsetivli | wc -l)"  
