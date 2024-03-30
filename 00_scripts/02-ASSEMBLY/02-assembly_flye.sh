#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 48:00:00
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-flye-%j.out-%N
#SBATCH -e slurm-flye-%j.err-%N
#SBATCH --job-name=flye_asm
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

cd /home/vkl1/work/bShoAlb/02-ASSEMBLY

flye --nano-hq ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz --out-dir ./ --threads 64 --genome-size 1.16g --asm-coverage 40
