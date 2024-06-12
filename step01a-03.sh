#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

RAW_FILE_LIST_FILE=""
FILE_LIST_FILE=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS  ...'
date -R

#1-FASTQ FILES DOWNLOAD
echo '**************************************************'
echo 'DOWNLOADING FASTQ FILES  ...'
date -R

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

head -n 82 "$RAW_FILE_LIST_FILE" | tail -n +2 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_01_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 82 "$RAW_FILE_LIST_FILE" | tail -n +2 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_01_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 134 "$RAW_FILE_LIST_FILE" | tail -n +83 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_02_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 134 "$RAW_FILE_LIST_FILE" | tail -n +83 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_02_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 214 "$RAW_FILE_LIST_FILE" | tail -n +135 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_03_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 214 "$RAW_FILE_LIST_FILE" | tail -n +135 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_03_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 294 "$RAW_FILE_LIST_FILE" | tail -n +215 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_04_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 294 "$RAW_FILE_LIST_FILE" | tail -n +215 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_04_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 376 "$RAW_FILE_LIST_FILE" | tail -n +295 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_05_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 376 "$RAW_FILE_LIST_FILE" | tail -n +295 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_05_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 456 "$RAW_FILE_LIST_FILE" | tail -n +377 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_06_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 456 "$RAW_FILE_LIST_FILE" | tail -n +377 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_06_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 536 "$RAW_FILE_LIST_FILE" | tail -n +457 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_07_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 536 "$RAW_FILE_LIST_FILE" | tail -n +457 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_07_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 616 "$RAW_FILE_LIST_FILE" | tail -n +537 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_08_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 616 "$RAW_FILE_LIST_FILE" | tail -n +537 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_08_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 696 "$RAW_FILE_LIST_FILE" | tail -n +617 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_09_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 696 "$RAW_FILE_LIST_FILE" | tail -n +617 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_09_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 776 "$RAW_FILE_LIST_FILE" | tail -n +697 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_10_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 776 "$RAW_FILE_LIST_FILE" | tail -n +697 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_10_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 856 "$RAW_FILE_LIST_FILE" | tail -n +777 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_11_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 856 "$RAW_FILE_LIST_FILE" | tail -n +777 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_11_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 936 "$RAW_FILE_LIST_FILE" | tail -n +857 | cut -f 1 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_12_reads_1.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

