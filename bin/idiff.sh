#!/bin/bash
P4="p4 opened"
if [ "$#" == 1 ]; then
  P4="$P4 -c $1"
fi
$P4  | awk 'BEGIN { FS = "#" } // { print "p4 diff " $1 }' # | sh 
# p4 diff //depot/storage/block_file/CMakeLists.txt
# | emacs -nw --eval '(ediff-files "'$1'" "'$2'")'
# emacs -nw --eval "(p4-ediff CMakeList.txt)"
