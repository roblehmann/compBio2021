#!/bin/bash
#SBATCH --job-name=quast_hybrid
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

module load quast

set -vex

# collect different assemblies for comparison
ln -s ../01_assembly/ecoli_assembly-SRR2627019_80x/scaffolds.fasta ecoli_SRR2627019_scaffolds_80x.fasta
ln -s ../04_hybridAssembly/SPAdes_hybrid/scaffolds.fasta ecoli_hybridAssembly_80x_5x.fasta

# get reference genome assembly with gene annotation
ln -s ../data/GCF_000005845.2_ASM584v2_genomic.gff .
ln -s ../data/GCF_000005845.2_ASM584v2_genomic.fna .

quast.py ecoli_*fasta -t 4 --gene-finding -R GCF_000005845.2_ASM584v2_genomic.fna -G GCF_000005845.2_ASM584v2_genomic.gff \
--scaffolds > ecoli_quast.log
