#!/bin/bash
#SBATCH -N 1              
#SBATCH -t 24:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-chopper.out-%N
#SBATCH -e slurm-chopper.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/00-RAW-DATA

gunzip -c ./SO_12538_WBS_adapt_trimmed.fastq.gz | chopper -q 7 -t 64 | gzip > ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz

date

exit 0

