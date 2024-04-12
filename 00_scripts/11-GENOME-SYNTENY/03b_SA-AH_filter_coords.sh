#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-CA-filter.out-%N
#SBATCH -e slurm-CA-filter.err-%N
#SBATCH --job-name=nucmer-filter-CA
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date

cd /home/vkl1/work/bShoAlb/11-GENOME-SYNTENY

~/softs/bin/delta-filter -m -i 70 SHAL-CA.delta > SHAL-CA_filtered.delta

~/softs/bin/show-coords -l -q -T SHAL-CA_filtered.delta > SHAL-CA_filtered.coords

date