head -n 936 "$RAW_FILE_LIST_FILE" | tail -n +857 | cut -f 3 | grep -Fw -f "$FILE_LIST_FILE" > "$WD"/output/redownload_url-links_folder_12_reads_2.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_01
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_01/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_01/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_01_reads_1.txt -P "$WD"/output/temp/folder_01/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_01_reads_2.txt -P "$WD"/output/temp/folder_01/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_01/reads_1/*.fastq.gz > "$WD"/output/folder_01_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_01_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_01_READS_1_FASTQ_FILE=`echo $FOLDER_01_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_01/reads_1/,"$WD"/output/temp/folder_01/reads_1/F01_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_01_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_01_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_01_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_01/reads_2/*.fastq.gz > "$WD"/output/folder_01_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_01_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_01_READS_2_FASTQ_FILE=`echo $FOLDER_01_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_01/reads_2/,"$WD"/output/temp/folder_01/reads_2/F01_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_01_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_01_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_01_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_01/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_01/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 01"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_02
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_02/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_02/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_02_reads_1.txt -P "$WD"/output/temp/folder_02/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_02_reads_2.txt -P "$WD"/output/temp/folder_02/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_02/reads_1/*.fastq.gz > "$WD"/output/folder_02_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_02_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_02_READS_1_FASTQ_FILE=`echo $FOLDER_02_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_02/reads_1/,"$WD"/output/temp/folder_02/reads_1/F02_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_02_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_02_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_02_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_02/reads_2/*.fastq.gz > "$WD"/output/folder_02_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_02_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_02_READS_2_FASTQ_FILE=`echo $FOLDER_02_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_02/reads_2/,"$WD"/output/temp/folder_02/reads_2/F02_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_02_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_02_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_02_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_02/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_02/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 02"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_03
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_03/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_03/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_03_reads_1.txt -P "$WD"/output/temp/folder_03/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_03_reads_2.txt -P "$WD"/output/temp/folder_03/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_03/reads_1/*.fastq.gz > "$WD"/output/folder_03_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_03_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_03_READS_1_FASTQ_FILE=`echo $FOLDER_03_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_03/reads_1/,"$WD"/output/temp/folder_03/reads_1/F03_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_03_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_03_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_03_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_03/reads_2/*.fastq.gz > "$WD"/output/folder_03_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_03_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_03_READS_2_FASTQ_FILE=`echo $FOLDER_03_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_03/reads_2/,"$WD"/output/temp/folder_03/reads_2/F03_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_03_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_03_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_03_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_03/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_03/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 03"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_04
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_04/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_04/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_04_reads_1.txt -P "$WD"/output/temp/folder_04/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_04_reads_2.txt -P "$WD"/output/temp/folder_04/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_04/reads_1/*.fastq.gz > "$WD"/output/folder_04_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_04_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_04_READS_1_FASTQ_FILE=`echo $FOLDER_04_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_04/reads_1/,"$WD"/output/temp/folder_04/reads_1/F04_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_04_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_04_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_04_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_04/reads_2/*.fastq.gz > "$WD"/output/folder_04_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_04_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_04_READS_2_FASTQ_FILE=`echo $FOLDER_04_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_04/reads_2/,"$WD"/output/temp/folder_04/reads_2/F04_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_04_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_04_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_04_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_04/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_04/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 04"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_05
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_05/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_05/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_05_reads_1.txt -P "$WD"/output/temp/folder_05/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_05_reads_2.txt -P "$WD"/output/temp/folder_05/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_05/reads_1/*.fastq.gz > "$WD"/output/folder_05_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_05_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_05_READS_1_FASTQ_FILE=`echo $FOLDER_05_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_05/reads_1/,"$WD"/output/temp/folder_05/reads_1/F05_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_05_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_05_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_05_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_05/reads_2/*.fastq.gz > "$WD"/output/folder_05_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_05_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_05_READS_2_FASTQ_FILE=`echo $FOLDER_05_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_05/reads_2/,"$WD"/output/temp/folder_05/reads_2/F05_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_05_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_05_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_05_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_05/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_05/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 05"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_06
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_06/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_06/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_06_reads_1.txt -P "$WD"/output/temp/folder_06/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_06_reads_2.txt -P "$WD"/output/temp/folder_06/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_06/reads_1/*.fastq.gz > "$WD"/output/folder_06_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_06_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_06_READS_1_FASTQ_FILE=`echo $FOLDER_06_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_06/reads_1/,"$WD"/output/temp/folder_06/reads_1/F06_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_06_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_06_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_06_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_06/reads_2/*.fastq.gz > "$WD"/output/folder_06_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_06_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_06_READS_2_FASTQ_FILE=`echo $FOLDER_06_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_06/reads_2/,"$WD"/output/temp/folder_06/reads_2/F06_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_06_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_06_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_06_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_06/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_06/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 06"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_07
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_07/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_07/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_07_reads_1.txt -P "$WD"/output/temp/folder_07/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_07_reads_2.txt -P "$WD"/output/temp/folder_07/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_07/reads_1/*.fastq.gz > "$WD"/output/folder_07_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_07_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_07_READS_1_FASTQ_FILE=`echo $FOLDER_07_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_07/reads_1/,"$WD"/output/temp/folder_07/reads_1/F07_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_07_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_07_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_07_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_07/reads_2/*.fastq.gz > "$WD"/output/folder_07_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_07_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_07_READS_2_FASTQ_FILE=`echo $FOLDER_07_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_07/reads_2/,"$WD"/output/temp/folder_07/reads_2/F07_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_07_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_07_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_07_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_07/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_07/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 07"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_08
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_08/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_08/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_08_reads_1.txt -P "$WD"/output/temp/folder_08/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_08_reads_2.txt -P "$WD"/output/temp/folder_08/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_08/reads_1/*.fastq.gz > "$WD"/output/folder_08_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_08_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_08_READS_1_FASTQ_FILE=`echo $FOLDER_08_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_08/reads_1/,"$WD"/output/temp/folder_08/reads_1/F08_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_08_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_08_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_08_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_08/reads_2/*.fastq.gz > "$WD"/output/folder_08_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_08_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_08_READS_2_FASTQ_FILE=`echo $FOLDER_08_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_08/reads_2/,"$WD"/output/temp/folder_08/reads_2/F08_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_08_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_08_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_08_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_08/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_08/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 08"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_09
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_09/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_09/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_09_reads_1.txt -P "$WD"/output/temp/folder_09/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_09_reads_2.txt -P "$WD"/output/temp/folder_09/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_09/reads_1/*.fastq.gz > "$WD"/output/folder_09_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_09_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_09_READS_1_FASTQ_FILE=`echo $FOLDER_09_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_09/reads_1/,"$WD"/output/temp/folder_09/reads_1/F09_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_09_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_09_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_09_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_09/reads_2/*.fastq.gz > "$WD"/output/folder_09_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_09_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_09_READS_2_FASTQ_FILE=`echo $FOLDER_09_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_09/reads_2/,"$WD"/output/temp/folder_09/reads_2/F09_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_09_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_09_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_09_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_09/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_09/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 09"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_10
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_10/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_10/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_10_reads_1.txt -P "$WD"/output/temp/folder_10/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_10_reads_2.txt -P "$WD"/output/temp/folder_10/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_10/reads_1/*.fastq.gz > "$WD"/output/folder_10_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_10_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_10_READS_1_FASTQ_FILE=`echo $FOLDER_10_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_10/reads_1/,"$WD"/output/temp/folder_10/reads_1/F10_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_10_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_10_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_10_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_10/reads_2/*.fastq.gz > "$WD"/output/folder_10_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_10_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_10_READS_2_FASTQ_FILE=`echo $FOLDER_10_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_10/reads_2/,"$WD"/output/temp/folder_10/reads_2/F10_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_10_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_10_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_10_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_10/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_10/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 10"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_11
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_11/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_11/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_11_reads_1.txt -P "$WD"/output/temp/folder_11/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_11_reads_2.txt -P "$WD"/output/temp/folder_11/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_11/reads_1/*.fastq.gz > "$WD"/output/folder_11_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_11_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_11_READS_1_FASTQ_FILE=`echo $FOLDER_11_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_11/reads_1/,"$WD"/output/temp/folder_11/reads_1/F11_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_11_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_11_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_11_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_11/reads_2/*.fastq.gz > "$WD"/output/folder_11_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_11_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_11_READS_2_FASTQ_FILE=`echo $FOLDER_11_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_11/reads_2/,"$WD"/output/temp/folder_11/reads_2/F11_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_11_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_11_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_11_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_11/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_11/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 11"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

mkdir "$WD"/output/temp/folder_12
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_12/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp/folder_12/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_12_reads_1.txt -P "$WD"/output/temp/folder_12/reads_1
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 1 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

wget --progress=dot:giga -i "$WD"/output/redownload_url-links_folder_12_reads_2.txt -P "$WD"/output/temp/folder_12/reads_2
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly downloaded reads 2 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_12/reads_1/*.fastq.gz > "$WD"/output/folder_12_reads_1_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_12_READS_1_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_12_READS_1_FASTQ_FILE=`echo $FOLDER_12_READS_1_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_12/reads_1/,"$WD"/output/temp/folder_12/reads_1/F12_,g" | sed 's/.fastq.gz/_1.fastq.gz/g'`

    mv "$FOLDER_12_READS_1_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_12_READS_1_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_12_reads_1_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 1 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/folder_12/reads_2/*.fastq.gz > "$WD"/output/folder_12_reads_2_fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FOLDER_12_READS_2_FASTQ_FILE; do

    EDITED_FILENAME_FOLDER_12_READS_2_FASTQ_FILE=`echo $FOLDER_12_READS_2_FASTQ_FILE | sed "s,"$WD"/output/temp/folder_12/reads_2/,"$WD"/output/temp/folder_12/reads_2/F12_,g" | sed 's/.fastq.gz/_2.fastq.gz/g'`

    mv "$FOLDER_12_READS_2_FASTQ_FILE" "$EDITED_FILENAME_FOLDER_12_READS_2_FASTQ_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/folder_12_reads_2_fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly renamed reads 2 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_12/reads_1/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 1 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mv "$WD"/output/temp/folder_12/reads_2/*.fastq.gz "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly moved reads 2 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

echo "Correctly saved reads 1 and 2 from folder 12"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

####################

rm -r "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS  ...'
date -R

#END
echo '**************************************************'

