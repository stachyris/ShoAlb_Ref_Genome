#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 4:00:00
#SBATCH -p workq
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-%x-%j.out-%N
#SBATCH -e slurm-%x-%j.err-%N
#SBATCH --job-name=NCBI-fcs-adapter

date

### DO NOT EDIT BELOW ###
export FCSGS_SCRIPT=/home/brant/project/reference-databases/ncbi/fcs-adaptor/run_fcsadaptor.sh
export FCS_IMAGE=/home/brant/project/containers/fcs-adaptor_v0.5.0.sif
### DO NOT EDIT ABOVE ###

  
### EDIT BELOW FOR FASTA, NCBI TAX_ID, and OUTPUT DIRECTORY ###
export FASTA=bShoAlb1.1_draft.fasta
export OUT_DIR=bShoAlb1-adapter
### EDIT ABOVE FOR FASTA, NCBI TAX_ID, and OUTPUT DIRECTORY ###

# create the output directory, if not exists
mkdir -p ${OUT_DIR}

# run FCS_ADAPTOR w/ singularity container

${FCSGS_SCRIPT} \
--fasta-input ${FASTA} \
--output-dir ${OUT_DIR} \
--container-engine singularity \
--image ${FCS_IMAGE} \
--euk

date

exit 0
