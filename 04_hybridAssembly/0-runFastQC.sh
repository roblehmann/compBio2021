#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# fastQC
# https://www.bioinformatics.babraham.ac.uk/projects/fastqc/

set -vex

module load fastqc

outDir='ecoli_pacbio_fastqc'
mkdir -p $outDir

threads=2

fastqc ../data/SRR1284073.1m.5x.pacbio.fastq.gz -o $outDir -t ${threads}

