#!/bin/bash
# Modify for bash shell

count=1

cd box

if [ -e "microlist.spi" ]; then 
	rm microlist.spi
fi

for i in *.box;
    do
	echo "  $count    1   ${i/.box} " >> microlist.spi;
	let count=$count+1
done;
