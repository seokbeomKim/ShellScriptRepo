#!/bin/sh

rm -rf cscope.files cscope.out
find $PWD -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' \) -print | awk '{print "\""$0"\""}' > cscope.files
cscope -i cscope.files
