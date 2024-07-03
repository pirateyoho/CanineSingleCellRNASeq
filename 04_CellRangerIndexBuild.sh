#!/usr/bin/env bash
# Purpose: To build a reference genome index for use with Cell Ranger
# Submit this script as a batch job to the Slurm scheduler with "sbatch 04_CellRangerIndexBuild.sh" in an Alpine shell.
###### THIS SCRIPT SHOULD BE RUN IN THE indexBuild DIRECTORY CONTAINING THE REFERENCE GENOME FASTA AND GTF FILES ######

#SBATCH --account=csu84_alpine1  
#SBATCH --job-name=cellranger_mkref
#SBATCH --nodes=1 # this script is designed to run on one node
#SBATCH --ntasks=6
#SBATCH --time=01:00:00   # set time; default = 4 hours; 0 = no restriction
#SBATCH --partition=amilan # Alpine's general compute node
#SBATCH --qos=normal      # modify this to reflect which queue you want to use. Options are 'normal','testing','long'
#SBATCH --mail-type=BEGIN,FAIL,END,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu ### change to your email address ###
#SBATCH --output=log_cellrngr_mkref_%j.txt  # this will capture all output in a logfile with %j as the job #

###### PREPARE ENVRIONMENT ######
#clear the node of preloaded software and load cellranger
module purge
module load cellranger
cellranger --version

###### MAKE REFERENCE GENOME INDEX ######
### NOTE: ###
# --genome is desired output directory name
# --fasta is the path to whole genome fasta file
# --genes is a link to the .gtf file
# --memgb can be used to specify RAM; optional, but can be useful for optimization of each genome

cellranger mkref --genome=canfam31 \
                 --fasta=Canis_lupus_familiaris.CanFam3.1.dna.toplevel.fa \
                 --genes=Canis_lupus_familiaris.CanFam3.1.104_FILTERED.gtf