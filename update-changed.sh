
git diff --name-only upstream/main -- test | sed -e 's/llvm\///g' | xargs -l ./update-test.sh
