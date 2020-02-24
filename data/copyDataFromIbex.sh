#!/bin/bash

inPath='/ibex/scratch/projects/c2024/labcourse2020_genomics_data'

cp ${inPath}/Practical_Manual.pdf .

# copy gene annotation, protein sequences, genome seq. for comparison of our results
echo "copying reference genome files..."
cp ${inPath}/GCF_000005845.2_ASM584v2* .

# get busco gene set database to assess completeness of our assmbly candidates
echo 'copying busco files...'
cp -r ${inPath}/enterobacteriales_odb9 .

# copy small version of kraken2 database
echo "copying Kraken2 files..."
cp ${inPath}/*k2d .

