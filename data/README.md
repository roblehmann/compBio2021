# The input data

## Raw read data
This folder contains all input data necessary for the genomics workshop part.
The raw short read data files (ending with ".fq.gz") are already present, where "R1"
marks forward reads while "R2" marked files contain the corresponding reverse reads of 
a paired sequencing run. Files beginning with "SRR2627019" contain reads from the E.coli experiment.
Note, that there are 4 sets of "SRR2627019" read pair files, marked 10x, 20x, 40x, and 80x which
indicates the coverage of the corresponding reads set. In contrast, the SRR1284073.1m.5x.pacbio.fastq.gz file
contains a complementary PacBio long read dataset (no paired reads, hence only one file).

The files named "SRR2986339" contain a short read dataset from the tardigrade genome.

## Data necessa for analysis
### What will be downloaded?

Firstly, three files ending ".k2d" contain a database of k-mer spectra which are required by Kraken 
to classify our raw input reads into taxonomies. Secondly, three files beginning with "GCF_000005845.2_ASM584v2"
contain the genomic reference sequence of E.coli (GCF_000005845.2_ASM584v2_genomic.fna), the location of genes
on the reference (GCF_000005845.2_ASM584v2_genomic.gff), and the corresponding protein sequences (GCF_000005845.2_ASM584v2_protein.faa).
Lastly, we will need the protein sequence collection of BUSCO (enterobacteriales_odb9).

### How to download?
The following data required for the analysis of the raw reads need to be downloaded from the websites or 
can be copied from a central folder on Ibex.

* to copy the files from Ibex (recommended since faster), run `./copyDataFromIbex.sh`

* to download from websites, run `./downloadData.sh`

