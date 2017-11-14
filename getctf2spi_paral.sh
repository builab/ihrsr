# Parallel to do this
# Need getctfs2spi file
noProcs=10
inputDir='gctf'

rm xx_ctf
for i in ${inputDir}/*gctf.log;
do 
	echo "./getctfs2spi.sc $i ${i/_gctf.log}_ctf.spi" >> xx_ctf
done; 

# Running GNU parallel
parallel --jobs $noProcs < xx_ctf

cd ${inputDir}

cat *ctf.spi |awk '{printf "%5d %5d %10.2f %10.2f %10.2f %10.5f\n", 1+count++, 4, $2, $3, $4, $5}'>ctf512.spi 
