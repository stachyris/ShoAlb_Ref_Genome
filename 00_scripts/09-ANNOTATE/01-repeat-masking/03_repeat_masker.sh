#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-rep-masker.out-%N
#SBATCH -e slurm-rep-masker.err-%N
#SBATCH --job-name=rep_masker
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

singularity run -B /work,/project /project/brant/containers/RepeatModel-and-RepeatMask.sif \
RepeatMasker -gff -xsmall -pa 64 -lib Sholicola_albiventris-families.fa bShoAlb1.1.fasta

date
