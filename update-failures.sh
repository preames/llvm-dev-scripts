
cat failures | sed -e 's/  LLVM :: /test\//g' | sed -e 's/llvm\///g' | sort | uniq | xargs -l ./update-test.sh
