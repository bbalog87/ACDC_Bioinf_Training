#!/bin/bash		

# Path to nucleotide fasta file
ANNO_PATH="/home/nguinkal/LinuxExercise/Spneumoniae_analysis/tormes_out/annotation"

OUTPUT="amrfinder_out"
mkdir -p $OUTPUT


# Protein files
mkdir -p annotation_all
 

cp  $ANNO_PATH/SRR*/*.faa annotation_all
cp  $ANNO_PATH/SRR*/*.fna annotation_all
cp  $ANNO_PATH/SRR*/*.gff annotation_all

cd annotation_all
for GFF in *.gff; do
perl -pe '/^##FASTA/ && exit; s/(\W)Name=/$1OldName=/i; \
      s/ID=([^;]+)/ID=$1;Name=$1/' $GFF  > ${GFF%.gff}.foramrfinder.gff
 done
 
 cd ..
	
	for file in annotation_all/*.fna; do
    f=$(basename $file)
    echo "Processing ${f%.fna}"

    ## Run amrfinder
    amrfinder -n $file \
	          -p ${file%.fna}.faa \
			  -g ${file%.fna}.foramrfinder.gff \
        --organism Streptococcus_pneumoniae \
        --threads 12 \
        --output $OUTPUT/${f%.fna}.amrfinder.out \
        --report_common \
        --plus \
        --name ${f%.fna} \
        --mutation_all $OUTPUT/${f%.fna}.mutations.txt
		
	
	done
	
	
	## Merge all amr gene predictions into a master file
	
  head -n 1 $OUTPUT/SRR24135935.fastp.amrfinder.out > $OUTPUT/all_amrfinder.out \
  tail -q -n +2 $OUTPUT/*.amrfinder.out >> $OUTPUT/all_amrfinder.out

	
	
   ## Merge all point mutation predictions into a master file
   
	 head -n 1 $OUTPUT/SRR24135935.fastp.mutations.txt > $OUTPUT/all_mutations.out \
     && tail -q -n +2 $OUTPUT/*.mutations.txt >> $OUTPUT/all_mutations.out
   
   
   
  
	
	
	
	
	
	
	
	
	