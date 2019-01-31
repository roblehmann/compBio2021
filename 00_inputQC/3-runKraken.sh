#!/bin/bash
#SBATCH --job-name=kraken
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# install and run kraken2 - ultrafast metagenomic sequence classification using exact alignments
# https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-3-r46

module load kraken2

set -vex

# download small version of kraken2 database
# wget https://ccb.jhu.edu/software/kraken2/dl/minikraken2_v2_8GB.tgz
# tar -zxf minikraken2_v2_8GB.tgz

kraken2 --db ../data/ --threads 4 --gzip-compressed --paired \
--report output/ecoli_kraken2_report.txt --output - \
../data/SRR2627019.1m.80xR1.fq.gz ../data/SRR2627019.1m.80xR2.fq.gz
