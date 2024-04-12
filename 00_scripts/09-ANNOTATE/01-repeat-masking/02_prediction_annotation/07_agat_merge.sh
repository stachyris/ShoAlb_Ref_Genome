#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-agat_merge-%j.out-%N
#SBATCH -e slurm-agat_merge-%j.err-%N
#SBATCH --job-name=agat_merge
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date
cd /home/vkl1/work/bShoAlb/09-ANNOTATE/02_gene_prediction

singularity run -B /work,/project /project/brant/containers/agat_1.0.0.sif agat_sp_manage_functional_annotation.pl -f ./braker/braker.gff -i ./braker/braker-star-removed.aa.fasta.tsv --output braker_iprscan_merged_agat.gff
date
