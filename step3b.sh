#!/bin/bash

########################################################################

#VARIABLES INSTRUCTIONS


#VARIABLES DEFINITION
WD=""

VCF_DIR=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-VCF FILE TO BED FILE CONVERSION
echo '**************************************************'
echo 'CONVERTING VCF FILE INTO BED FILE ...'
date -R

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

cp "$VCF_DIR"/*.vcf "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

cp "$VCF_DIR"/*.vcf.gz "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/*.vcf.gz > "$WD"/output/temp/compressed_vcf_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read COMPRESSED_VCF_FILE; do

    gzip -d "$COMPRESSED_VCF_FILE"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/compressed_vcf_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/delly*.vcf > "$WD"/output/temp/delly_vcf_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read DELLY_VCF_FILE; do

    BED_FILE_FILENAME_NO_EXT=`echo $DELLY_VCF_FILE | sed 's,.*/,,g' | sed 's/.vcf//g'`

    grep ";SVTYPE=DEL" "$DELLY_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DEL_SV_lines.txt
    
    grep ";SVTYPE=INS" "$DELLY_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_INS_SV_lines.txt
    
    grep ";SVTYPE=DUP" "$DELLY_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DUP_SV_lines.txt
    
    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DEL_SV_lines.txt > "$WD"/output/temp/delly_DEL_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DEL_SV_LINES_FILE; do

        FILE_COL_1=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_3=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DEL_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DEL_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DEL_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^END=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/END=//g' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/delly_DEL_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*INS_SV_lines.txt > "$WD"/output/temp/delly_INS_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read INS_SV_LINES_FILE; do

        FILE_COL_1=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$INS_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$INS_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$INS_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/delly_INS_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DUP_SV_lines.txt > "$WD"/output/temp/delly_DUP_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DUP_SV_LINES_FILE; do

        FILE_COL_1=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_3=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DUP_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DUP_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DUP_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^END=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/END=//g' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/delly_DUP_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
    
done < "$WD"/output/temp/delly_vcf_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/lumpy*.vcf > "$WD"/output/temp/lumpy_vcf_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read LUMPY_VCF_FILE; do

    BED_FILE_FILENAME_NO_EXT=`echo $LUMPY_VCF_FILE | sed 's,.*/,,g' | sed 's/.vcf//g'`

    grep "SVTYPE=DEL" "$LUMPY_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DEL_SV_lines.txt
    
    grep "SVTYPE=INS" "$LUMPY_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_INS_SV_lines.txt
    
    grep "SVTYPE=DUP" "$LUMPY_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DUP_SV_lines.txt
    
    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DEL_SV_lines.txt > "$WD"/output/temp/lumpy_DEL_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DEL_SV_LINES_FILE; do

        FILE_COL_1=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_3=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DEL_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DEL_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DEL_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^END=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/END=//g' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/lumpy_DEL_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*INS_SV_lines.txt > "$WD"/output/temp/lumpy_INS_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read INS_SV_LINES_FILE; do

        FILE_COL_1=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$INS_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$INS_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$INS_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/lumpy_INS_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DUP_SV_lines.txt > "$WD"/output/temp/lumpy_DUP_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DUP_SV_LINES_FILE; do

        FILE_COL_1=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DUP_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DUP_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DUP_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/lumpy_DUP_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/lumpy_vcf_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/manta*.vcf > "$WD"/output/temp/manta_vcf_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read MANTA_VCF_FILE; do

    BED_FILE_FILENAME_NO_EXT=`echo $MANTA_VCF_FILE | sed 's,.*/,,g' | sed 's/.vcf//g'`

    grep ";SVTYPE=DEL" "$MANTA_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DEL_SV_lines.txt
    
    grep ";SVTYPE=INS" "$MANTA_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_INS_SV_lines.txt
    
    grep ";SVTYPE=DUP" "$MANTA_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DUP_SV_lines.txt
    
    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DEL_SV_lines.txt > "$WD"/output/temp/manta_DEL_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DEL_SV_LINES_FILE; do

        FILE_COL_1=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_3=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DEL_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DEL_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DEL_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^END=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/END=//g' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/manta_DEL_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*INS_SV_lines.txt > "$WD"/output/temp/manta_INS_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read INS_SV_LINES_FILE; do

        FILE_COL_1=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$INS_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$INS_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$INS_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/manta_INS_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DUP_SV_lines.txt > "$WD"/output/temp/manta_DUP_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DUP_SV_LINES_FILE; do

        FILE_COL_1=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DUP_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DUP_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DUP_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/manta_DUP_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/manta_vcf_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$WD"/output/temp/wham*.vcf > "$WD"/output/temp/wham_vcf_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read WHAM_VCF_FILE; do

    BED_FILE_FILENAME_NO_EXT=`echo $WHAM_VCF_FILE | sed 's,.*/,,g' | sed 's/.vcf//g'`

    grep ";SVTYPE=DEL" "$WHAM_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DEL_SV_lines.txt
    
    grep ";SVTYPE=INS" "$WHAM_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_INS_SV_lines.txt
    
    grep ";SVTYPE=DUP" "$WHAM_VCF_FILE" | grep -v "##INFO" > "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"_DUP_SV_lines.txt
    
    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DEL_SV_lines.txt > "$WD"/output/temp/wham_DEL_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DEL_SV_LINES_FILE; do

        FILE_COL_1=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_3=`echo $DEL_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DEL_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DEL_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DEL_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DEL_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^END=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/END=//g' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/wham_DEL_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*INS_SV_lines.txt > "$WD"/output/temp/wham_INS_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read INS_SV_LINES_FILE; do

        FILE_COL_1=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $INS_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $INS_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$INS_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$INS_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$INS_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/wham_INS_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    ls "$WD"/output/temp/"$BED_FILE_FILENAME_NO_EXT"*DUP_SV_lines.txt > "$WD"/output/temp/wham_DUP_SV_lines_files.txt
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

    while read DUP_SV_LINES_FILE; do

        FILE_COL_1=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_1.txt/g'`
        FILE_COL_2=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_2.txt/g'`
        MODIFIED_SV_LINES_FILE=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_modified_SV_lines.txt/g'`
        FILE_COL_SVLEN=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_svlen.txt/g'`
        FILE_COL_3=`echo $DUP_SV_LINES_FILE | sed 's/_SV_lines.txt/_col_3.txt/g'`
        BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.bed/g'`
        UNIQ_BED_FILE=`echo $DUP_SV_LINES_FILE | sed "s,$WD/output/temp,$WD/output,g" | sed 's/_SV_lines.txt/.uniq.bed/g'`

        cut -f 1 "$DUP_SV_LINES_FILE" > "$FILE_COL_1"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        cut -f 2 "$DUP_SV_LINES_FILE" > "$FILE_COL_2"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        sed 's/\t/;/g' "$DUP_SV_LINES_FILE" > "$MODIFIED_SV_LINES_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        awk -F';' '{for(i=1;i<=NF;i++) if($i ~ /^SVLEN=/) print $i}' "$MODIFIED_SV_LINES_FILE" | sed 's/SVLEN=//g' > "$FILE_COL_SVLEN"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_2" "$FILE_COL_SVLEN" | awk '{print $1 + $2}' > "$FILE_COL_3"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        paste "$FILE_COL_1" "$FILE_COL_2" "$FILE_COL_3" > "$BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

        uniq "$BED_FILE" > "$UNIQ_BED_FILE"
        if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi
        
    done < "$WD"/output/temp/wham_DUP_SV_lines_files.txt

    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/wham_vcf_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#rm -r "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS ...'
date -R

#END
echo '**************************************************'

