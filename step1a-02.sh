#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

FASTQ_DIR=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS  ...'
date -R

#1-FASTQ FILES COMPRESSION CHECK
echo '**************************************************'
echo 'CHECKING FASTQ FILES COMPRESSION ...'
date -R

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$FASTQ_DIR"/*.fastq.gz > "$WD"/output/temp/fastq_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read FASTQ_FILE; do

    gzip -t "$FASTQ_FILE" &>> "$WD"/output/report.txt

    echo "$FASTQ_FILE done"
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/fastq_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

grep -Fw "gzip: " "$WD"/output/report.txt | sed 's/gzip: //g' | cut -f 1 -d ":" | sort | uniq > "$WD"/output/corrupted_files.txt
grep -Fw "gzip: " "$WD"/output/report.txt | sed "s,$FASTQ_DIR/,,g" | sed 's/gzip: //g' | cut -f 1 -d ":" | sort | uniq > "$WD"/output/corrupted_files_filename.txt

cat "$WD"/output/corrupted_files_filename.txt \
  | sed "s,F01_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140528_D00360_0018_AH8VC6ADXX/Project_RM8391_RM8392/Sample_2A1/F01_,g" \
  | sed "s,F02_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140528_D00360_0019_BH8VDAADXX/Project_RM8391_RM8392/Sample_2A1/F02_,g" \
  | sed "s,F03_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140605_D00360_0020_AH9V1RADXX/Project_RM8391_RM8392/Sample_2A1/F03_,g" \
  | sed "s,F04_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140605_D00360_0021_BH9V1VADXX/Project_RM8391_RM8392/Sample_2A1/F04_,g" \
  | sed "s,F05_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140609_D00360_0022_AH9UJNADXX/Project_RM8391_RM8392/Sample_2A1/F05_,g" \
  | sed "s,F06_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140609_D00360_0023_BH9UD5ADXX/Project_RM8391_RM8392/Sample_2A1/F06_,g" \
  | sed "s,F07_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140611_D00360_0024_AH9TKDADXX/Project_RM8391_RM8392/Sample_2A1/F07_,g" \
  | sed "s,F08_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140611_D00360_0025_BH9UD6ADXX/Project_RM8391_RM8392/Sample_2A1/F08_,g" \
  | sed "s,F09_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140613_D00360_0026_AHA2RRADXX/Project_RM8391_RM8392/Sample_2A1/F09_,g" \
  | sed "s,F10_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140613_D00360_0027_BHA2TEADXX/Project_RM8391_RM8392/Sample_2A1/F10_,g" \
  | sed "s,F11_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140616_D00360_0028_AHA2RLADXX/Project_RM8391_RM8392/Sample_2A1/F11_,g" \
  | sed "s,F12_,ftp://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/HG002_NA24385_son/NIST_HiSeq_HG002_Homogeneity-10953946/HG002_HiSeq300x_fastq/140616_D00360_0029_BHA2WPADXX/Project_RM8391_RM8392/Sample_2A1/F12_,g" \
  | sed "s,F01_,,g" | sed "s,F02_,,g" | sed "s,F03_,,g" | sed "s,F04_,,g" | sed "s,F05_,,g" | sed "s,F06_,,g" | sed "s,F07_,,g" | sed "s,F08_,,g" | sed "s,F09_,,g" | sed "s,F10_,,g" | sed "s,F11_,,g" | sed "s,F12_,,g" \
  | sed "s,_1.fastq.gz,.fastq.gz,g" | sed "s,_2.fastq.gz,.fastq.gz,g" \
  | sed "s,Sample_2A1/2A2,Sample_2A2/2A2,g" | sed "s,Sample_2A1/2B1,Sample_2B1/2B1,g" | sed "s,Sample_2A1/2B2,Sample_2B2/2B2,g" | sed "s,Sample_2A1/2C1,Sample_2C1/2C1,g" | sed "s,Sample_2A1/2C2,Sample_2C2/2C2,g" | sed "s,Sample_2A1/2D1,Sample_2D1/2D1,g" | sed "s,Sample_2A1/2D2,Sample_2D2/2D2,g" | sed "s,Sample_2A1/2F1,Sample_2F1/2F1,g" | sed "s,Sample_2A1/2F2,Sample_2F2/2F2,g" | sed "s,Sample_2A1/2L1,Sample_2L1/2L1,g" | sed "s,Sample_2A1/2L2,Sample_2L2/2L2,g" > "$WD"/output/file_list_to_redownload.txt

rm -r "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS  ...'
date -R

#END
echo '**************************************************'

