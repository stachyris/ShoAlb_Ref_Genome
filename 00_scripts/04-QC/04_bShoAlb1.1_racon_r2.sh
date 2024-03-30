#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-racon_r2_busco.out-%N
#SBATCH -e slurm-racon_r2_busco.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=busco

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/04-QC

eval "$(conda shell.bash hook)"

conda activate compleasm

compleasm run -a ../05-POLISHING/02_racon/bShoAlb1.1_racon_02.fasta -o ./02_bShoAlb1.1_racon_r2 -t 64 -l aves -L ./busco_lineages
date
 
exit 0
