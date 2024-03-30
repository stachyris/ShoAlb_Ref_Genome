#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-polca_iter1.out-%N
#SBATCH -e slurm-polca_iter1.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=polca_iter1

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/05-POLISHING

polca.sh -a ./02_racon/bShoAlb1.1_racon_02.fasta -r '../01-CLEAN-READS/WBS_R1.fastq ../01-CLEAN-READS/WBS_R2.fastq' -t 64 -m 200G
