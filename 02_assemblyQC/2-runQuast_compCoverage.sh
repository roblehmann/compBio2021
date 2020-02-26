#!/bin/bash
#SBATCH --job-name=quast
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --time=6:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# QUAST: quality assessment tool for genome assemblies
# https://academic.oup.com/bioinformatics/article/29/8/1072/228832

module load quast

set -vex

# collect different assemblies for comparison
ln -s ../01_assembly/ecoli_assembly-SRR2627019_10x/scaffolds.fasta ecoli_1mb_10x_spades.fasta
ln -s ../01_assembly/ecoli_assembly-SRR2627019_20x/scaffolds.fasta ecoli_1mb_20x_spades.fasta
ln -s ../01_assembly/ecoli_assembly-SRR2627019_40x/scaffolds.fasta ecoli_1mb_40x_spades.fasta
ln -s ../01_assembly/ecoli_assembly-SRR2627019_80x/scaffolds.fasta ecoli_1mb_80x_spades.fasta

quast.py ecoli_1mb_*x_spades.fasta -t 5 -s -o coverage_comparison_quast > ecoli_quast.log
