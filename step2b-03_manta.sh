#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

CONDA_DIR=""
SAMTOOLS_ENV=""
MANTA_ENV=""

REFERENCE_FILE=""
BAM_DIR=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-BAM AND FASTA FILES PREPARATION FOR MANTA
echo '**************************************************'
echo 'PREPARING BAM AND FASTA FILES FOR MANTA ...'
date -R

source "$CONDA_DIR"/activate "$SAMTOOLS_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

samtools faidx "$REFERENCE_FILE"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output
mkdir "$WD"/output/01_samtools_processed_alignment_files
mkdir "$WD"/output/01_samtools_processed_alignment_files/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$BAM_DIR"/*.bam > "$WD"/output/01_samtools_processed_alignment_files/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BAM_FILE; do
 
    FINAL_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.manta.bam/g'`
	      
	#BAM FILE COORDINATE SORTING
	samtools sort -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 3 -o "$FINAL_BAM_FILE" "$BAM_FILE"
           
    #BAM FILE INDEXING
    samtools index -@ 3 "$FINAL_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 
       
done < "$WD"/output/01_samtools_processed_alignment_files/temp/bam_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/01_samtools_processed_alignment_files/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#2-STRUCTURAL VARIANT CALLING
echo '**************************************************'
echo 'STRUCTURAL VARIANT CALLING ...'
date -R

source "$CONDA_DIR"/activate "$MANTA_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling
mkdir "$WD"/output/02_structural_variant_calling/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/01_samtools_processed_alignment_files/*.manta.bam > "$WD"/output/02_structural_variant_calling/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BAM_FILE; do

    OUTPUT_DIR=`echo $BAM_FILE | sed "s,"$WD"/output/01_samtools_processed_alignment_files,"$WD"/output/02_structural_variant_calling,g" | sed 's/.manta.bam//g'`
    
    mkdir "$OUTPUT_DIR"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    configManta.py --bam "$BAM_FILE" --referenceFasta "$REFERENCE_FILE" --runDir "$OUTPUT_DIR"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
   "$OUTPUT_DIR"/runWorkflow.py -j 6
   if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/02_structural_variant_calling/temp/bam_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/02_structural_variant_calling/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS ...'
date -R

#END
echo '**************************************************'

