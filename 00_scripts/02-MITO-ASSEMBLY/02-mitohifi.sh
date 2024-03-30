#!/bin/bash
#SBATCH -N 1
#SBATCH -n 24
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-%x-%j.out-%N
#SBATCH -e slurm-%x-%j.err-%N
#SBATCH --job-name=ShoAlb-mitohifi

date

cd /home/vkl1/work/bShoAlb/02-MITO-ASSEMBLY

singularity run -B /work,/project /project/brant/containers/mitohifi-v3.2.1.sif \
mitohifi.py -r ../01-CLEAN-READS/SO_12538_WBS_quality_filtered.fastq.gz -f ./NC_058320.1.fasta -g ./NC_058320.1.gb -t 24 -o 2

date
