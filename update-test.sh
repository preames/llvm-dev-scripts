echo $1
line=$(head -n 1 $1)
case "$line" in 
  *update_llc_test*)
  # Do stuff
      ./utils/update_llc_test_checks.py --llc-binary=./llc -u $1
      exit 0
    ;;
  *update_mir_test*)
  # Do stuff
      ./utils/update_mir_test_checks.py --llc-binary=./llc -u $1
      exit 0
    ;;
  *update_test*)
  # Do stuff
      ./utils/update_test_checks.py --opt-binary=./opt -u $1
      exit 0
    ;;
  *update_analyze_test*)
  # Do stuff
      ./utils/update_analyze_test_checks.py --opt-binary=./opt -u $1
      exit 0
    ;;
esac
echo "$1 does not appear to be auto-generated"
exit 0

