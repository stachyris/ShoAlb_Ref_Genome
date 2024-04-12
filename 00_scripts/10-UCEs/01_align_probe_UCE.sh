#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 01:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-probe_search.out-%N
#SBATCH -e slurm-probe_search.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=uce_probe_search

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/10-UCEs

eval "$(conda shell.bash hook)"

conda activate phyluce-1.7.3

phyluce_probe_run_multiple_lastzs_sqlite \
--db ShoAlb.sqlite \
--output ShoAlb-genome-lastz \
--scaffoldlist ShoAlb \
--genome-base-path ./ \
--probefile uce-5k-probes.fasta \
--cores 64

date
 
exit 0
