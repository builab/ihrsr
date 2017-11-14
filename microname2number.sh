count=1

inputDir='Micrographs'

spiDir='SpiderMicro'
ctfDir='gctf'
ctfProg='gctf'
boxDir='box'

mkdir $spiDir
mkdir $ctfDir
mkdir $boxDir


for i in ${inputDir}/FoilHole*_helix.box; 
  do 
         name=${i/_helix.box};
         fcount=$(printf "%05d" $count)
         echo "cp ${name}_${ctfProg}.log ${ctfDir}/${fcount}_${ctfProg}.log"
         echo "e2proc2d.py ${name}.mrc ${spiDir}/${fcount}.spi"
         echo "cp $i ${boxDir}/${fcount}.box"
         echo "${fcount}    ${name}" >> list_microname.txt
        cp ${name}_${ctfProg}.log ${ctfDir}/${fcount}_${ctfProg}.log
        e2proc2d.py ${name}.mrc ${spiDir}/${fcount}.spi
        cp $i ${boxDir}/${fcount}.box
         let count=$count+1;

done; 
