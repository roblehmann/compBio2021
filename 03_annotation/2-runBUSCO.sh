#!/bin/bash
#SBATCH --job-name=prokka
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --time=2:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# BUSCO: assessing genome assembly and annotation completeness with single-copy orthologs
# https://academic.oup.com/bioinformatics/article/31/19/3210/211866

module load busco

set -vex

inFile80x='ecoli_assembly-SRR2627019_80x_prokka/PROKKA_01302019.faa'
outPref='ecoli_80x_prokka'
lib='../data/enterobacteriales_odb9'

run_BUSCO.py -i $inFile80x -o $outPref -l $lib -c 5 -sp E_coli_K12 -m prot > ecoli_80x_busco.log 2>&1


# compare with full annotation of first 1 mb
# extract gene annotation of first 1mb
awk '$5 < 1000000' ../data/GCF_000005845.2_ASM584v2_genomic.gff > GCF_000005845.2_ASM584v2_genomic_1mb.gff
# extract corresponding reference protein sequences
module load stringtie/1.3.5/gnu-6.4.0
gffread GCF_000005845.2_ASM584v2_genomic_1mb.gff -g ../data/GCF_000005845.2_ASM584v2_genomic.fna \
-y GCF_000005845.2_ASM584v2_genomic_1mb_prot.fasta
# run busco on reference
inFile='GCF_000005845.2_ASM584v2_genomic_1mb_prot.fasta'
outPref='ecoli_ref_annotation_1mb'
run_BUSCO.py -i $inFile80x -o $outPref -l $lib -c 27 -sp E_coli_K12 -m prot > ecoli_80x_busco.log 2>&1
