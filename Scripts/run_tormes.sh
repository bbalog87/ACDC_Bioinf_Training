#!/bin/bash	

# Define the input folder containing assembly files
ASM_PATH="/home/nguinkal/LinuxExercise/Spneumoniae_analysis/aquamis_output/Assembly/assembly"

## Create a sample sheet with meta data : sample_metadata.txt


echo -e "Samples\tRead1\tRead2\tDescription" > samples.txt
    for FILE in $(ls $ASM_PATH/*.fasta);do 
	base_name=$(basename "$FILE" .fasta)
	echo -e "$base_name\tGENOME\t${FILE}\t""This is the genome for $base_name" >> samples.txt
	done 
	
	## Create ouput folder for TORMES
	
	OUTPUT="tormes_out"
	
	
	tormes -m samples.txt \
	       -o $OUTPUT \
		  # --gene_min_cov 90 \       
		  # --gene_min_id 90 \
		   -t 14