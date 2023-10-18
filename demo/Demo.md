# Demo

## Introduction

This file has been written on 18th October 2023. Maybe it is not update or functional anymore.

In this demo, we are going to use a few samples from [Dadras et al. 2023](https://doi.org/10.1038/s41477-023-01491-0) to show how to use this pipeline to get expression tables from raw reads. These are samples of *Mesotaenium endlicherianum* grew under different temperature and light intensity. You can pick a different study or different subset of samples from this study. I first downloaded the raw reads from European Nucleotide Archive (ENA) website. You can also down them from NCBI or any other way you like. I put the links to the FTP files in one text file and used `wget` to download them as follows:
```
wget -i download_links.txt
```
Do not forget that this will occupy a huge part of your storage space, so if you do not have enough space please make the list shorter. I provided a study design file in this folder as well, `study_design.txt`, which can be used to investigate the metadata that is available for each sample. I picked many samples because of two reasons. First, I want to show that this pipeline is very good at scaling analysis if you have good infrastructure available. Second, because I want to build on top of the results of this project to make tutorials for differential gene expression analysis, co-expression network analysis, and exploratory data analysis. For the co-expression network analysis, we need to have at least 20 samples. For the rest, we could use only 6 (or more). It is around 118G

## Set the stage

After you have downloaded the raw reads, you should also download the transcriptome file for this species. I downloaded the latest transcriptome file of *M. endlicherianum* via:
```
wget https://mesotaenium.uni-goettingen.de/assets/Me1_v2.release.gff3.cdna.fasta
```
I also have to download the scripts and files of this repository to my machine. There are many ways to do that, but I like to use git as follows:
```
git clone https://github.com/dadrasarmin/rnaseq_quantification_kallisto_pipeline.git
```
As we can see these raw reads have `.fastq.gz` extension which is different from what we want `.fq.gz`. We can easily rename them via a command line this:
```
for file in *.fastq.gz; do mv -- "$file" "${file%.fastq.gz}.fq.gz"; done
```
Also, do not forget to activate your conda environment.

## Follow the protocol

I know the strandness of these samples, but let's say I am agnostic. Therefore, I should first perform the strandness check and then the quantification steps.

1. In my project folder, I create a folder called `strandness` and copy files of one sample (2 files) in that folder.
2. I move to the subfolder `rnaseq_quantification_kallisto_pipeline/strandness/` and create a copy of `Snakefile_PE` and name it `Snakefile`. Then, I modify the lines above the hashtags as mentioned in the tutorial and submit the job via Slurm (or run it locally).
3. Then, you should move to your project folder and checked the strandness for your reads. For this specific library it is: `reverse
4. Now, we have all information to perfrom quantification. So, just move to the repository folder and make a copy of the `Snakefile_PE` and call it `Snakefile`. Then, modify the content of it above the hashtags as mentioned before and submit the job via Slurm (or run it locally).
5. Now, you have quality control files, trimmed reads and quantification files.
