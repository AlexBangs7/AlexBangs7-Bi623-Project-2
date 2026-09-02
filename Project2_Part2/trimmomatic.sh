#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=trimmomatic
#SBATCH --time=2-0:00:00

cd ../Project2_Part1
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run trimmomatic PE -phred33 ../Project2_Part2/cutadapt_output/SRR256030297_1_adapted.fastq ../Project2_Part2/cutadapt_output/SRR256030297_2_adapted.fastq \
 ../Project2_Part2/trimmomatic_output/SRR256030297_1_paired.fastq ../Project2_Part2/trimmomatic_output/SRR256030297_1_unpaired.fastq ../Project2_Part2/trimmomatic_output/SRR256030297_2_paired.fastq ../Project2_Part2/trimmomatic_output/SRR256030297_2_unpaired.fastq \
 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35
 
 
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run trimmomatic PE -phred33 ../Project2_Part2/cutadapt_output/SRR256030381_1_adapted.fastq ../Project2_Part2/cutadapt_output/SRR256030381_2_adapted.fastq \
 ../Project2_Part2/trimmomatic_output/SRR256030381_1_paired.fastq ../Project2_Part2/trimmomatic_output/SRR256030381_1_unpaired.fastq ../Project2_Part2/trimmomatic_output/SRR256030381_2_paired.fastq ../Project2_Part2/trimmomatic_output/SRR256030381_2_unpaired.fastq \
 LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35