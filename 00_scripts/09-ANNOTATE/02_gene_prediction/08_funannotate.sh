#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -A hpc_biol78002
#SBATCH -o slurm-funannotate-%j.out-%N
#SBATCH -e slurm-funannotate-%j.err-%N
#SBATCH --job-name=funannotate
#SBATCH --mail-user=vkl1@lsu.edu
#SBATCH --mail-type=ALL


date
cd /home/vkl1/work/bShoAlb/09-ANNOTATE/02_gene_prediction

singularity exec -B /work,/project /project/brant/containers/funannotate.sif funannotate annotate --fasta ../01_repeat_masking/bShoAlb1.1.fasta.masked --gff ./braker/braker_agat_cleaned_sanitized.gff --iprscan ./iprscan_output/braker-star-removed.aa.xml --out funannotate --species "Sholicola albiventris" --eggnog ./eggnog/Sholicola_albiventris.emapper.annotations --busco_db aves -d /project/brant/reference-databases/funannotate/ --cpus 64 

date
