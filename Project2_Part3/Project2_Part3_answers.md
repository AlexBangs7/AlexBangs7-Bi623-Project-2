Include the number of mapped and unmapped reads from both sam files

CcoxCrh_comrhy60_EO_6cm_1:
Mapped reads: 216,050,288
Unampped reads: 14,510,204

CcoxCrh_comrhy112_EO_adult_2:
Mapped reads: 25,191,480
Unampped reads: 1,502,012

Demonstrate convincingly whether or not the data are from "strand-specific" RNA-Seq libraries and which stranded= parameter should you use for counting your reads for a future differential gene expression analyses. Include any commands/scripts used. Briefly describe your evidence, using quantitative statements (e.g. "I propose that these data are/are not strand-specific, because X% of the reads are y, as opposed to z.").

I propose the data is strand-specific, since for both files, there is a significant difference in the percentage of mapped reads to total reads between R1 and R2 files. For both my SRAs, the R2 file has ~50% mapped/total reads, while the forward file has ~3% mapped/total reads. This indicates a dissimilarity in the contents of the files that is reflective of the files being strand-specific

6cm fwd mapped reads: 1679681/57640123 = 2.91% of total
6cm rev mapped reads: 31517718/57640123 = 54.68% of total

Adult fwd mapped reads: 177429/6673373 = 2.66% of total
Adult rev mapped reads: 3292336/6673373 = 49.34% of total

Counting mapped reads in STARalign outputs:
`grep -v "^__" <file> | awk '{sum+=$2} END {print sum}'`
Counting total reads in STARalign outputs:
`cat <file> | awk '{sum+=$2} END {print sum}'`
