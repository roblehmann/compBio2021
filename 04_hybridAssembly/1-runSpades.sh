#!/bin/bash
#SBATCH --job-name=spades_hybrid
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --time=4:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

module load spades

set -vex

# 80x of short reads + 5x of long reads
spades.py -m30 -t5 -1 ../00_inputQC/output/SRR2627019.1m.80x_trimmed_R1.fq.gz \
			-2 ../00_inputQC/output/SRR2627019.1m.80x_trimmed_R2.fq.gz \
			--pacbio ../data/SRR1284073.1m.5x.pacbio.fastq.gz \
			-o SPAdes_hybrid
