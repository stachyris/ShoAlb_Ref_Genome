#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-agat_stats-%j.out-%N
#SBATCH -e slurm-agat_stats-%j.err-%N
#SBATCH --job-name=agat_stats
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date
cd /home/vkl1/work/bShoAlb/09-ANNOTATE/02_gene_prediction

# basic stats

singularity run -B /work,/project /project/brant/containers/agat_1.0.0.sif agat_sp_statistics.pl --gff ./braker_iprscan_merged_agat/braker_iprscan_merged.gff -o ./braker_iprscan_merged_agat/stats_braker_iprscan_merged.txt -g 1083211333 -d

# functional_stats
singularity run -B /work,/project /project/brant/containers/agat_1.0.0.sif agat_sp_functional_statistics.pl --gff ./braker_iprscan_merged_agat/braker_iprscan_merged.gff -o ./braker_iprscan_merged_agat/functional_stats_braker_iprscan_merged.txt -g 1083211333
date
