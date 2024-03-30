#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-haplotigs_hist.out-%N
#SBATCH -e slurm-haplotigs_hist.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=haplotigs_hist

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/06-PURGE-DUPS/

eval "$(conda shell.bash hook)"
conda activate purge_haplotigs

purge_haplotigs hist -b ./bShoAlb1.1_polca_iter3.bam -g ../05-POLISHING/05_polca_iter3/bShoAlb1.1_polca_iter3.fasta -t 64
