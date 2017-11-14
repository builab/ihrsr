#!/bin/csh -f
# Script to convert CTFfind3 or Gctf log output to spider
# From Justin Kollman, UW

if ($2 == "") then
  echo "usage: $0 input_log_file output_spider_document"
  exit
endif

grep -a 'File      :' $1 | grep 'mrc' | cut -f2 -d "/" | cut -f1 -d "." > temp

grep -a 'Final Values' $1 > temp2

paste temp temp2 | sed 's/	    /  4  /' | sed 's/ Final Values//' > $2

#rm temp
#rm temp2
