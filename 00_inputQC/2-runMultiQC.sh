#!/bin/bash
#SBATCH --job-name=multiqc
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=4:00:00
#SBATCH --mem=5000
#SBATCH --mail-type=end

# multiqc
# https://academic.oup.com/bioinformatics/article/32/19/3047/2196507

module load multiqc

set -vex

multiqc output
