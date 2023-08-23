#! /bin/bash
#SBATCH --partition=main
#SBATCH --job-id=create_manifest	        # Job name
#SBATCH --mail-type=END,FAIL                    # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=                            # Where to send mail
#SBATCH --ntasks=1                              # Run on a single CPU
#SBATCH --cpus-per-task=4                       # CPUs per task
#SBATCH --mem=16gb                              # Job memory request
#SBATCH --time=24:00:00                         # Time limit hrs:min:sec
#SBATCH --output=log_create_manifest.log   # Standard output and error log



cd manifest_files

## Creates manifest file for dx-download-agent-linx to download files
python3 ../scripts/create_manifest.py "project-G3XypG00J8xFZ71q9q92J0q4:/RNAseq/alignment_crams/" --recursive -o "alignment_crams.manifest.json.bz2"

## Splits manifest files into 241 files, each with 12 .cram files
python3 ../scripts/split_manifest.py alignment_crams.manifest.json.bz2 -n 36
