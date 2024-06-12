#!/bin/bash

########################################################################

#VARIABLES INSTRUCTIONS


#VARIABLES DEFINITION
WD=""

FASTQ_FILE_DIR=""
READ_1_OUTPUT_FILENAME_PREFIX=""
READ_2_OUTPUT_FILENAME_PREFIX=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS  ...'
date -R

#1-FASTQ FILES CONCATENATION
echo '**************************************************'
echo 'CONCATENATING FASTQ FILES  ...'
date -R

mkdir "$WD"/output

cat "$FASTQ_FILE_DIR"/*_1.fastq.gz > "$WD"/output/"$READ_1_OUTPUT_FILENAME_PREFIX".fastq.gz
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

cat "$FASTQ_FILE_DIR"/*_2.fastq.gz > "$WD"/output/"$READ_2_OUTPUT_FILENAME_PREFIX".fastq.gz
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS  ...'
date -R

#END
echo '**************************************************'

