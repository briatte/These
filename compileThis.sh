#!/bin/bash
#
# echo $#
# echo $@

OUTPUT_TEX=These_main.tex
OUTPUT_PDF=These_main.pdf
echo >| $OUTPUT_TEX
echo "\input{begin.tex}" >> $OUTPUT_TEX
if [ "$#" -gt "0" ]
then
    echo -n "\includeonly{" >> $OUTPUT_TEX
    for I in `seq 1 $#`
    do
      echo -n ${!I}/main >> $OUTPUT_TEX
      if [ $I -ne $# ]
      then
         echo -n ", " >> $OUTPUT_TEX
      fi
    done
    echo "}" >> $OUTPUT_TEX
fi

echo "\input{all.tex}" >> $OUTPUT_TEX
echo "\input{end.tex}" >> $OUTPUT_TEX


latexmk -pdf $OUTPUT_TEX

evince $OUTPUT_PDF &
