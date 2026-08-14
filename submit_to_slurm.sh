#!/bin/bash
#SBATCH -t 16:00:00
#SBATCH -c 2
#SBATCH --mem=10G
#SBATCH -o outfile-%J
#SBATCH -p scc-cpu
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=yourmail@uni-goettingen.de

source ~/.bashrc
conda activate snakemake

snakemake -p --software-deployment-method conda --executor slurm --profile profile/ --scheduler greedy
