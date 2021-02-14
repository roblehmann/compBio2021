#!/bin/bash


# download gene annotation, protein sequences, genome seq. for comparison of our results
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_protein.faa.gz

gunzip GCF_000005845.2_ASM584v2_*

# get busco gene set database to assess completeness of our assmbly candidates
wget --no-check-certificate https://busco-data.ezlab.org/v4/data/lineages/enterobacterales_odb10.2020-03-06.tar.gz && \\
tar -zxf enterobacterales_odb10.2020-03-06.tar.gz && \
rm enterobacterales_odb10.2020-03-06.tar.gz

# download small version of kraken2 database
wget ftp://ftp.ccb.jhu.edu/pub/data/kraken2_dbs/minikraken_8GB_202003.tgz && \
tar -zxf minikraken_8GB_202003.tgz && rm minikraken_8GB_202003.tgz
