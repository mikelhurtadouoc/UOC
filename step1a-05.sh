#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

DOWNLOAD_ATTEMPT_FASTQ_FILE_DIR=""
REDOWNLOAD_ATTEMPT_FASTQ_FILE_DIR=""
REDOWNLOAD_ATTEMPT_2_FASTQ_FILE_DIR=""
REDOWNLOAD_ATTEMPT_3_FASTQ_FILE_DIR=""
DOWNLOAD_ATTEMPT_FAILED_FILE_LIST_FILE=""
REDOWNLOAD_ATTEMPT_FAILED_FILE_LIST_FILE=""
REDOWNLOAD_ATTEMPT_2_FAILED_FILE_LIST_FILE=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS  ...'
date -R

#1-FASTQ FILES REORDERING
echo '**************************************************'
echo 'REORDERRING FASTQ FILES ...'
date -R

SCRIPT_FILE=`ls $WD/*.sh`

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/check_passed
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/check_failed
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/check_failed/download_attempt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/check_failed/redownload_attempt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/check_failed/redownload_attempt_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/check_failed/redownload_attempt_3
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

while read DOWNLOAD_ATTEMPT_FAILED_FASTQ_FILE; do

    mv "$DOWNLOAD_ATTEMPT_FAILED_FASTQ_FILE" "$WD"/output/check_failed/download_attempt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$DOWNLOAD_ATTEMPT_FAILED_FILE_LIST_FILE"

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Failed files from download attemp moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$DOWNLOAD_ATTEMPT_FASTQ_FILE_DIR"/*.gz "$WD"/output/check_passed
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Passed files from download attemp moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from download attemp moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from this folder have been moved by $SCRIPT_FILE." > "$DOWNLOAD_ATTEMPT_FASTQ_FILE_DIR"/readme.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

while read REDOWNLOAD_ATTEMPT_FAILED_FASTQ_FILE; do

    mv "$REDOWNLOAD_ATTEMPT_FAILED_FASTQ_FILE" "$WD"/output/check_failed/redownload_attempt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$REDOWNLOAD_ATTEMPT_FAILED_FILE_LIST_FILE"

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Failed files from redownload attemp moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$REDOWNLOAD_ATTEMPT_FASTQ_FILE_DIR"/*.gz "$WD"/output/check_passed
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Passed files from redownload attemp moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from redownload attemp moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from this folder have been moved by $SCRIPT_FILE." > "$REDOWNLOAD_ATTEMPT_FASTQ_FILE_DIR"/readme.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

while read REDOWNLOAD_ATTEMPT_2_FAILED_FASTQ_FILE; do

    mv "$REDOWNLOAD_ATTEMPT_2_FAILED_FASTQ_FILE" "$WD"/output/check_failed/redownload_attempt_2
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$REDOWNLOAD_ATTEMPT_2_FAILED_FILE_LIST_FILE"

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Failed files from redownload attemp 2 moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$REDOWNLOAD_ATTEMPT_2_FASTQ_FILE_DIR"/*.gz "$WD"/output/check_passed
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Passed files from redownload attemp 2 moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from redownload attemp 2 moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from this folder have been moved by $SCRIPT_FILE." > "$REDOWNLOAD_ATTEMPT_2_FASTQ_FILE_DIR"/readme.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mv "$REDOWNLOAD_ATTEMPT_3_FASTQ_FILE_DIR"/*.gz "$WD"/output/check_passed
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Passed files from redownload attemp 3 moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from redownload attemp 3 moved"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Files from this folder have been moved by $SCRIPT_FILE." > "$REDOWNLOAD_ATTEMPT_3_FASTQ_FILE_DIR"/readme.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS  ...'
date -R

#END
echo '**************************************************'

