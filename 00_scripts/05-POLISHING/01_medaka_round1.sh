#!/bin/bash
#SBATCH -N 1       
#SBATCH -n 2
#SBATCH -t 48:00:00
#SBATCH --mem=100000MB
#SBATCH -p single
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-medaka_round1.out-%N
#SBATCH -e slurm-medaka_round1.err-%N
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=medaka_r1

# below are job commands
 
date

cd /home/vkl1/work/bShoAlb/05-POLISHING

# mini_align -r ../02-ASSEMBLY/bShoAlb1.1_draft.fasta -i ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz  -t 64

medaka consensus ./reads.bam bShoAlb1.1_consensus.hdf --model dna_r10.4.1_e8.2_400bps_hac@v4.2.0:consensus --threads 2

medaka stitch ./bShoAlb1.1_consensus.hdf ../02-ASSEMBLY/bShoAlb1.1_draft.fasta ./bShoAlb1.1_medaka_r1.fasta --threads 2
exit 0
