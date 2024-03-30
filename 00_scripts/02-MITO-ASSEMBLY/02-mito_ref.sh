#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 01:00:00
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-mito-ref-%j.out-%N
#SBATCH -e slurm-mito-ref-%j.err-%N
#SBATCH --job-name=mito-ref
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

singularity run -B /work,/project/ /project/brant/containers/mitohifi_v3.0.0.sif \
findMitoReference.py --species "Sholicola albiventris" --outfolder ./ --min_length 14000
