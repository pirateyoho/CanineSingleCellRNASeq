#!/bin/bash
# To loop through fastq files and submit a separate job to the Slurm scheduler to run cellranger count for each.
# Submit this script as a batch job to the Slurm scheduler with "sbatch 05_sbatchLoop_cellrngr_cnts.sh" in an Alpine shell.
###### THIS SCRIPT SHOULD BE RUN IN THE 02_scripts DIRECTORY ######

#SBATCH --job-name=LoopJobs
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=1:00:00
#SBATCH --output=log_LoopJobs_cellrngrcnt_%J.txt
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --mail-user=edlarsen@colostate.edu

## extract sample ID from fastq filename prefix; according to the Cell Ranger documentation, characters before "_S" in the filename are considered the filename prefix and should be assigned to the sampleIDs vector
sampleIDs=$(ls ../01_input | awk -F "_S" '{print $1}' | sort --unique)

# Loop through all samples and submit a cellranger counts job for each
for sampleID in $sampleIDs
do
echo ${sampleID}
sbatch 05_cellrngr_cnts.sh ${sampleID}
done
