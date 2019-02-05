#!/bin/bash
#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# https://academic.oup.com/bioinformatics/article-abstract/30/15/2114/2390096

module load trimmomatic

set -vex

adapters="/sw/csi/trimmomatic/0.38//el7_binary/Trimmomatic-0.38/adapters/TruSeq3-PE-2.fa"
outDir="output"

java -jar $TRIMMOMATIC_JAR PE -phred33 -threads 4 -trimlog ${outDir}/ecoli_40x_trimmomatic.log \
-summary ${outDir}/ecoli_40x_trimmomatic.summary ../data/SRR2627019.1m.40xR1.fq.gz ../data/SRR2627019.1m.40xR2.fq.gz \
${outDir}/SRR2627019.1m.40x_trimmed_R1.fq.gz ${outDir}/SRR2627019.1m.40x_trimmed_unpaired_R1.fq.gz \
${outDir}/SRR2627019.1m.40x_trimmed_R2.fq.gz ${outDir}/SRR2627019.1m.40x_trimmed_unpaired_R2.fq.gz \
ILLUMINACLIP:${adapters}:2:30:10 LEADING:4 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40

# run quality assessment also on trimmed reads to compare
module load fastqc
fastqc ${outDir}/SRR2627019.1m.40x_trimmed_R1.fq.gz -o ${outDir} -t 2
fastqc ${outDir}/SRR2627019.1m.40x_trimmed_R2.fq.gz -o ${outDir} -t 2
