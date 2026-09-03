#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=agat
#SBATCH --time=2-0:00:00

cd ../Project2_QAA
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run agat_convert_sp_gff2gtf.pl --gff ../Project2_Part3/campylomormyrus.gff -o ../Project2_Part3/campylomormyrus.gtf