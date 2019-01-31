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

quast.py ../01_assembly/ecoli_assembly-SRR2627019_80x/K*/final_contigs.fasta -t 5  -R GCF_000005845.2_ASM584v2_genomic.fna \
-G GCF_000005845.2_ASM584v2_genomic.gff --scaffolds > ecoli_quast.log
