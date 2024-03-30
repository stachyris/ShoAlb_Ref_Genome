#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 48:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-rep-model.out-%N
#SBATCH -e slurm-rep-model.err-%N
#SBATCH --job-name=rep_model
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

mkdir -p tmpdir

singularity run -B /work,/project /project/brant/containers/RepeatModel-and-RepeatMask.sif \
RepeatModeler -pa 64 -database Sholicola_albiventris -LTRStruct

# exit the job
date
exit 0
