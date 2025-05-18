#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_bfstart_10
#SBATCH -o slurm-%x-%j.out-%N
#SBATCH -e slurm-%x-%j.err-%N
#SBATCH --job-name=gstacks

nucmer -p Ficedula-TG ../../Zebra_Finch_Genome/GCF_003957565.2_bTaeGut1.4.pri_genomic.fna bShoAlb-Ficedula-scaffolded.fasta -t 64
