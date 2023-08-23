#! /bin/bash
#SBATCH --partition=main
#SBATCH --job-name=PathoID				       	# Job name
#SBATCH --mail-type=END,FAIL          			# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=sl1729@njms.rutgers.edu     # Where to send mail	
#SBATCH --ntasks=1                    			# Run on a single CPU
#SBATCH --cpus-per-task=4
#SBATCH --mem=16gb          		           	# Job memory request
#SBATCH --time=2-00:00:00               		# Time limit hrs:min:sec
#SBATCH --output=PathoID.log   					# Standard output and error log




pathoscope ID -alignFile /scratch/sl1729/PathoScope/results/test.sam -fileType sam -outDir /scratch/sl1729/PathoScope/results

