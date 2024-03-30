#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-haplotigs_cov.out-%N
#SBATCH -e slurm-haplotigs_cov.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=haplotigs_cov

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/06-PURGE-DUPS/

eval "$(conda shell.bash hook)"
conda activate purge_haplotigs

purge_haplotigs cov -i bShoAlb1.1_polca_iter3.bam.200.gencov -l 5 -m 50 -h 160
