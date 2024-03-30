#!/bin/bash
#SBATCH -N 1              
#SBATCH -n 64
#SBATCH -t 24:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-meryl.out-%N
#SBATCH -e slurm-meryl.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/01-CLEAN-READS

~/softs/meryl-1.4.1/bin/meryl count k=21 ./SO_12538_WBS_quality_filtered.fastq.gz output ./WBS.meryl threads=64

~/softs/meryl-1.4.1/bin/meryl histogram ./WBS.meryl > WBS.histo threads=64

date

exit 0

