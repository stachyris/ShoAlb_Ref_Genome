#!/bin/bash
#SBATCH -N 1             
#SBATCH -n 64
#SBATCH -t 20:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-ragtag.out-%N
#SBATCH -e slurm-ragtag.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/07c-PSUEDOMOLECULE

ragtag.py scaffold ../../ref-genomes/GCA_003957565.4_bTaeGut1.4.pri_genomic.fna bShoAlb1.1_scaffolded_ntL.fa -o ./ragtag -w -t 64

date

exit 0

