#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 64
#SBATCH -t 48:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-map_for_purge.out-%N
#SBATCH -e slurm-map_for_purge.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=map_purge

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/06-PURGE-DUPS/

# minimap2 -t 64 -ax map-ont ../05-POLISHING/05_polca_iter3/bShoAlb1.1_polca_iter3.fasta ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz -o bShoAlb1.1_polca_iter3_unsorted.sam --secondary=no 

samtools view -bS bShoAlb1.1_polca_iter3_unsorted.sam | samtools sort - bShoAlb1.1_polca_iter3.bam -m 200G -@ 64
