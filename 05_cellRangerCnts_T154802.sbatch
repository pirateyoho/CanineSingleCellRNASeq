#!/usr/bin/env bash


#SBATCH --account=csu84_alpine1
#SBATCH --job-name=cellrngr_cnt
#SBATCH --nodes=1        # this script is designed to run on one node
#SBATCH --ntasks=48
#SBATCH --time=48:00:00
#SBATCH --partition=amilan  # modify this to reflect which queue you want to use. Either 'amilan' or 'atesting'
#SBATCH --qos=long      # modify this to reflect which queue you want to use. Options are 'normal' and 'testing'
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT    # Keep these two lines of code if you want an e-mail sent to you when it is complete.
#SBATCH --mail-user=edlarsen@colostate.edu ### change to your email ###
#SBATCH --output=log_cellrngr_cnt_T154802_%j.txt  #modify as desired - will output a log file where the "%A" inserts the job ID number and the %a

# Record sample name
echo T154802

### Load cellranger
module purge
module load cellranger/7.1.0
cellranger --version

cellranger count --id=T154802 \
                 --fastqs=/scratch/alpine/edlarsen@colostate.edu/project_scrna_01/01_input \
                 --sample=T154802_CKDL220009557-1a-SI_TT_E2_HN37JDSX3 \
                 --transcriptome=/scratch/alpine/$USER/project_scrna_01/indexBuild/canfam31 \
                 --expect-cells=5000