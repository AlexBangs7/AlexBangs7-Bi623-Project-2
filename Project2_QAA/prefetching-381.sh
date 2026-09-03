#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --time=2-00:00:00
#SBATCH --job-name=SRA_file_download

/usr/bin/time -v prefetch SRR25630381 --max-size 420000000000