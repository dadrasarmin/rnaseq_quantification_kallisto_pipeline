#!/bin/bash
#SBATCH -t 16:00:00
#SBATCH -c 2
#SBATCH --mem=10G
#SBATCH -o outfile-%J
#SBATCH -C scratch
#SBATCH -p medium
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=armin.dadras@uni-goettingen.de

# Please edit the email section! I do not want to receive emails for your jobs.

snakemake -p --software-deployment-method conda --executor slurm --profile profile/
