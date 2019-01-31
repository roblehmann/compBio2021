#!/bin/bash
#SBATCH --job-name=prokka
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# Prokka: rapid prokaryotic genome annotation
# https://academic.oup.com/bioinformatics/article/30/14/2068/2390517

module load prokka

set -vex

inFile80x='../01_assembly/ecoli_assembly-SRR2627019_80x/scaffolds.fasta'
protFile='../data/GCF_000005845.2_ASM584v2_protein.faa'

prokka --outdir ecoli_assembly-SRR2627019_80x_prokka --proteins $protFile --usegenus --addgenes \
--kingdom Bacteria --genus Escherichia --species coli --strain KAUST --plasmid plasmid \
$inFile80x  > prokka.log 2>&1

