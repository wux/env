FILE=log
CMD="\"$FILE\" using 1 title 'max' with lines,\
\"$FILE\" using 2 title 'avg' with lines,\
\"$FILE\" using 4 title 'total' with lines,\
\"$FILE\" using 5 title 'no-max' with lines,\
\"$FILE\" using 3 title 'min' with lines"

#CMD="

#\"$FILE\" using 5 title 'no-max' with lines"

echo "plot " $CMD "; pause 500" | gnuplot