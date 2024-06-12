#!/bin/bash

########################################################################

#VARIABLES DEFINITION
WD=""

READS_DIR=""

CONDA_DIR=""
FASTQC_ENV=""

#CHANGE INTO WD AND LOG GENERATION
cd "$WD"

touch file.log
exec 1> >(tee -a file.log) 2>&1

#1-READS QUALITY ASSESSMENT
echo '**************************************************'
echo 'ASSESING READS QUALITY ...'

source "$CONDA_DIR"/activate "$FASTQC_ENV"
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

mkdir "$WD"/output
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

fastqc "$READS_DIR"/*fastq.gz --outdir="$WD"/output --extract
if [ $? -ne 0 ]; then echo 'Script ended with errors.'; exit 1; fi

#END
echo '**************************************************'
