#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-hap-purged_busco.out-%N
#SBATCH -e slurm-hap-purged_busco.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=busco-hap-purged

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/04-QC

eval "$(conda shell.bash hook)"

conda activate compleasm

compleasm run -a ../06-PURGE-DUPS/bShoAlb1.1_hap_purged.fasta -o ./06_bShoAlb1.1_hap_purged -t 64 -l aves -L ./busco_lineages
date
 
exit 0
