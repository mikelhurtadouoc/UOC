#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

CONDA_DIR=""
SEQTK_ENV=""

FASTQ_DIR=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS  ...'
date -R

#1-FASTQ FILES DOWNSAMPLING
echo '**************************************************'
echo 'DOWNSAMPLING FASTQ FILES  ...'
date -R

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#FASTQ FILES DOWNSAMPLING
source "$CONDA_DIR"/activate "$SEQTK_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$FASTQ_DIR"/*_1.fastq.gz > "$WD"/output/temp/fastq_files_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FASTQ_FILE_1; do

    FASTQ_FILE_2=`echo $FASTQ_FILE_1 | sed "s,$FASTQ_DIR,$FASTQ_DIR,g" | sed 's/_1.fastq.gz/_2.fastq.gz/g'`
    DOWNSAMPLED_FASTQ_FILE_1=`echo $FASTQ_FILE_1 | sed "s,$FASTQ_DIR,$WD/output,g" | sed 's/_1.fastq.gz/_30xdownsampled_1.fastq/g'`
    DOWNSAMPLED_FASTQ_FILE_2=`echo $FASTQ_FILE_1 | sed "s,$FASTQ_DIR,$WD/output,g" | sed 's/_1.fastq.gz/_30xdownsampled_2.fastq/g'`

    seqtk sample -s487 "$FASTQ_FILE_1" 0.1 > "$DOWNSAMPLED_FASTQ_FILE_1"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    gzip "$DOWNSAMPLED_FASTQ_FILE_1"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    seqtk sample -s487 "$FASTQ_FILE_2" 0.1 > "$DOWNSAMPLED_FASTQ_FILE_2"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    gzip "$DOWNSAMPLED_FASTQ_FILE_2"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/fastq_files_1.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS  ...'
date -R

#END
echo '**************************************************'

