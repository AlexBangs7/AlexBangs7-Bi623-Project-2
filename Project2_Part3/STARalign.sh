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
 --readFilesIn ../Project2_Part2/trimmomatic_output/CcoxCrh_comrhy112_EO_adult_2_R1_paired.fastq.gz ../Project2_Part2/trimmomatic_output/CcoxCrh_comrhy112_EO_adult_2_R2_paired.fastq.gz\
 --genomeDir ../Project2_Part3/campylomormyrus \
 --outFileNamePrefix ../Project2_Part3/STARalign_output/adult_
 
 /usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run STAR --runThreadN 8 --runMode alignReads \
 --outFilterMultimapNmax 3 \
 --outSAMunmapped Within KeepPairs \
 --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
 --readFilesCommand zcat \
 --readFilesIn ../Project2_Part2/trimmomatic_output/CcoxCrh_comrhy60_EO_6cm_1_R1_paired.fastq.gz ../Project2_Part2/trimmomatic_output/CcoxCrh_comrhy60_EO_6cm_1_R2_paired.fastq.gz\
 --genomeDir ../Project2_Part3/campylomormyrus \
 --outFileNamePrefix ../Project2_Part3/STARalign_output/6CM_