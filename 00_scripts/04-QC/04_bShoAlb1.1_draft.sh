#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-draft_busco.out-%N
#SBATCH -e slurm-draft_busco.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=busco

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/04-QC

eval "$(conda shell.bash hook)"

conda activate compleasm

compleasm run -a ../02-ASSEMBLY/bShoAlb1.1_draft.fasta -o ./00_bShoAlb1.1_draft -t 64 -l aves -L ./busco_lineages
date
 
exit 0
