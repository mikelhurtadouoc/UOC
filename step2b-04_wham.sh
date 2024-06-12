#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

CONDA_DIR=""
SAMTOOLS_ENV=""
WHAM_ENV=""

BAM_DIR=""
REFERENCE_FILE=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-BAM FILES PREPARATION FOR WHAM
echo '**************************************************'
echo 'PREPARING BAM FILES FOR WHAM ...'
date -R

source "$CONDA_DIR"/activate "$SAMTOOLS_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/01_samtools_processed_alignment_files
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/01_samtools_processed_alignment_files/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$BAM_DIR"/*.bam > "$WD"/output/01_samtools_processed_alignment_files/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BAM_FILE; do
 
	REHEADED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.rehead.bam/g'`
    COLLATED_BAM_FILE_PREFIX=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.collated/g'`
    COLLATED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.collated.bam/g'`
    FIXED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.fixed.bam/g'`
    COORDINATE_SORTED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.cordsort.bam/g'`
    FINAL_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.wham.bam/g'`
	
	#BAM FILE READ GROUP EDITION
    samtools view -H "$BAM_FILE" | sed 's,^@RG.*,@RG\tID:326UDI-idt-UMI_\tLB:1\tSM:GFCX,g' | samtools reheader - "$BAM_FILE" > "$REHEADED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    #BAM FILE COLLATING
	samtools collate -@ 3 "$REHEADED_BAM_FILE" "$COLLATED_BAM_FILE_PREFIX"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$REHEADED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 
        
	#BAM FILE MATES FIXING
    samtools fixmate -m -@ 3 "$COLLATED_BAM_FILE" "$FIXED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$COLLATED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
	#BAM FILE COORDINATE SORTING
	samtools sort -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 3 -o "$COORDINATE_SORTED_BAM_FILE" "$FIXED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$FIXED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
	#BAM FILE DUPLICATES MARKING
	samtools markdup -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 3 "$COORDINATE_SORTED_BAM_FILE" "$FINAL_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$COORDINATE_SORTED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
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

source "$CONDA_DIR"/activate "$WHAM_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/01_samtools_processed_alignment_files/*.wham.bam > "$WD"/output/02_structural_variant_calling/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FINAL_BAM_FILE; do

    VCF_FILE=`echo $FINAL_BAM_FILE | sed "s,$WD/output/01_samtools_processed_alignment_files,$WD/output/02_structural_variant_calling,g" | sed 's/.wham.bam/.vcf/g'`
    ERR_FILE=`echo $FINAL_BAM_FILE | sed "s,$WD/output/01_samtools_processed_alignment_files,$WD/output/02_structural_variant_calling,g" | sed 's/.wham.bam/.err/g'`

    whamg -a "$REFERENCE_FILE" -f "$FINAL_BAM_FILE" > "$VCF_FILE"  2> "$ERR_FILE"
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

