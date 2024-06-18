#!/bin/bash

########################################################################
#VARIABLES DEFINITION
WD=""

GS_BED_FILE_DIR=""
PL_BED_FILE_DIR=""

CONDA_DIR=""
BEDTOOLS_ENV=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-BED FILES INTERSECT
echo '**************************************************'
echo 'INTERSECTING BED FILES ...'
date -R

source "$CONDA_DIR"/activate "$BEDTOOLS_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/hg38_UCSC_HG002*_DEL.uniq.bed > "$WD"/output/temp/gs_hg38_UCSC_GIAB_HG002_DEL_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_GIAB_HG002_30xdownsampled_hg38_filtered_DEL.uniq.bed > "$WD"/output/temp/pipeline_GIAB_HG002_hg38_filtered_DEL_bed_files.txt

while read GS_HG38_GIAB_HG002_DEL_BED_FILE; do

    while read PIPELINE_HG38_GIAB_HG002_DEL_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GIAB_HG002_DEL_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_HG38_GIAB_HG002_DEL_BED_FILE" -b "$PIPELINE_HG38_GIAB_HG002_DEL_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GIAB_HG002_hg38_filtered_DEL_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_hg38_UCSC_GIAB_HG002_DEL_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/hg38_UCSC_HG002*_INS.uniq.bed > "$WD"/output/temp/gs_hg38_UCSC_GIAB_HG002_INS_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_GIAB_HG002_30xdownsampled_hg38_filtered_INS.uniq.bed > "$WD"/output/temp/pipeline_GIAB_HG002_hg38_filtered_INS_bed_files.txt

while read GS_HG38_GIAB_HG002_INS_BED_FILE; do

    while read PIPELINE_HG38_GIAB_HG002_INS_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GIAB_HG002_INS_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_HG38_GIAB_HG002_INS_BED_FILE" -b "$PIPELINE_HG38_GIAB_HG002_INS_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GIAB_HG002_hg38_filtered_INS_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_hg38_UCSC_GIAB_HG002_INS_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/hg38_UCSC_HG002*_DUP.uniq.bed > "$WD"/output/temp/gs_hg38_UCSC_GIAB_HG002_DUP_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_GIAB_HG002_30xdownsampled_hg38_filtered_DUP.uniq.bed > "$WD"/output/temp/pipeline_GIAB_HG002_hg38_filtered_DUP_bed_files.txt

while read GS_HG38_GIAB_HG002_DUP_BED_FILE; do

    while read PIPELINE_HG38_GIAB_HG002_DUP_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GIAB_HG002_DUP_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_HG38_GIAB_HG002_DUP_BED_FILE" -b "$PIPELINE_HG38_GIAB_HG002_DUP_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GIAB_HG002_hg38_filtered_DUP_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_hg38_UCSC_GIAB_HG002_DUP_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/T2T_hs1_UCSC_HG002*_DEL.uniq.bed > "$WD"/output/temp/gs_T2T_hs1_UCSC_GIAB_HG002_DEL_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_GIAB_HG002_30xdownsampled_T2T_hs1_UCSC_DEL.uniq.bed > "$WD"/output/temp/pipeline_GIAB_HG002_T2T_hs1_UCSC_DEL_bed_files.txt

while read GS_T2T_HS1_GIAB_HG002_DEL_BED_FILE; do

    while read PIPELINE_HG38_GIAB_HG002_DEL_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GIAB_HG002_DEL_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_T2T_HS1_GIAB_HG002_DEL_BED_FILE" -b "$PIPELINE_HG38_GIAB_HG002_DEL_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GIAB_HG002_T2T_hs1_UCSC_DEL_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_T2T_hs1_UCSC_GIAB_HG002_DEL_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/T2T_hs1_UCSC_HG002*_INS.uniq.bed > "$WD"/output/temp/gs_T2T_hs1_UCSC_GIAB_HG002_INS_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_GIAB_HG002_30xdownsampled_T2T_hs1_UCSC_INS.uniq.bed > "$WD"/output/temp/pipeline_GIAB_HG002_T2T_hs1_UCSC_INS_bed_files.txt

while read GS_T2T_HS1_GIAB_HG002_INS_BED_FILE; do

    while read PIPELINE_HG38_GIAB_HG002_INS_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GIAB_HG002_INS_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_T2T_HS1_GIAB_HG002_INS_BED_FILE" -b "$PIPELINE_HG38_GIAB_HG002_INS_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GIAB_HG002_T2T_hs1_UCSC_INS_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_T2T_hs1_UCSC_GIAB_HG002_INS_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/T2T_hs1_UCSC_HG002*_DUP.uniq.bed > "$WD"/output/temp/gs_T2T_hs1_UCSC_GIAB_HG002_DUP_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_GIAB_HG002_30xdownsampled_T2T_hs1_UCSC_DUP.uniq.bed > "$WD"/output/temp/pipeline_GIAB_HG002_T2T_hs1_UCSC_DUP_bed_files.txt

