#!/bin/bash
#SBATCH -N 1
#SBATCH -n 48
#SBATCH -t 72:00:00
#SBATCH -p single
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-braker.out-%N
#SBATCH -e slurm-braker.err-%N
#SBATCH --job-name=ShoAlb_braker
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date

singularity run -B /work,/project /project/brant/containers/braker_v3.0.3.sif braker.pl \
--species=Sholicola_albiventris \
--genome=bShoAlb1.1.fasta.masked \
--prot_seq=Vertebrata.fa \
--threads=48

date

