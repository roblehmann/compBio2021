# Computational Bioscience & Machine Learning 2018/2019 - KAUST
## Practical Session: Genome Assembly

### Structure

1. Quality control on input data 
2. Assembling a small genome sequence
3. Assembly QC
4. Annotating genes 
5. Using long reads for assembly
6. Hybrid Assembly QC

### Data

1.	The first data set is from the bacterium E. coli, for which the public NCBI data set SRR2627019 contains 250bp long paired end Illumina MiSeq reads. It is the basis for the paper “**Barroso-Batista, J., Demengeot, J., & Gordo, I. (2015). Adaptive immunity increases the pace and predictability of evolutionary change in commensal gut bacteria. Nature Communications, 6, 8945.** [http://doi.org/10.1038/ncomms9945]”. While the genome of E.coli is 4.6 megabases (Mb) large ([https://www.ncbi.nlm.nih.gov/genome/167?genome_assembly_id=161521]), we will use only reads originating from the first 1 Mb as to speed up analyses steps and assemblies. The two paired end files can be found in the data folder and are called:  
SRR2627019.1m.40xR2.fq.gz 
SRR2627019.1m.40xR2.fq.gz
You will also find additional files, SRR2627019.1m.10xR1.fq.gz, SRR2627019.1m.20xR1.fq.gz, SRR2627019.1m.40xR1.fq.gz, …, which correspond to the same genomic region but different numbers of reads. The task is to figure out how the coverage influences the assembly result.

2. Several new sequencing technologies have been developed recently which provide significantly longer reads compared to the now-standard second-generation short read technology by e.g. Illumina. Such long read data can be used to improve significantly the results of genome assemblies. We will use the public E. coli data set from NCBI SRR1284073 which contains long PacBio reads. It is the basis for the paper “**Berlin K, Koren S, Chin CS, Drake JP, Landolin JM, Phillippy AM. (2015). Assembling large genomes with single-molecule sequencing and locality-sensitive hashing. Nature Biotechnology, 33:623-30.** [https://doi.org/10.1038/nbt.3238]”.
A good review on long read sequencing and bioinformatics is by **Sedlazeck FJ, Lee H, Darby CA,  Schatz MC. (2018). Piercing the dark matter: bioinformatics of long-range sequencing and mapping. Nature Reviews Genetics, 19:329-346**, ([https://www.nature.com/articles/s41576-018-0003-4]). The file SRR1284073.1m.5x.pacbio.fastq.gz contains a small number of PacBio long reads mapping to the E.coli genome region that we are trying to assemble.

3.	The second NCBI dataset SRR2986339 contains reads from the tardigrade and is the basis for the paper “**Boothby, T. C., et al. (2015). Evidence for extensive horizontal gene transfer from the draft genome of a tardigrade. Proceedings of the National Academy of Sciences of the United States of America, 112(52), 15976–15981.** [http://doi.org/10.1073/pnas.1510461112]” ([https://www.ncbi.nlm.nih.gov/genome/768?genome_assembly_id=313403]):
tardigrade_SRR2986339_subsampled_1.fq.gz
tardigrade_SRR2986339_subsampled_2.fq.gz


### Software

#### QC
* [FASTQC](http://www.bioinformatics.babraham.ac.uk/projects/fastqc)
* [K-mer analysis toolkit](https://kat.readthedocs.io)
* [Trimmomatic](https://github.com/timflutre/trimmomatic)
* [MultiQC](https://multiqc.info)
* [Kraken2](https://ccb.jhu.edu/software/kraken2/index.shtml?t=manual)
* [Quality Assessment Tool for Genome Assemblies](http://quast.sourceforge.net/quast)

#### Assembly
* [SPADes](http://cab.spbu.ru/software/spades/)

#### Annotation
* [PROKKA](https://github.com/tseemann/prokka)

#### HPC Environment – Job Scheduling
* [Slurm](https://slurm.schedmd.com/)
