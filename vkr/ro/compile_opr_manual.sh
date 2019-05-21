#!/bin/bash
fname=$(basename -s .tex $1)
pdflatex -synctex=1 -interaction=nonstopmode ${fname}.tex
evince ${fname}.pdf &
