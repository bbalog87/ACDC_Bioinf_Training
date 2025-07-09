# ACDC Bioinformatics Training


# Project Title
## Description
Brief overview of what your pipeline or tool does.
## Project Structure
Explain file/folder organization.
## Requirements
- Python ≥ 3.10
- fastqc, fastp, spades
- Conda / Docker / Singularity
## Installation
```bash
conda env create -f environment.yml
```

## Usage
```
bash run_pipeline.sh --help
Bioinformatics Pipeline: QC → Assembly → AMR Detection
------------------------------------------------------
This script performs the following for each sample:
  1. FastQC on raw reads
  2. Trimming and filtering with fastp
  3. FastQC on trimmed reads
  4. Assembly with SPAdes
  5. AMR gene detection using abriTAMR
  6. MultiQC summary report generation
Samples are auto-detected from *_R1.fastq.gz in the input folder.

Usage: run_pipeline.sh -i <input_reads_folder> -o <output_folder> -s <species> [-t <threads>]
  -i   Folder containing raw FASTQ files (e.g., raw_reads_folder)
  -o   Output folder for all results (e.g., pipeline_results)
  -s   REQUIRED: Species name for abriTAMR (e.g., Salmonella, Escherichia, Staphylococcus_aureus)
  -t   Number of threads for parallel processes [default: 8]
  -h   Show this help and exit

```


### Tables

|A | B | C|
|- |-  |- |
| 1|3  |6 |


# Section
## Subsection
### Subsubsection

- item 1
- item 2
- item 3

  1. one
  2. two
  3. tree
  5. four
  
