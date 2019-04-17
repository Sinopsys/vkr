#!/bin/bash
fname=$(basename -s .tex $1)
pdflatex -synctex=1 ${fname}.tex
evince ${fname}.pdf &
