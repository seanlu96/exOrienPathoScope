#!/bin/bash
#SBATCH --partition=main
#SBATCH --job-name=PathoscopeMAP				       	# Job name
#SBATCH --mail-type=END,FAIL          			# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=sl1729@njms.rutgers.edu     # Where to send mail	
#SBATCH --cpus-per-task=32
#SBATCH --mem=64gb          		           	# Job memory request
#SBATCH --time=3-00:00:00               		# Time limit hrs:min:sec
#SBATCH --output=pathomapmulti%a.log   					# Standard output and error log
#SBATCH --array=0-1 # job array index
 

## Create jobs file that lists names of .fq files for job array
ls *_1.fq |cut -d_ -f1 > jobs
names=($(cat jobs))



mkdir /scratch/sl1729/results/${names[${SLURM_ARRAY_TASK_ID}]}

pathoscope --verbose MAP -1 /scratch/sl1729/DnaNexus/RNAseq/alignment_crams/${names[${SLURM_ARRAY_TASK_ID}]}.genome_1.fq -2 /scratch/sl1729/DnaNexus/RNAseq/alignment_crams/${names[${SLURM_ARRAY_TASK_ID}]}.genome_2.fq -targetRefFiles /scratch/sl1729/Conda/target_ref_files/ref.fasta -filterRefFiles /scratch/sl1729/Conda/filter_ref_files/Homo_sapiens.fasta -outDir /scratch/sl1729/results/${names[${SLURM_ARRAY_TASK_ID}]} -outAlign ${names[${SLURM_ARRAY_TASK_ID}]}.sam