while read GS_T2T_HS1_GIAB_HG002_DUP_BED_FILE; do

    while read PIPELINE_HG38_GIAB_HG002_DUP_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GIAB_HG002_DUP_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_T2T_HS1_GIAB_HG002_DUP_BED_FILE" -b "$PIPELINE_HG38_GIAB_HG002_DUP_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GIAB_HG002_T2T_hs1_UCSC_DUP_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_T2T_hs1_UCSC_GIAB_HG002_DUP_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/hg38_UCSC_GFCX*_DEL.uniq.bed > "$WD"/output/temp/gs_hg38_UCSC_GFCX_DEL_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_326UDI-idt-UMI_hg38_UCSC_filtered_DEL.uniq.bed > "$WD"/output/temp/pipeline_GFCX_hg38_filtered_DEL_bed_files.txt

while read GS_HG38_GFCX_DEL_BED_FILE; do

    while read PIPELINE_HG38_GFCX_DEL_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GFCX_DEL_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_HG38_GFCX_DEL_BED_FILE" -b "$PIPELINE_HG38_GFCX_DEL_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GFCX_hg38_filtered_DEL_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_hg38_UCSC_GFCX_DEL_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/hg38_UCSC_GFCX*_INS.uniq.bed > "$WD"/output/temp/gs_hg38_UCSC_GFCX_INS_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_326UDI-idt-UMI_hg38_UCSC_filtered_INS.uniq.bed > "$WD"/output/temp/pipeline_GFCX_hg38_filtered_INS_bed_files.txt

while read GS_HG38_GFCX_INS_BED_FILE; do

    while read PIPELINE_HG38_GFCX_INS_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GFCX_INS_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_HG38_GFCX_INS_BED_FILE" -b "$PIPELINE_HG38_GFCX_INS_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GFCX_hg38_filtered_INS_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi


done < "$WD"/output/temp/gs_hg38_UCSC_GFCX_INS_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/hg38_UCSC_GFCX*_DUP.uniq.bed > "$WD"/output/temp/gs_hg38_UCSC_GFCX_DUP_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_326UDI-idt-UMI_hg38_UCSC_filtered_DUP.uniq.bed > "$WD"/output/temp/pipeline_GFCX_hg38_filtered_DUP_bed_files.txt

while read GS_HG38_GFCX_DUP_BED_FILE; do

    while read PIPELINE_HG38_GFCX_DUP_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_HG38_GFCX_DUP_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_HG38_GFCX_DUP_BED_FILE" -b "$PIPELINE_HG38_GFCX_DUP_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GFCX_hg38_filtered_DUP_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_hg38_UCSC_GFCX_DUP_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/T2T_hs1_UCSC_GFCX*_DEL.uniq.bed > "$WD"/output/temp/gs_T2T_hs1_UCSC_GFCX_DEL_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_326UDI-idt-UMI_T2T_hs1_UCSC_DEL.uniq.bed > "$WD"/output/temp/pipeline_GFCX_T2T_hs1_UCSC_DEL_bed_files.txt

while read GS_T2T_HS1_GFCX_DEL_BED_FILE; do

    while read PIPELINE_T2T_HS1_GFCX_DEL_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_T2T_HS1_GFCX_DEL_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_T2T_HS1_GFCX_DEL_BED_FILE" -b "$PIPELINE_T2T_HS1_GFCX_DEL_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GFCX_T2T_hs1_UCSC_DEL_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_T2T_hs1_UCSC_GFCX_DEL_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/T2T_hs1_UCSC_GFCX*_INS.uniq.bed > "$WD"/output/temp/gs_T2T_hs1_UCSC_GFCX_INS_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_326UDI-idt-UMI_T2T_hs1_UCSC_INS.uniq.bed > "$WD"/output/temp/pipeline_GFCX_T2T_hs1_UCSC_INS_bed_files.txt

while read GS_T2T_HS1_GFCX_INS_BED_FILE; do

    while read PIPELINE_T2T_HS1_GFCX_INS_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_T2T_HS1_GFCX_INS_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_T2T_HS1_GFCX_INS_BED_FILE" -b "$PIPELINE_T2T_HS1_GFCX_INS_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GFCX_T2T_hs1_UCSC_INS_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_T2T_hs1_UCSC_GFCX_INS_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$GS_BED_FILE_DIR"/T2T_hs1_UCSC_GFCX*_DUP.uniq.bed > "$WD"/output/temp/gs_T2T_hs1_UCSC_GFCX_DUP_bed_files.txt

ls "$PL_BED_FILE_DIR"/*_326UDI-idt-UMI_T2T_hs1_UCSC_DUP.uniq.bed > "$WD"/output/temp/pipeline_GFCX_T2T_hs1_UCSC_DUP_bed_files.txt

while read GS_T2T_HS1_GFCX_DUP_BED_FILE; do

    while read PIPELINE_T2T_HS1_GFCX_DUP_BED_FILE; do

        RESULTS_BED_FILE=`echo $PIPELINE_T2T_HS1_GFCX_DUP_BED_FILE | sed "s,"$PL_BED_FILE_DIR/",$WD/output/intersect_,g" | sed 's/_SV_lines.txt/.bed/g'`

        bedtools intersect -f 0.9 -r -a "$GS_T2T_HS1_GFCX_DUP_BED_FILE" -b "$PIPELINE_T2T_HS1_GFCX_DUP_BED_FILE" > "$RESULTS_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
    done < "$WD"/output/temp/pipeline_GFCX_T2T_hs1_UCSC_DUP_bed_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/gs_T2T_hs1_UCSC_GFCX_DUP_bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS ...'
date -R

#END
echo '**************************************************'

