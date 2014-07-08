s=0
while [ $s -lt 14336 ]
do 
  dd if=/dev/zero of=/data/disk/k/foobar.$s count=1 bs=256M
  date +%S.%N
  s=$(($s + 1))
done
