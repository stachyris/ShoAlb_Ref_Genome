#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-nucmer-TG.out-%N
#SBATCH -e slurm-nucmer-TG.err-%N
#SBATCH --job-name=nucmer-TG
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date

cd /home/vkl1/work/bShoAlb/11-GENOME-SYNTENY

~/softs/bin/nucmer -t 64 -p SHAL-TG GCA_003957565.4_bTaeGut1.4.pri_genomic.fasta bShoAlb1.1.fasta

date

