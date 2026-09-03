#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=buildStarDatabase            # optional: job name
#SBATCH --time=2-0:00:00


cd ../Project2_QAA/
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run STAR --runThreadN 8 --runMode genomeGenerate \
 --genomeDir ../Project2_Part3/campylomormyrus \
 --genomeFastaFiles ../Project2_Part3/campylomormyrus.fasta \
 --sjdbGTFfile ../Project2_Part3/campylomormyrus.gtf
