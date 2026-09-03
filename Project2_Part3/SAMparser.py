#!/usr/bin/env python

import argparse

def get_args():
    parser=argparse.ArgumentParser()
    parser.add_argument("-i","--file", help="sam alignment file", required=True)
    return parser.parse_args()
args = get_args()

file = args.i

with open(file, "r") as sam:
    mapped, unmapped = 0, 0
    for line in sam:
        if line[0] == "@":
            continue
        fields = line.split("\t")
        flags = fields[1]

        # Skip secondary alignments
        if (int(flags) & 256) == 256:
            continue
        
        # Count if read is mapped or unmapped
        if((int(flags) & 4) != 4):
            mapped += 1
        else:
            unmapped +=1

        # Count if paired read is mapped or unmapped
        if((int(flags) & 8) != 8):
            mapped += 1
        else:
            unmapped +=1
    print(f'Mapped reads: {mapped}')
    print(f'Unampped reads: {unmapped}')