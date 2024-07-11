#!/usr/bin/env bash
# Purpose: To run cellranger count on single-cell RNAseq fastq files
###### IMPORTANT: ***sbatchLoop_cellrngr_cnts.sh*** MUST be run *FIRST* as this script is designed to receive input from that script. If you want to run this script on only one sample, then execute it in the command line with 'sbatch 05_cellrngr_cnts.sh SampleID', replacing "SampleID" with the fastq filename prefix (all characters before the "_S") ######
###### This script should exist in the 02_scripts directory ######

#SBATCH --account=csu84_alpine1
#SBATCH --job-name=cellrngr_cnt
#SBATCH --nodes=1         # this script is designed to run on one node
#SBATCH --ntasks=64       # modify this number to reflect how many cores you want to use (up to 64)
#SBATCH --mem=200GB
#SBATCH --time=24:00:00   # set time; default = 4 hours
#SBATCH --partition=amilan  # modify this to reflect which queue you want to use. Either 'amilan' or 'atesting'
#SBATCH --qos=normal      # modify this to reflect which queue you want to use. Options are 'normal' and 'testing'
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT   # Keep these two lines of code if you want an e-mail sent to you when it is complete.
#SBATCH --mail-user=edlarsen@colostate.edu ### change to your email ###
#SBATCH --output=log_cellrngr_cnt_%j.txt  #modify as desired - will output a log file where the "%j" inserts the job ID number


##### SET ENVIRONMENT #####

### Load cellranger
module purge
module load cellranger
cellranger --version

##### DEFINE VARIABLES #####

## Assign sampleName variable to first argument passed to script
sampleName=${1}
echo $sampleName

## specify path to 10x compatible reference genome index
ref_pwd=/scratch/alpine/$USER/project_scrna_01/indexBuild/canfam31


##### BEGIN CODE #####

### Excute cellranger count
## 'id' is a unique run id and output folder name. 'fastqs' is the path to the directory containing the fastq files. 'sample' is the prefix of fastq filenames to select. 'transcriptome' is the path of folder containig 10x-compatible transcriptome reference.

cellranger count --id=run_count_${sampleName} \
                       --fastqs=../01_input \
                       --sample=${sampleName} \
                       --transcriptome=${ref_pwd} \
                       --expect-cells=5000

##### END CODE #####
