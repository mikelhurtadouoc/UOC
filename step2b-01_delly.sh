#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

CONDA_DIR=""
SAMTOOLS_ENV=""
DELLY_ENV=""
BCFTOOLS_ENV=""

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

#1-BAM FILES PREPARATION FOR DELLY
echo '**************************************************'
echo 'PREPARING BAM FILES FOR DELLY ...'
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
 
	COLLATED_BAM_FILE_PREFIX=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.collated/g'`
    COLLATED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.collated.bam/g'`
    FIXED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.fixed.bam/g'`
    COORDINATE_SORTED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.cordsort.bam/g'`
    FINAL_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.delly.bam/g'`
	
	#BAM FILE COLLATING
	samtools collate -u -@ 6 "$BAM_FILE" "$COLLATED_BAM_FILE_PREFIX"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 
      
	#BAM FILE MATES FIXING
    samtools fixmate -m -@ 6 "$COLLATED_BAM_FILE" "$FIXED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$COLLATED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 
        
	#BAM FILE COORDINATE SORTING
	samtools sort -l 0 -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 6 -o "$COORDINATE_SORTED_BAM_FILE" "$FIXED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$FIXED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 

	#BAM FILE DUPLICATES MARKING
	samtools markdup -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 6 "$COORDINATE_SORTED_BAM_FILE" "$FINAL_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$COORDINATE_SORTED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 
        
    #BAM FILE INDEXING
    samtools index -@ 6 "$FINAL_BAM_FILE"
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

source "$CONDA_DIR"/activate "$DELLY_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/01_samtools_processed_alignment_files/*.delly.bam > "$WD"/output/02_structural_variant_calling/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FINAL_BAM_FILE; do

    BCF_FILE=`echo $FINAL_BAM_FILE | sed "s,$WD/output/01_samtools_processed_alignment_files,$WD/output/02_structural_variant_calling,g" | sed 's/.delly.bam/.bcf/g'`

    delly call -g "$REFERENCE_FILE" -o "$BCF_FILE" "$FINAL_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/02_structural_variant_calling/temp/bam_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/02_structural_variant_calling/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#3-BFC TO VCF FILE CONVERSION
echo '**************************************************'
echo 'TRANSFORMING BCF FILE INTO VCF FILE ...'
date -R

source "$CONDA_DIR"/activate "$BCFTOOLS_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/03_file_conversion
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/03_file_conversion/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/02_structural_variant_calling/*.bcf > "$WD"/output/03_file_conversion/temp/bcf_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BCF_FILE; do

    VCF_FILE=`echo $BCF_FILE | sed "s,$WD/output/02_structural_variant_calling,$WD/output/03_file_conversion,g" | sed 's/.bcf/.vcf/g'`

    bcftools view "$BCF_FILE" > "$VCF_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/03_file_conversion/temp/bcf_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/03_file_conversion/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS ...'
date -R

#END
echo '**************************************************'

