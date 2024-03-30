#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-polca_iter3.out-%N
#SBATCH -e slurm-polca_iter3.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=polca_iter3

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/05-POLISHING/05_polca_iter3

polca.sh -a ../04_polca_iter2/bShoAlb1.1_polca_iter2.fasta -r '../../01-CLEAN-READS/WBS_R1.fastq ../../01-CLEAN-READS/WBS_R2.fastq' -t 64 -m 200G
