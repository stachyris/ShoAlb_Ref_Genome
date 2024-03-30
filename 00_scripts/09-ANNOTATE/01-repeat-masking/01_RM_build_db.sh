#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-rM-build-db.out-%N
#SBATCH -e slurm-rM-build-db.err-%N
#SBATCH --job-name=build_db
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

singularity run -B /work,/project /project/brant/containers/RepeatModel-and-RepeatMask.sif \
BuildDatabase -name Sholicola_albiventris bShoAlb1.1.fasta


date

