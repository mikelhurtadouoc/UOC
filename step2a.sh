#!/bin/bash

########################################################################

#VARIABLES INSTRUCTIONS


#VARIABLES DEFINITION
WD="/calc/files/mikelhurtado/bioinformatics/UOC-bioinfo-bioest/TFM/from_GIAB_HG002/BWA-MEM_T2T_hs1_UCSC/02_mosdepth"

CONDA_DIR="/software/anaconda3/bin"
MOSDEPTH_ENV="/software/conda-envs/mosdepth"

BAM_DIR="/calc/files/mikelhurtado/bioinformatics/UOC-bioinfo-bioest/TFM/from_GIAB_HG002/BWA-MEM_T2T_hs1_UCSC/01_galaxy_bwa-mem/output"

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#PROCESS START
echo '**************************************************'
echo 'STARTING PROCESS ...'
date -R

#1-MOSDEPTH RUN
echo '**************************************************'
echo 'RUNNING MOSDEPTH ...'
date -R

source "$CONDA_DIR"/activate "$MOSDEPTH_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output
mkdir "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

ls "$BAM_DIR"/*.bam > "$WD"/output/temp/bam_files.txt
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

while read BAM_FILE; do

    OUTPUT_PREFIX=`echo $BAM_FILE | sed "s,$BAM_DIR,$WD/output,g" | sed 's/.bam//g'`

    mosdepth "$OUTPUT_PREFIX" "$BAM_FILE" 
    if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

done < "$WD"/output/temp/bam_files.txt

if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

rm -r "$WD"/output/temp
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

conda deactivate
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#PROCESS END
echo '**************************************************'
echo 'ENDING PROCESS ...'
date -R

#END
echo '**************************************************'

