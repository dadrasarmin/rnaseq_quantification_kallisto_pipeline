#!/bin/bash
#SBATCH -t 04:00:00
#SBATCH -c 2
#SBATCH --mem-per-cpu=3G
#SBATCH -o outfile-%J
# #SBATCH -C scratch # This is a system specific parameter for my machine. Add or remove SBATCH commands as you need.
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=USERNAME@DOMAIN.COM # Put your email address here

# The line below reads the specifications from the cluster.yaml file.
SLURM_ARGS="-p {cluster.partition} -N {cluster.nodes} -n {cluster.ntasks} -c {cluster.ncpus} -t {cluster.time} -J {cluster.job-name} -o {cluster.output} -e {cluster.error} --mem={cluster.memory} -C {cluster.node_properties}"
# This file execute the snakefile. -j specify the maximum number of jobs to be executed at the same time if there are resources available. Tune it according to your needs.
snakemake -j 100 --use-conda --cluster-config cluster.yaml --cluster "sbatch $SLURM_ARGS"
