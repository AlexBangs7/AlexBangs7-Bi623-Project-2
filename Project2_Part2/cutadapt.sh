#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=cutadapt
#SBATCH --time=2-0:00:00

cd ../Project2_Part1
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
 -o ../Project2_Part2/cutadapt_output/SRR25630297_1_adapted.fastq -p ../Project2_Part2/cutadapt_output/SRR25630297_2_adapted.fastq \
 SRR25630297_1.fastq SRR25630297_2.fastq

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
 -o ../Project2_Part2/cutadapt_output/SRR25630381_1_adapted.fastq -p ../Project2_Part2/cutadapt_output/SRR25630381_2_adapted.fastq \
 SRR25630381_1.fastq SRR25630381_2.fastq
