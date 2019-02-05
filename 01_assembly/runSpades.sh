#!/bin/bash
#SBATCH --job-name=spades
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --time=6:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# SPAdes assembler
# https://www.liebertpub.com/doi/abs/10.1089/cmb.2012.0021

module load spades

set -vex

# run assembler on trimmed 40x ecoli data
spades.py -m30 -t5 -o ./ecoli_assembly-SRR2627019_40x \
-1 ../00_inputQC/output/SRR2627019.1m.40x_trimmed_R1.fq.gz \
-2 ../00_inputQC/output/SRR2627019.1m.40x_trimmed_R2.fq.gz \
> spades_ecoli_40x.log
