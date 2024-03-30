#!/bin/bash
#SBATCH -N 1              
#SBATCH -t 24:00:00	        
#SBATCH -p bigmem
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-porechop.out-%N
#SBATCH -e slurm-porechop.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

# below are job commands
 
date

porechop -i SO_12538_WBS_Sample2.fastq.gz -o SO_12538_WBS_adapt_trimmed.fastq.gz --threads 64

date

exit 0

