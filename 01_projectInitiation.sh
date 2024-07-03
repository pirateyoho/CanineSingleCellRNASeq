#!/bin/bash
# Purpose: To initiate a project directory and subdirectories within a user's scratch directory on Alpine
# Initiate this script with "bash 01_projectInitiation.sh" from an Alpine shell.

##### INITIATE PROJECT DIRECTORY #####
cd /scratch/alpine/$USER
mkdir project_scrna_01

##### CREATE SUBDIRECTORIES #####
cd project_scrna_01
mkdir 01_input 02_scripts indexBuild