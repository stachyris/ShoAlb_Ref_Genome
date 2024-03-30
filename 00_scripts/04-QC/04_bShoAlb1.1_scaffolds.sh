#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 01:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-scaffolds_busco.out-%N
#SBATCH -e slurm-scaffolds_busco.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=busco-scaffolds

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/04-QC

eval "$(conda shell.bash hook)"

conda activate compleasm

compleasm run -a ../07b-SCAFFOLDING/bShoAlb1.1_scaffolded_ntL.fa -o ./07_bShoAlb1.1_scaffolds -t 64 -l aves -L ./busco_lineages

date

