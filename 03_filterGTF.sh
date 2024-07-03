#!/bin/bash
# Purpose: To filter a GTF file to keep only biotypes of interest
# Initiate this script with "bash 03_filterGTF.sh > filterGTF.log 2>&1 &" from an Alpine shell. The "&" on the end makes the job run in the background; can check progess with "jobs -l"

##### FILTER GTF FILE #####
#load cellranger
module load cellranger
cellranger --version

#run `grep -oP 'gene_biotype \K\S+' *.gtf | cut -d"\"" -f2 | sort -u` on the .gtf file to determine what the options are for the filtering step
cmd1="cellranger mkgtf Canis_lupus_familiaris.CanFam3.1.104.gtf Canis_lupus_familiaris.CanFam3.1.104_FILTERED.gtf \
                   --attribute=gene_biotype:protein_coding \
                   --attribute=gene_biotype:IG_C_gene \
                   --attribute=gene_biotype:IG_V_gene \
                   --attribute=gene_biotype:TR_C_gene \
                   --attribute=gene_biotype:TR_J_gene \
                   --attribute=gene_biotype:TR_V_gene"
                   
echo $cmd1
    
echo -e "\t$ ${cmd1}"
time eval $cmd1
