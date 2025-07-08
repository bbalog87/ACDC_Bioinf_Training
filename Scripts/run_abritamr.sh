#!/bin/bash		

GENOMES="/home/nguinkal/LinuxExercise/Spneumoniae_analysis/tormes_out/genomes"

for file in $GENOMES/*.fastp.fasta; do
    base=$(basename "$file" .fastp.fasta)
    
	echo -e "$base\t${file}" >> contigs.txt
	
	done 
	

# Run abritamr

 abritamr run -c contigs.txt \
          -j 14 \
		  --species Streptococcus_pneumoniae
	
	
	