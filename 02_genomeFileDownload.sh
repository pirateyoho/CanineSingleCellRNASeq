#!/bin/bash
# Purpose: To obtain reference genome FASTA and GTF files from Ensembl
# Initiate this script with "bash 02_genomeFileDownload.sh > genomeDownload.log 2>&1 &" from an Alpine shell. The "&" on the end makes the job run in the background; can check progess with "jobs -l"
# This script can be run from any directory

##### NAVIGATE INTO indexBuild DIRECTORY #####
cd /scratch/alpine/$USER/project_scrna_01/indexBuild


##### DOWNLOAD FASTA FILE #####
rsync -azvP rsync://ftp.ensembl.org/ensembl/pub/release-104/fasta/canis_lupus_familiaris/dna/Canis_lupus_familiaris.CanFam3.1.dna.toplevel.fa.gz .

# Check md5sum of FASTA file
rsync -avzP rsync://ftp.ensembl.org/ensembl/pub/release-104/fasta/canis_lupus_familiaris/dna/CHECKSUMS .
grep ".dna.toplevel" CHECKSUMS
sum Canis_lupus_familiaris.CanFam3.1.dna.toplevel.fa.gz

# extract compressed FASTA file
gunzip Canis_lupus_familiaris.CanFam3.1.dna.toplevel.fa.gz


##### DOWNLOAD GTF FILE #####
rsync -avzP rsync://ftp.ensembl.org/ensembl/pub/release-104/gtf/canis_lupus_familiaris/Canis_lupus_familiaris.CanFam3.1.104.gtf.gz  .

## Check md5sum of GTF file
# Acquire sums file from Ensembl
rsync -avzP rsync://ftp.ensembl.org/ensembl/pub/release-104/gtf/canis_lupus_familiaris/CHECKSUMS  .
grep ".104.gtf.gz" CHECKSUMS
# Check sum of downloaded file
sum Canis_lupus_familiaris.CanFam3.1.104.gtf.gz

# extract compressed GTF file
gunzip Canis_lupus_familiaris.CanFam3.1.104.gtf.gz
