#!/bin/bash
#SBATCH -N 1
#SBATCH -n 48
#SBATCH -t 72:00:00
#SBATCH -p single
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-gfftk-sanitize.out-%N
#SBATCH -e slurm-gfftk-sanitize.err-%N
#SBATCH --job-name=sanitize
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

gfftk sanitize --fasta ../01_repeat_masking/bShoAlb1.1.fasta.masked --gff3 ./braker/braker_agat_cleaned.gff --out ./braker/braker_agat_cleaned_sanitized.gff

date

