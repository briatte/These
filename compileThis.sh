#!/bin/bash



OUTPUT_TEX=These_main.tex
OUTPUT_PDF=These_main.pdf
echo >| $OUTPUT_TEX
echo "\input{begin.tex}" >> $OUTPUT_TEX
echo "\input{"$1"}" >> $OUTPUT_TEX
echo "\input{end.tex}" >> $OUTPUT_TEX

latexmk -pdf $OUTPUT_TEX

# evince $OUTPUT_PDF &
