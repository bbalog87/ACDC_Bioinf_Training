#!/bin/bash

## my output directory

mkdir -p aquamis_output


# Path to my cleaned reads after fastp
PATH_READS="/home/nguinkal/LinuxExercise/Spneumoniae_analysis/reads_post_fastp"
OUTPUT="aquamis_output"
PATH_KRAKEN="/home/nguinkal/amrFlow/AQUAMIS/reference_db/kraken" 
TAXONKITDB="/home/nguinkal/amrFlow/AQUAMIS/reference_db/taxonkit"
MASHDB="/home/nguinkal/amrFlow/AQUAMIS/reference_db/mash/mashDB.msh"

#==========================
# create then sample sheet #
#==========================

create_sampleSheet.sh --mode ncbi \
                      --fastxDir $PATH_READS \
					  --outDir $OUTPUT \
					  --force 
					  

#==========================
# Run aquamis             #
#==========================

aquamis -l $OUTPUT/samples.tsv \
        -d $OUTPUT \
		-r "Streptocccus pneumoniae analysis with aquamis" \
		--taxlevel_qc S \
		--threads_sample 10 \
		--logdir $OUTPUT \
		--kraken2db $PATH_KRAKEN \
		--taxonkit_db $TAXONKITDB \
        --mashdb $MASHDB 		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
 