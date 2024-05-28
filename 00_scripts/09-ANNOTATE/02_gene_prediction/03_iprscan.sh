#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 12:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-iprscan.out-%N
#SBATCH -e slurm-iprscan.err-%N
#SBATCH --job-name=ShoAlb_iprscan
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

/home/vkl1/project/mike-home/bin/interproscan-5.66-98.0/interproscan.sh \
--cpu 64 \
--input ./braker/braker-star-removed.aa

date

