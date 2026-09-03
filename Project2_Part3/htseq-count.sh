#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=htseq-counting            # optional: job name
#SBATCH --time=2-0:00:00

SAM=/projects/bgmp/abangs/bioinfo/Bi621/PS/AlexBangs7-Bi621-PS8/SAMparser.py

GFF=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/campylomormyrus.gff

6CM=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/STARalign_output/6CM_Aligned.out.sam

ADULT=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/STARalign_output/adult_Aligned.out.sam

cd ../Project2_QAA/
/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run $SAM -i $6CM

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run $SAM -i $ADULT

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run htseq-count --stranded=yes -i Parent -c $6CM $GFF

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run htseq-count --stranded=yes -i Parent -c $ADULT $GFF

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run htseq-count --stranded=reverse -i Parent -c $6CM $GFF

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run htseq-count --stranded=reverse -i Parent -c $ADULT $GFF