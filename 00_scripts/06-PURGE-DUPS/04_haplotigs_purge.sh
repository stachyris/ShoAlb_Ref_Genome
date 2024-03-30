#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-haplotigs_purge.out-%N
#SBATCH -e slurm-haplotigs_purge.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=haplotigs_purge

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/06-PURGE-DUPS/

eval "$(conda shell.bash hook)"
conda activate purge_haplotigs

purge_haplotigs purge -g ../05-POLISHING/05_polca_iter3/bShoAlb1.1_polca_iter3.fasta -c coverage_stats.csv -t 64 -o bShoAlb1.1_hap_purged.fasta
