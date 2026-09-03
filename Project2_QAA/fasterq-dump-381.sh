#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=fasterq-dump
#SBATCH --time=2-0:00:00

/usr/bin/time -v fasterq-dump SRR25630381
