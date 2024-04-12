#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 12:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-eggnog.out-%N
#SBATCH -e slurm-eggnog.err-%N
#SBATCH --job-name=ShoAlb_eggnog
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL

date
eval "$(conda shell.bash hook)"
conda activate eggnog-mapper

emapper.py --dbmem --cpu 64 -i ./braker/braker-star-removed.aa --output_dir eggnog -o Sholicola_albiventris --data_dir /home/vkl1/project/reference-databases/eggnog-data --decorate_gff ./braker/braker.gff

date

