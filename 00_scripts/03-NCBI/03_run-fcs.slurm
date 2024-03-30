#!/bin/bash
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -t 6:00:00
#SBATCH -p bigmem
#SBATCH -A hpc_allbirds08
#SBATCH -o slurm-%x-%j.out-%N
#SBATCH -e slurm-%x-%j.err-%N
#SBATCH --job-name=NCBI-fcs-vinay

date

### EDIT BELOW FOR FASTA, NCBI TAX_ID, and OUTPUT DIRECTORY ###
export FASTA=bShoAlb1.1_draft.fasta
export TAX_ID=958669
export OUT_DIR=bShoAlb1-FCS
### EDIT ABOVE FOR FASTA, NCBI TAX_ID, and OUTPUT DIRECTORY ###

### DO NOT EDIT BELOW ###
export SHM_LOC=/dev/shm/gxdb
mkdir -p "${SHM_LOC}"
export LOCAL_DB=/home/brant/project/reference-databases/ncbi/fcs-gx/gxdb
export FCSGS_SCRIPT=/home/brant/project/reference-databases/ncbi/fcs-gx/fcs.py
export IMAGE=/project/brant/containers/fcs-gx_v0.5.0.sif
# The program seems to take 48 cores, max:
echo "GX_NUM_CORES=48" > env.txt
### DO NOT EDIT ABOVE ###

# create the output directory, if not exists
mkdir -p ${OUT_DIR}

# load the db into /dev/shm/gxdb
echo "Loading database - this will take a while..."
python3 ${FCSGS_SCRIPT} --image ${IMAGE} db get --mft $LOCAL_DB/all.manifest --dir ${SHM_LOC}

# now, run the script - if there is > 1 genome to screen, it will be faster to 
# include that genome here to take advantage of the file in memory:
echo "Running search, this should take just a few minutes..."
python3 ${FCSGS_SCRIPT} --image ${IMAGE} --env-file env.txt screen genome --fasta ${FASTA} --out-dir ${OUT_DIR} --gx-db ${SHM_LOC} --tax-id ${TAX_ID}

date
exit 0
