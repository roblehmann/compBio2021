#!/bin/bash
#SBATCH --job-name=kat
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# Kmer analysis tookit
# https://academic.oup.com/bioinformatics/article/33/4/574/2664339

set -vex

module load kat

# ecoli 40x read dataset
outDir="output"

kat gcp -m 57 -t 2 -o ${outDir}/SRR2627019.1m.40x -p pdf ../data/SRR2627019.1m.40xR1.fq.gz ../data/SRR2627019.1m.40xR2.fq.gz \
> ${outDir}/kat_SRR2627019.1m.40x.log
