#!/bin/bash
#SBATCH -N 1              
#SBATCH -t 24:00:00	        
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-trimmomatic.out-%N
#SBATCH -e slurm-trimmomatic.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

# below are job commands
 

date

cd /home/vkl1/work/bShoAlb/00-RAW-DATA-ILLUMINA

java -jar /home/vkl1/softs/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 -threads 16 -trimlog ShoAlb_trim.log -summary ShoAlb_summary.txt 40107403260-L001_R1_001.fastq-001.gz 40107403260-L001_R2_001.fastq-002.gz WBS_R1.fq.gz WBS_R1_unpaired.fq.gz WBS_R2.fq.gz WBS_unpaired.fq.gz ILLUMINACLIP:/home/vkl1/softs/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
date

exit 0

