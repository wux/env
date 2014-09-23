awk '{x[NR]=$0; s+=$0} END{a=s/NR; for (i in x){ss += (x[i]-a)^2} sd = sqrt(ss/NR); print "SD = "sd}' $0
awk '{sum+=$1} END { print "Average = ",sum/NR}' $0
