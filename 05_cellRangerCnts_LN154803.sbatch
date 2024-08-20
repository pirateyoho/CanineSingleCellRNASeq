#!/usr/bin/env bash


#SBATCH --account=csu84_alpine1
#SBATCH --job-name=cellrngr_cnt
#SBATCH --nodes=1        # this script is designed to run on one node
#SBATCH --ntasks=48
#SBATCH --time=23:05:00
#SBATCH --partition=amilan  # modify this to reflect which queue you want to use. Either 'amilan' or 'atesting'
#SBATCH --qos=normal      # modify this to reflect which queue you want to use. Options are 'normal' and 'testing'
#SBATCH --mail-type=END   # Keep these two lines of code if you want an e-mail sent to you when it is complete.
#SBATCH --mail-user=edlarsen@colostate.edu ### change to your email ###
#SBATCH --output=log_cellrngr_cnt_%j.txt  #modify as desired - will output a log file where the "%A" inserts the job ID number and the %a

# Record sample name
echo LN154803

### Load cellranger
module purge
module load cellranger/7.1.0
cellranger --version

cellranger count --id=LN154803 \
                 --fastqs=/scratch/alpine/edlarsen@colostate.edu/project_scrna_01/01_input \
                 --sample=LN154803_CKDL220009556-1a-SI_TT_E1_HN37JDSX3 \
                 --transcriptome=/scratch/alpine/$USER/project_scrna_01/indexBuild/canfam31 \
                 --expect-cells=5000