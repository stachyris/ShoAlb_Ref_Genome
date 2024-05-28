#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 01:00:00
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-breaker-agat_clean-%j.out-%N
#SBATCH -e slurm-breaker-agat_clean-%j.err-%N
#SBATCH --job-name=agat_clean
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date
cd /home/vkl1/work/bShoAlb/09-ANNOTATE/02_gene_prediction

singularity run -B /work,/project /project/brant/containers/agat_1.0.0.sif agat_convert_sp_gxf2gxf.pl --gff ./braker/braker.gtf -o ./braker/braker_agat_cleaned.gff

