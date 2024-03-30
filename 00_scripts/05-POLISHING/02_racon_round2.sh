#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-racon.out-%N
#SBATCH -e slurm-racon.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=racon

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/05-POLISHING

minimap2 -t 64 -x ava-ont ./01_medaka/bShoAlb1.1_medaka_r1.fasta ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz > ./02_racon/bShoAlb1.1_racon_map.paf

racon -t 64 ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz ./02_racon/bShoAlb1.1_racon_map.paf ./01_medaka/bShoAlb1.1_medaka_r1.fasta
