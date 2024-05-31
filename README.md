# *Sholicola albiventris* Reference Genome

## Overview
This repo contains scripts and pipeline for the Reference genome assembly for the Whie-bellied Sholakili *Sholicola albiventris*, an endemic vulnerable species from the Western Ghats of India. Assembly has numerous steps and each of them are numbered and can be found in respective subdirectories. 

## Repo Structure

- **00_scripts** : All scripts used in the manuscript with subdirectories of each process. 

    - **00-RAW_DATA** : Contains QC and adapter trimming scripts.

    - **01-CLEAN-READS** : K-mer count and assembly size estimation using meryl. 

    - **02-ASSEMBLY** : Script for draft assembly using Flye. 

    - **02-MITO-ASSEMBLY** : Contains scripts for identifying closest sister species mitogenome and de-novo assembly of mito genome. 

    - **00-NCBI** : Screening for adapter and alien species contamination using NCBI-FCS suit. 

    - **04-QC** : Compleasm scripts for genome completeness assesment after each step of assembly, polishing and scaffolding. 

    - **05-POLISHING** : Five rounds of polishing scripts of two types of reads and three different tools. 

    - **06-PURGE-DUPS** : Scripts for removing any redundant haplotypes. 

    - **07b-SCAFFOLDING** : Minimizer map based assembly scaffolding using long reads. 

    - **07c-PSUEDOMOLECULE** : Reference assisted assembly scaffolding to generate psuedomolecule/psuedochromosomes using Zebra Finch reference genome. 

    - **08-FINAL** : Custom python scripts to rename the scaffolds of nuclear  and mitogenome assemblies. 

    - **09-ANNOTATE** 
        -  **01_repeat_masking** : Scripts to build species specific repeat libray and soft masking the genome using RepeatMasker. 
        
        - **02_gene_prediction** : ab inito gene prediction and annotation based on the multiple gene annotations tools. 

    - **10-UCEs** : Scripts to isolate Ultra Conserved Elements as a measure of QC for genome completeness following Phyluce Tutorial III. 

    - **11-GENOME-SYNTENY** : Genome-genome alignment using Nucmer module and visulization of the scaffold synteny using R. 



- **01_Figures** : contains the final figures as displayed in the manuscript. ``Figure_{i}.jpg`` are main text figures and ``Figure_S{i}.png`` are supplemental figures. 

- **bShoAlb1.1_Pipeline_Flowchart.pdf** : contains the step by step flowchart depicting the process of assembly and sub-sequent analysis. 


## Data Availability

This Whole Genome Shotgun project has been deposited at GenBank under the accession ``JBDGPF000000000``. The version described in this paper is version ``JBDGPF010000000``.  Raw reads with accession numbers ``SRR28564530`` and ``SRR28558515`` under the BioProject ``PRJNA1096119`` are available from NCBI. Additional supporting data are available from the [Open Science Framework](https://osf.io/m95q7/?view_only=ff65bfb8cbd94e808b6406c818bbf963)


## Attribution

To cite the publication:

## Contact information

Please contact the following in case of interest.

Vinay K L [vkl1@lsu.edu](mailto:vkl1@lsu.edu)  
PhD student, Louisiana State University