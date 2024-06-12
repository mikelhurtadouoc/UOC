#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

CONDA_DIR=""
SAMTOOLS_ENV=""
LUMPY_ENV=""

BAM_DIR=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-BAM FILES PREPARATION FOR LUMPY
echo '**************************************************'
echo 'PREPARING BAM FILES FOR LUMPY ...'
date -R

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/01_samtools_processed_alignment_files
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/01_samtools_processed_alignment_files/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

source "$CONDA_DIR"/activate "$SAMTOOLS_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$BAM_DIR"/*.bam > "$WD"/output/01_samtools_processed_alignment_files/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BAM_FILE; do
 
    REHEADED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.rehead.bam/g'`
    NAME_SORTED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.namesort.bam/g'`
    NAME_SORTED_SAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.namesort.sam/g'`
    DUPLICATES_REMOVED_SAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.duprem.sam/g'`
    DUPLICATES_REMOVED_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.duprem.bam/g'`
    FINAL_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.lumpy.bam/g'`
    DISCORDANT_ALIGNMENTS_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.discords.bam/g'`
    FINAL_DISCORDANT_ALIGNMENTS_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.lumpy.discords.bam/g'`
    DUPLICATES_REMOVED_SAM_FILE_2=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.duprem2.sam/g'`
    SPLITTERS_ALIGNMENTS_SAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.splitters.sam/g'`
    SPLITTERS_ALIGNMENTS_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files/temp,g" | sed 's/.bam/.splitters.bam/g'`
    FINAL_SPLITERS_ALIGNMENTS_BAM_FILE=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output/01_samtools_processed_alignment_files,g" | sed 's/.bam/.lumpy.splitters.bam/g'`
 
 	#CONDA ENVIRONMENTS MANAGEMENT
    source "$CONDA_DIR"/activate "$SAMTOOLS_ENV"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #BAM FILE READ GROUP EDITION
    samtools view -H "$BAM_FILE" | sed 's,^@RG.*,@RG\tID:326UDI-idt-UMI_\tLB:1\tSM:GFCX,g' | samtools reheader - "$BAM_FILE" > "$REHEADED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    #BAM FILE NAME SORTING
	samtools sort -n -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 6 -o "$NAME_SORTED_BAM_FILE" "$REHEADED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVING
    rm "$REHEADED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 

    #BAM FILE TO SAM FILE CONVERSION
    samtools view -h -@ 6 "$NAME_SORTED_BAM_FILE" > "$NAME_SORTED_SAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$NAME_SORTED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #CONDA ENVIRONMENTS MANAGEMENT
    conda deactivate
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

	#CONDA ENVIRONMENTS MANAGEMENT
    source "$CONDA_DIR"/activate "$LUMPY_ENV"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #DUPLICATES REMOVAL
    samblaster --excludeDups --addMateTags --maxSplitCount 2 --minNonOverlap 20 --ignoreUnmated -i "$NAME_SORTED_SAM_FILE" -o "$DUPLICATES_REMOVED_SAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$NAME_SORTED_SAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #CONDA ENVIRONMENTS MANAGEMENT
    conda deactivate
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

	#CONDA ENVIRONMENTS MANAGEMENT
    source "$CONDA_DIR"/activate "$SAMTOOLS_ENV"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #SAM FILE TO BAM FILE CONVERSION
    samtools view -S -b -@ 6 "$DUPLICATES_REMOVED_SAM_FILE" > "$DUPLICATES_REMOVED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$DUPLICATES_REMOVED_SAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    #BAM FILE COORDINATE SORTING
    samtools sort -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 6 -o "$FINAL_BAM_FILE" "$DUPLICATES_REMOVED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #BAM FILE INDEXING
    samtools index -@ 6 "$FINAL_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi 

    #DISCORDANT ALIGNMENTS EXTRACTION
    samtools view -b -F 1294 -@ 6 "$DUPLICATES_REMOVED_BAM_FILE" > "$DISCORDANT_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #BAM FILE COORDINATE SORTING IN DISCORDANT ALIGNMENTS
	samtools sort -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 6 -o "$FINAL_DISCORDANT_ALIGNMENTS_BAM_FILE" "$DISCORDANT_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #BAM FILE INDEXING IN DISCORDANT ALIGNMENTS
    samtools index -@ 6 "$FINAL_DISCORDANT_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$DISCORDANT_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi    

    #BAM FILE TO SAM FILE CONVERSION
    samtools view -h -@ 6 "$DUPLICATES_REMOVED_BAM_FILE" > "$DUPLICATES_REMOVED_SAM_FILE_2"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$DUPLICATES_REMOVED_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi    

    #CONDA ENVIRONMENTS MANAGEMENT
    conda deactivate
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

	#CONDA ENVIRONMENTS MANAGEMENT
    source "$CONDA_DIR"/activate "$LUMPY_ENV"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #SPLIT-READ ALIGNMENTS EXTRACTION
    extractSplitReads_BwaMem -i "$DUPLICATES_REMOVED_SAM_FILE_2" > "$SPLITTERS_ALIGNMENTS_SAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$DUPLICATES_REMOVED_SAM_FILE_2"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi   

    #CONDA ENVIRONMENTS MANAGEMENT
    conda deactivate
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

	#CONDA ENVIRONMENTS MANAGEMENT
    source "$CONDA_DIR"/activate "$SAMTOOLS_ENV"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #SAM FILE TO BAM FILE CONVERSION
    samtools view -Sb -@ 6 "$SPLITTERS_ALIGNMENTS_SAM_FILE" > "$SPLITTERS_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$SPLITTERS_ALIGNMENTS_SAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi   

    #BAM FILE COORDINATE SORTING IN SPLITTERS ALIGNMENTS
	samtools sort -T "$WD"/output/01_samtools_processed_alignment_files/temp -@ 6 -o "$FINAL_SPLITERS_ALIGNMENTS_BAM_FILE" "$SPLITTERS_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #BAM FILE INDEXING IN SPLITTERS ALIGNMENTS
    samtools index -@ 6 "$FINAL_SPLITERS_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    #INTERMEDIATE FILES REMOVAL
    rm "$SPLITTERS_ALIGNMENTS_BAM_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi   

    #CONDA ENVIRONMENTS MANAGEMENT
    conda deactivate
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/01_samtools_processed_alignment_files/temp/bam_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/01_samtools_processed_alignment_files/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#2-STRUCTURAL VARIANT CALLING
echo '**************************************************'
echo 'STRUCTURAL VARIANT CALLING ...'
date -R

source "$CONDA_DIR"/activate "$LUMPY_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/02_structural_variant_calling/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/01_samtools_processed_alignment_files/*.lumpy.bam > "$WD"/output/02_structural_variant_calling/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BAM_FILE; do

    DISCORDANT_ALIGNMENTS_BAM_FILE=`echo $BAM_FILE | sed 's/.lumpy.bam/.lumpy.discords.bam/g'`
    SPLITTERS_ALIGNMENTS_BAM_FILE=`echo $BAM_FILE | sed 's/.lumpy.bam/.lumpy.splitters.bam/g'`
    VCF_FILE=`echo $BAM_FILE | sed "s,$WD/output/01_samtools_processed_alignment_files,$WD/output/02_structural_variant_calling,g" | sed 's/.lumpy.bam/.vcf/g'`

    lumpyexpress -B "$BAM_FILE" -S "$SPLITTERS_ALIGNMENTS_BAM_FILE" -D "$DISCORDANT_ALIGNMENTS_BAM_FILE" -o "$VCF_FILE"
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

