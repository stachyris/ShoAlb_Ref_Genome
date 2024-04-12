#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-GG-filter.out-%N
#SBATCH -e slurm-GG-filter.err-%N
#SBATCH --job-name=nucmer-filter-GG
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date

cd /home/vkl1/work/bShoAlb/11-GENOME-SYNTENY

~/softs/bin/delta-filter -m -i 70 SHAL-GG.delta > SHAL-GG_filtered.delta

~/softs/bin/show-coords -l -q -T SHAL-GG_filtered.delta > SHAL-GG_filtered.coords

date

