#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 01:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-final_busco.out-%N
#SBATCH -e slurm-final_busco.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=busco-final

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/04-QC

eval "$(conda shell.bash hook)"

conda activate compleasm

compleasm run -a ../08-FINAL/bShoAlb1.1.fasta -o ./08_bShoAlb1.1_final -t 64 -l aves -L ./busco_lineages

date
