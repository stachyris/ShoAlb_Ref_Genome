#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-polca_r5_busco.out-%N
#SBATCH -e slurm-polca_r5_busco.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=busco

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/04-QC

eval "$(conda shell.bash hook)"

conda activate compleasm

compleasm run -a ../05-POLISHING/05_polca_iter3/bShoAlb1.1_polca_iter3.fasta -o ./05_bShoAlb1.1_polca_iter3 -t 64 -l aves -L ./busco_lineages
date
 
exit 0
