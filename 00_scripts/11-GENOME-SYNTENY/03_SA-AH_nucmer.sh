#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-nucmer-SA-CA.out-%N
#SBATCH -e slurm-nucmer-SA-CA.err-%N
#SBATCH --job-name=nucmer_AH
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date

cd /home/vkl1/work/bShoAlb/11-GENOME-SYNTENY

~/softs/bin/nucmer -t 64 -p SHAL-CA GCF_003957555.1_bCalAnn1_v1.p_genomic.fna bShoAlb1.1.fasta

date

