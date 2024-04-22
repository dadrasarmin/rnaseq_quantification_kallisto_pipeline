#!/bin/bash
#SBATCH -t 16:00:00
#SBATCH -c 2
#SBATCH --mem-per-cpu=3G
#SBATCH -o outfile-%J
#SBATCH -C scratch
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=USERNAME@domain.com

# Please edit the email section! I do not want to receive emails for your jobs.

SLURM_ARGS="-p {cluster.partition} -N {cluster.nodes} -n {cluster.ntasks} -c {cluster.ncpus} -t {cluster.time} -J {cluster.job-name} -o {cluster.output} -e {cluster.error} --mem={cluster.memory} -C {cluster.node_properties}"

snakemake -j 100 -pr --software-deployment-method conda --cluster-config cluster.yaml --cluster "sbatch $SLURM_ARGS"
