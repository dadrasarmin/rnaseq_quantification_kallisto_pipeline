#!/bin/bash
#SBATCH -t 16:00:00
#SBATCH -c 2
#SBATCH --mem-per-cpu=3G
#SBATCH -o outfile-%J
#SBATCH -C scratch
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=USERNAME@domain.com

# Please edit the email section! I do not want to receive emails for your jobs.

snakemake -j 100 -p --software-deployment-method conda --executor cluster-generic --cluster-generic-submit-cmd "sbatch" --profile profile/
