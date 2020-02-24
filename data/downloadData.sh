#!/bin/bash


# download gene annotation, protein sequences, genome seq. for comparison of our results
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_protein.faa.gz

gunzip GCF_000005845.2_ASM584v2_*

# get busco gene set database to assess completeness of our assmbly candidates
wget --no-check-certificate https://busco.ezlab.org/v2/datasets/enterobacteriales_odb9.tar.gz && tar -zxf enterobacteriales_odb9.tar.gz

# download small version of kraken2 database
wget ftp://ftp.ccb.jhu.edu/pub/data/kraken2_dbs/minikraken2_v2_8GB_201904_UPDATE.tgz && tar -zxf minikraken2_v2_8GB_201904_UPDATE.tgz
mv minikraken2_v2_8GB_201904_UPDATE/*.* . && rm -rf minikraken2_v2_8GB_201904_UPDATE && rm minikraken2_v2_8GB_201904_UPDATE.tgz

