#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-nucmer-SA-GG.out-%N
#SBATCH -e slurm-nucmer-SA-GG.err-%N
#SBATCH --job-name=nucmer_Chicken
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date

cd /home/vkl1/work/bShoAlb/11-GENOME-SYNTENY

~/softs/bin/nucmer -t 64 -p SHAL-GG GCA_016699485.1_bGalGal1.mat.broiler.GRCg7b_genomic.fna bShoAlb1.1.fasta

date

