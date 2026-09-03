#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=AlignReads
#SBATCH --time=2-0:00:00


cd ../Project2_QAA/
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn ../Project2_Part2/trimmomatic_output/SRR25630381_1_paired.fastq.gz ../Project2_Part2/trimmomatic_output/SRR25630381_2_paired.fastq.gz\
 --genomeDir ../Project2_Part3/campylomormyrus \
 --outFileNamePrefix STARalignment
 
 /usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn ../Project2_Part2/trimmomatic_output/SRR25630297_1_paired.fastq.gz ../Project2_Part2/trimmomatic_output/SRR25630297_2_paired.fastq.gz\
 --genomeDir ../Project2_Part3/campylomormyrus \
 --outFileNamePrefix STARalignment