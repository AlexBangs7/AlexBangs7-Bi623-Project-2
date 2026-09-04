#!/bin/bash


#SBATCH --account=bgmp                    # REQUIRED: which account to use
#SBATCH --partition=bgmp                  # REQUIRED: which partition to use
#SBATCH --cpus-per-task=8                 # optional: number of cpus, default is 1
#SBATCH --job-name=htseq-counting            # optional: job name
#SBATCH --time=2-0:00:00

SAM=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/SAMparser.py

GFF=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/campylomormyrus.gff

SIXCM=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/STARalign_output/6CM_Aligned.out.sam

ADULT=/projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/STARalign_output/adult_Aligned.out.sam

cd ../Project2_QAA/

# 6CM files

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run $SAM -i $SIXCM

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run htseq-count --stranded=yes -i Parent $SIXCM $GFF > /projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/CcoxCrh_comrhy60_EO_6cm_1_htseqcounts_forstranded.txt

/usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
 pixi run htseq-count --stranded=reverse -i Parent $SIXCM $GFF > /projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/CcoxCrh_comrhy60_EO_6cm_1_htseqcounts_revstranded.txt

# ADULT files

# /usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
#  pixi run $SAM -i $ADULT

# /usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
#  pixi run htseq-count --stranded=yes -i Parent $ADULT $GFF > /projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/CcoxCrh_comrhy112_EO_adult_2_htseqcounts_forstranded.txt

# /usr/bin/time -f "Command being timed: %C\nPercent of CPU this job got: %P\nElapsed (wall clock) time (h:mm:ss or m:ss): %E\nMaximum resident set size (kbytes): %M\nExit status: %x" \
#  pixi run htseq-count --stranded=reverse -i Parent $ADULT $GFF > /projects/bgmp/abangs/bioinfo/Bi623/AlexBangs7-Bi623-Project-2/Project2_Part3/CcoxCrh_comrhy112_EO_adult_2_htseqcounts_revstranded.txt