# CanineSingleCellRNASeq
## Background
This repository contains scripts that were used for a canine single-cell RNA-sequencing pipeline using Cell Ranger. This repository is intended for internal use by members of the Clinical Hematopathology Laboratory at Colorado State University and their collaborators. Scripts are numbered in the order they were run.
## Acknowledgements
Many of these scripts were modified from those provided in [this repository](https://github.com/dyammons/scrna-seq), authored by Dr. Dylan Ammos. This repository was created for the purpose of documenting the final versions of these scripts as they were modified to fit this project.
## Raw data
This pipeline utilized raw single-cell RNA-sequencing data from 3 normal canine lymph node samples and 3 normal canine thymus samples. This data is available from the Avery lab RSTOR shared drive.
### Thymus
O:\RSTOR-Avery\210722_SCS_Harris\T154802
O:\RSTOR-Avery\220623_SCS_Harris\raw_data\Th157850
O:\RSTOR-Avery\221103_SCS_HarrisA\01.RawData\T165635
### Lymph node
O:\RSTOR-Avery\221103_SCS_HarrisA\01.RawData\L165597
O:\RSTOR-Avery\220623_SCS_Harris\raw_data\LN157849
O:\RSTOR-Avery\210722_SCS_Harris\LN154803
### Sample information
| **Sample #**| **Patient** | **Sex**| **Breed** | **Tissue** | **Age (mos.)**|
|:-----------:|:-----------:|:------:|:---------:|:----------:|:-------------:|
| 157850      | B432        | F      | MIX       | Thymus     | 8             |
| 157849      | B432        | F      | MIX       | Lymph node | 8             |
| 154802      | B217        | F      | MIX       | Thymus     | 9             |
| 154803      | B217        | F      | MIX       | Lymph node | 9             |
| 165635      | CO32        | F      | MIX       | Thymus     | 7             |
| 165597      | CO32        | F      | MIX       | Lymph node | 7             |

## Pipeline overview
1. Raw data was transferred from RStor to a scratch directory on CURC Alpine HPC with FileZilla.
2. Reference genome FASTA and GTF files for CanFam3.1 were downloaded from Ensembl. The GTF file was filtered with cellranger mkgtf.
3. A Cell Ranger index was built from the reference genome files.
4. cellranger count was used to perform alignment, filtering, barcode counting, and UMI counting on the FASTQ files.
