#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-ntLink-rounds.out-%N
#SBATCH -e slurm-ntLink-rounds.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=ntLink-rounds

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/07b-SCAFFOLDING/

ntLink_rounds run_rounds_gaps target=bShoAlb1.1_hap_purged.fasta reads=SO_12538_WBS_quality_filtered.fastq.gz k=32 w=250 t=64 overlap=True rounds=5
