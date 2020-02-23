#!/bin/bash

# copy small version of kraken2 database
echo "copying Kraken files..."
cp /ibex/scratch/projects/c2024/HTSworkshop2019_Genomics_data/*k2d .

# copy gene annotation, protein sequences, genome seq. for comparison of our results
echo "copying reference genome files..."
cp /ibex/scratch/projects/c2024/HTSworkshop2019_Genomics_data/GCF_000005845.2_ASM584v2* .

# get busco gene set database to assess completeness of our assmbly candidates
echo 'copying busco files...'
cp -r /ibex/scratch/projects/c2024/HTSworkshop2019_Genomics_data/enterobacteriales_odb9 .