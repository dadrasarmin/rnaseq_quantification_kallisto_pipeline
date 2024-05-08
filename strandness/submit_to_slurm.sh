#!/bin/bash
#SBATCH -t 04:00:00
#SBATCH -c 2
#SBATCH --mem-per-cpu=3G
#SBATCH -o outfile-%J
# #SBATCH -C scratch # This is a system specific parameter for my machine. Add or remove SBATCH commands as you need.
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=username@domain.com # Put your email address here

# This file execute the snakefile. -j specify the maximum number of jobs to be executed at the same time if there are resources available. Tune it according to your needs.
snakemake -j 100 --software-deployment-method conda --executor cluster-generic --cluster-generic-submit-cmd "sbatch" --profile profile/
