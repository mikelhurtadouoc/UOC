#!/bin/bash

########################################################################
#VARIABLES DEFINITION
WD=""

BED_DIR=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-BED FILE EDITION
echo '**************************************************'
echo 'EDITING BED FILE ...'
date -R

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$BED_DIR"/*.bed > "$WD"/output/temp/bed_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BED_FILE; do

    FILE_COL_START=`echo $BED_FILE | sed "s,$BED_DIR,$WD/output/temp,g" | sed 's/.bed/_col_start.txt/g'` 
    FILE_COL_END=`echo $BED_FILE | sed "s,$BED_DIR,$WD/output/temp,g" | sed 's/.bed/_col_end.txt/g'` 
    FILE_COL_CALCULATED_SVLEN=`echo $BED_FILE | sed "s,$BED_DIR,$WD/output/temp,g" | sed 's/.bed/_col_calculated_SV_len.txt/g'` 
    FILE_SVNAME=`echo $BED_FILE | sed "s,$BED_DIR,$WD/output/temp,g" | sed 's/.bed/_col_SV_name.txt/g'` 
    EDITED_BED_FILE=`echo $BED_FILE | sed "s,$BED_DIR,$WD/output,g"`

    cut -f 2 "$BED_FILE" > "$FILE_COL_START"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    cut -f 3 "$BED_FILE" > "$FILE_COL_END"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    paste "$FILE_COL_START" "$FILE_COL_END" | awk '{print $2 - $1}' > "$FILE_COL_CALCULATED_SVLEN"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    cat "$FILE_COL_START" | awk 'BEGIN{OFS="\t"} {printf("%s\tSV_%06d\n", $0, NR)}' | cut -f 2 > "$FILE_SVNAME"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    paste "$BED_FILE" "$FILE_SVNAME" "$FILE_COL_CALCULATED_SVLEN" > "$EDITED_BED_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/bed_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#rm -r "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS ...'
date -R

#END
echo '**************************************************'

