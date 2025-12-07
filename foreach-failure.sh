
cat failures | sed -e 's/  LLVM :: /test\//g' | sed -e 's/llvm\///g' | xargs -l 
