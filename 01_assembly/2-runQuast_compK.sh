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

ln -s ecoli_assembly-SRR2627019_40x/K21/final_contigs.fasta ecoli_1mb_40x_spades_k21.fasta
ln -s ecoli_assembly-SRR2627019_40x/K33/final_contigs.fasta ecoli_1mb_40x_spades_k33.fasta
ln -s ecoli_assembly-SRR2627019_40x/K55/final_contigs.fasta ecoli_1mb_40x_spades_k55.fasta
ln -s ecoli_assembly-SRR2627019_40x/K77/final_contigs.fasta ecoli_1mb_40x_spades_k77.fasta
ln -s ecoli_assembly-SRR2627019_40x/K99/final_contigs.fasta ecoli_1mb_40x_spades_k99.fasta
ln -s ecoli_assembly-SRR2627019_40x/K127/final_contigs.fasta ecoli_1mb_40x_spades_k127.fasta

quast.py ecoli_1mb_40x_spades_k*.fasta -t 5 -o kmer_comparison_quast > ecoli_quast.log
