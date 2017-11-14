#!/bin/bash
# Script now parallelize
# HB 2017/03/02

noProcs=10 # No of Processors to use

count=1

inputDir='Micrographs'

spiDir='SpiderMicro'
ctfDir='gctf'
ctfProg='gctf'
boxDir='box'

mkdir $spiDir
mkdir $ctfDir
mkdir $boxDir

rm list_microname.txt
rm xx_cm

for i in ${inputDir}/FoilHole*_helix.box; 
  do 
         name=${i/_helix.box};
         fcount=$(printf "%05d" $count)
         echo "cp ${name}_${ctfProg}.log ${ctfDir}/${fcount}_${ctfProg}.log" >> xx_cm
         echo "e2proc2d.py ${name}.mrc ${spiDir}/${fcount}.spi" >> xx_cm
         echo "cp $i ${boxDir}/${fcount}.box" >> xx_cm
         echo "${fcount}    ${name}" >> list_microname.txt        
         let count=$count+1;
done; 

# Running parallel using GNU parallel
parallel --jobs $noProcs < xx_cm


