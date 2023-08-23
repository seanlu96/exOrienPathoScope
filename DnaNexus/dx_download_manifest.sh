#! /bin/bash
#SBATCH --partition=main
#SBATCH --job-id=dx_download_manifest.sh      	# Job name
#SBATCH --mail-type=END,FAIL          		# Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=			     	# Where to send mail	
#SBATCH --ntasks=1                    		# Run on a single CPU
#SBATCH --cpus-per-task=4			# CPUs per task
#SBATCH --mem=16gb                     		# Job memory request
#SBATCH --time=24:00:00               		# Time limit hrs:min:sec
#SBATCH --output=log_dx_download_manifest.log   # Standard output and error log




## downloads files from manifest file
MANIFEST=allfiles.manifest_001.json.bz2

./dx-download-agent-linux download -num_threads=20 $MANIFEST 





## References
## https://documentation.dnanexus.com/downloads
## https://github.com/dnanexus/dxda
