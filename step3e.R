#VARIABLES DEFINITION
wd <- ""

setwd(wd)

pre_liftover_GIAB_GS_DEL_PATH <- “”  
pre_liftover_GIAB_GS_INS_PATH <- “”  
pre_liftover_GIAB_GS_DUP_PATH <- “”  

GIAB_hg38_GS_DEL_PATH <- “”  
GIAB_hg38_GS_INS_PATH <- “”  
GIAB_hg38_GS_DUP_PATH <- “”  
GIAB_T2T_GS_DEL_PATH <- “”  
GIAB_T2T_GS_INS_PATH <- “”  
GIAB_T2T_GS_DUP_PATH <- “”  
    
GIAB_hg38_GS_DEL_err_PATH <- “”  
GIAB_hg38_GS_INS_err_PATH <- “”  
GIAB_hg38_GS_DUP_err_PATH <- “”  
GIAB_T2T_GS_DEL_err_PATH <- “”  
GIAB_T2T_GS_INS_err_PATH <- “”  
GIAB_T2T_GS_DUP_err_PATH <- “”  
    
GIAB_hg38_delly_TP_DEL_PATH <- “”  
GIAB_hg38_delly_TP_INS_PATH <- “”  
GIAB_hg38_delly_TP_DUP_PATH <- “”  
    
GIAB_hg38_lumpy_TP_DEL_PATH <- “”  
GIAB_hg38_lumpy_TP_INS_PATH <- “”  
GIAB_hg38_lumpy_TP_DUP_PATH <- “”  
    
GIAB_hg38_manta_TP_DEL_PATH <- “”  
GIAB_hg38_manta_TP_INS_PATH <- “”  
GIAB_hg38_manta_TP_DUP_PATH <- “”  
    
GIAB_hg38_wham_TP_DEL_PATH <- “”  
GIAB_hg38_wham_TP_INS_PATH <- “”  
GIAB_hg38_wham_TP_DUP_PATH <- “”  
    
GIAB_T2T_delly_TP_DEL_PATH <- “”  
GIAB_T2T_delly_TP_INS_PATH <- “”  
GIAB_T2T_delly_TP_DUP_PATH <- “”  
    
GIAB_T2T_lumpy_TP_DEL_PATH <- “”  
GIAB_T2T_lumpy_TP_INS_PATH <- “”  
GIAB_T2T_lumpy_TP_DUP_PATH <- “”  
    
GIAB_T2T_manta_TP_DEL_PATH <- “”  
GIAB_T2T_manta_TP_INS_PATH <- “”  
GIAB_T2T_manta_TP_DUP_PATH <- “”  
    
GIAB_T2T_wham_TP_DEL_PATH <- “”  
GIAB_T2T_wham_TP_INS_PATH <- “”  
GIAB_T2T_wham_TP_DUP_PATH <- “”  
    
GIAB_hg38_delly_TOT_DEL_PATH <- “”  
GIAB_hg38_delly_TOT_INS_PATH <- “”  
GIAB_hg38_delly_TOT_DUP_PATH <- “”  
    
GIAB_hg38_lumpy_TOT_DEL_PATH <- “”  
GIAB_hg38_lumpy_TOT_INS_PATH <- “”  
GIAB_hg38_lumpy_TOT_DUP_PATH <- “”  
    
GIAB_hg38_manta_TOT_DEL_PATH <- “”  
GIAB_hg38_manta_TOT_INS_PATH <- “”  
GIAB_hg38_manta_TOT_DUP_PATH <- “”  
    
GIAB_hg38_wham_TOT_DEL_PATH <- “”  
GIAB_hg38_wham_TOT_INS_PATH <- “”  
GIAB_hg38_wham_TOT_DUP_PATH <- “”  
    
GIAB_T2T_delly_TOT_DEL_PATH <- “”  
GIAB_T2T_delly_TOT_INS_PATH <- “”  
GIAB_T2T_delly_TOT_DUP_PATH <- “”  
    
GIAB_T2T_lumpy_TOT_DEL_PATH <- “”  
GIAB_T2T_lumpy_TOT_INS_PATH <- “”  
GIAB_T2T_lumpy_TOT_DUP_PATH <- “”  
    
GIAB_T2T_manta_TOT_DEL_PATH <- “”  
GIAB_T2T_manta_TOT_INS_PATH <- “”  
GIAB_T2T_manta_TOT_DUP_PATH <- “”  
    
GIAB_T2T_wham_TOT_DEL_PATH <- “”  
GIAB_T2T_wham_TOT_INS_PATH <- “”  
GIAB_T2T_wham_TOT_DUP_PATH <- “”  
    
pre_liftover_GIAB_GS_DEL <- “”  
pre_liftover_GIAB_GS_INS <- “”  
pre_liftover_GIAB_GS_DUP <- “”  
    
GIAB_hg38_GS_DEL <- “”  
GIAB_hg38_GS_INS <- “”  
GIAB_hg38_GS_DUP <- “”  
GIAB_T2T_GS_DEL <- “”  
GIAB_T2T_GS_INS <- “”  
GIAB_T2T_GS_DUP <- “”  
    
GIAB_hg38_GS_DEL_err <- “”  
GIAB_hg38_GS_INS_err <- “”  
GIAB_hg38_GS_DUP_err <- “”  
GIAB_T2T_GS_DEL_err <- “”  
GIAB_T2T_GS_INS_err <- “”  
GIAB_T2T_GS_DUP_err <- “”  
    
GIAB_hg38_delly_TP_DEL <- “”  
GIAB_hg38_delly_TP_INS <- “”  
GIAB_hg38_delly_TP_DUP <- “”  
    
GIAB_hg38_lumpy_TP_DEL <- “”  
GIAB_hg38_lumpy_TP_INS <- “”  
GIAB_hg38_lumpy_TP_DUP <- “”  
    
GIAB_hg38_manta_TP_DEL <- “”  
GIAB_hg38_manta_TP_INS <- “”  
GIAB_hg38_manta_TP_DUP <- “”  
    
GIAB_hg38_wham_TP_DEL <- “”  
GIAB_hg38_wham_TP_INS <- “”  
GIAB_hg38_wham_TP_DUP <- “”  
    
GIAB_T2T_delly_TP_DEL <- “”  
GIAB_T2T_delly_TP_INS <- “”  
GIAB_T2T_delly_TP_DUP <- “”  
    
GIAB_T2T_lumpy_TP_DEL <- “”  
GIAB_T2T_lumpy_TP_INS <- “”  
GIAB_T2T_lumpy_TP_DUP <- “”  
    
GIAB_T2T_manta_TP_DEL <- “”  
GIAB_T2T_manta_TP_INS <- “”  
GIAB_T2T_manta_TP_DUP <- “”  
    
GIAB_T2T_wham_TP_DEL <- “”  
GIAB_T2T_wham_TP_INS <- “”  
GIAB_T2T_wham_TP_DUP <- “”  
    
GIAB_hg38_delly_TOT_DEL <- “”  
GIAB_hg38_delly_TOT_INS <- “”  
GIAB_hg38_delly_TOT_DUP <- “”  
    
GIAB_hg38_lumpy_TOT_DEL <- “”  
GIAB_hg38_lumpy_TOT_INS <- “”  
GIAB_hg38_lumpy_TOT_DUP <- “”  
    
GIAB_hg38_manta_TOT_DEL <- “”  
GIAB_hg38_manta_TOT_INS <- “”  
GIAB_hg38_manta_TOT_DUP <- “”  
    
GIAB_hg38_wham_TOT_DEL <- “”  
GIAB_hg38_wham_TOT_INS <- “”  
GIAB_hg38_wham_TOT_DUP <- “”  
    
GIAB_T2T_delly_TOT_DEL <- “”  
GIAB_T2T_delly_TOT_INS <- “”  
GIAB_T2T_delly_TOT_DUP <- “”  
    
GIAB_T2T_lumpy_TOT_DEL <- “”  
GIAB_T2T_lumpy_TOT_INS <- “”  
GIAB_T2T_lumpy_TOT_DUP <- “”  
    
GIAB_T2T_manta_TOT_DEL <- “”  
GIAB_T2T_manta_TOT_INS <- “”  
GIAB_T2T_manta_TOT_DUP <- “”  
    
GIAB_T2T_wham_TOT_DEL <- “”  
GIAB_T2T_wham_TOT_INS <- “”  
GIAB_T2T_wham_TOT_DUP <- “”  
    
pre_liftover_GIAB_GS_DEL$V4 <- “”  
pre_liftover_GIAB_GS_INS$V4 <- “”  
pre_liftover_GIAB_GS_DUP$V4 <- “”  
    
GIAB_hg38_GS_DEL$V8 <- “”  
GIAB_hg38_GS_INS$V8 <- “”  
GIAB_hg38_GS_DUP$V8 <- “”  
GIAB_T2T_GS_DEL$V8 <- “”  
GIAB_T2T_GS_INS$V8 <- “”  
GIAB_T2T_GS_DUP$V8 <- “”  
    
GIAB_hg38_delly_TP_DEL$V8 <- “”  
GIAB_hg38_delly_TP_INS$V8 <- “”  
GIAB_hg38_delly_TP_DUP$V8 <- “”  
    
GIAB_hg38_lumpy_TP_DEL$V8 <- “”  
GIAB_hg38_lumpy_TP_INS$V8 <- “”  
GIAB_hg38_lumpy_TP_DUP$V8 <- “”  
    
GIAB_hg38_manta_TP_DEL$V8 <- “”  
GIAB_hg38_manta_TP_INS$V8 <- “”  
GIAB_hg38_manta_TP_DUP$V8 <- “”  
    
GIAB_hg38_wham_TP_DEL$V8 <- “”  
GIAB_hg38_wham_TP_INS$V8 <- “”  
GIAB_hg38_wham_TP_DUP$V8 <- “”  
    
GIAB_T2T_delly_TP_DEL$V8 <- “”  
GIAB_T2T_delly_TP_INS$V8 <- “”  
GIAB_T2T_delly_TP_DUP$V8 <- “”  
    
GIAB_T2T_lumpy_TP_DEL$V8 <- “”  
GIAB_T2T_lumpy_TP_INS$V8 <- “”  
GIAB_T2T_lumpy_TP_DUP$V8 <- “”  
    
GIAB_T2T_manta_TP_DEL$V8 <- “”  
GIAB_T2T_manta_TP_INS$V8 <- “”  
GIAB_T2T_manta_TP_DUP$V8 <- “”  
    
GIAB_T2T_wham_TP_DEL$V8 <- “”  
GIAB_T2T_wham_TP_INS$V8 <- “”  
GIAB_T2T_wham_TP_DUP$V8 <- “”  
    
GIAB_hg38_delly_TOT_DEL$V4 <- “”  
GIAB_hg38_delly_TOT_INS$V4 <- “”  
GIAB_hg38_delly_TOT_DUP$V4 <- “”  
    
GIAB_hg38_lumpy_TOT_DEL$V4 <- “”  
GIAB_hg38_lumpy_TOT_INS$V4 <- “”  
GIAB_hg38_lumpy_TOT_DUP$V4 <- “”  
    
GIAB_hg38_manta_TOT_DEL$V4 <- “”  
GIAB_hg38_manta_TOT_INS$V4 <- “”  
GIAB_hg38_manta_TOT_DUP$V4 <- “”  
    
GIAB_hg38_wham_TOT_DEL$V4 <- “”  
GIAB_hg38_wham_TOT_INS$V4 <- “”  
GIAB_hg38_wham_TOT_DUP$V4 <- “”  
    
GIAB_T2T_delly_TOT_DEL$V4 <- “”  
GIAB_T2T_delly_TOT_INS$V4 <- “”  
GIAB_T2T_delly_TOT_DUP$V4 <- “”  
    
GIAB_T2T_lumpy_TOT_DEL$V4 <- “”  
GIAB_T2T_lumpy_TOT_INS$V4 <- “”  
GIAB_T2T_lumpy_TOT_DUP$V4 <- “”  
    
GIAB_T2T_manta_TOT_DEL$V4 <- “”  
GIAB_T2T_manta_TOT_INS$V4 <- “”  
GIAB_T2T_manta_TOT_DUP$V4 <- “”  
    
GIAB_T2T_wham_TOT_DEL$V4 <- “”  
GIAB_T2T_wham_TOT_INS$V4 <- “”  
GIAB_T2T_wham_TOT_DUP$V4 <- “”  
    
pre_liftover_GIAB_GS_DEL$V5 <- pre_liftover_GIAB_GS_DEL$V3 - pre_liftover_GIAB_GS_DEL$V2
pre_liftover_GIAB_GS_INS$V5 <- pre_liftover_GIAB_GS_INS$V3 - pre_liftover_GIAB_GS_INS$V2
pre_liftover_GIAB_GS_DUP$V5 <- pre_liftover_GIAB_GS_DUP$V3 - pre_liftover_GIAB_GS_DUP$V2
    
GIAB_hg38_delly_TOT_DEL$V5 <- GIAB_hg38_delly_TOT_DEL$V3 - GIAB_hg38_delly_TOT_DEL$V2
GIAB_hg38_delly_TOT_INS$V5 <- GIAB_hg38_delly_TOT_INS$V3 - GIAB_hg38_delly_TOT_INS$V2
GIAB_hg38_delly_TOT_DUP$V5 <- GIAB_hg38_delly_TOT_DUP$V3 - GIAB_hg38_delly_TOT_DUP$V2
    
GIAB_hg38_lumpy_TOT_DEL$V5 <- GIAB_hg38_lumpy_TOT_DEL$V3 - GIAB_hg38_lumpy_TOT_DEL$V2
GIAB_hg38_lumpy_TOT_INS$V5 <- GIAB_hg38_lumpy_TOT_INS$V3 - GIAB_hg38_lumpy_TOT_INS$V2
GIAB_hg38_lumpy_TOT_DUP$V5 <- GIAB_hg38_lumpy_TOT_DUP$V3 - GIAB_hg38_lumpy_TOT_DUP$V2
    
GIAB_hg38_manta_TOT_DEL$V5 <- GIAB_hg38_manta_TOT_DEL$V3 - GIAB_hg38_manta_TOT_DEL$V2
GIAB_hg38_manta_TOT_INS$V5 <- GIAB_hg38_manta_TOT_INS$V3 - GIAB_hg38_manta_TOT_INS$V2
GIAB_hg38_manta_TOT_DUP$V5 <- GIAB_hg38_manta_TOT_DUP$V3 - GIAB_hg38_manta_TOT_DUP$V2
    
GIAB_hg38_wham_TOT_DEL$V5 <- GIAB_hg38_wham_TOT_DEL$V3 - GIAB_hg38_wham_TOT_DEL$V2
GIAB_hg38_wham_TOT_INS$V5 <- GIAB_hg38_wham_TOT_INS$V3 - GIAB_hg38_wham_TOT_INS$V2
GIAB_hg38_wham_TOT_DUP$V5 <- GIAB_hg38_wham_TOT_DUP$V3 - GIAB_hg38_wham_TOT_DUP$V2
    
GIAB_T2T_delly_TOT_DEL$V5 <- GIAB_T2T_delly_TOT_DEL$V3 - GIAB_T2T_delly_TOT_DEL$V2
GIAB_T2T_delly_TOT_INS$V5 <- GIAB_T2T_delly_TOT_INS$V3 - GIAB_T2T_delly_TOT_INS$V2
GIAB_T2T_delly_TOT_DUP$V5 <- GIAB_T2T_delly_TOT_DUP$V3 - GIAB_T2T_delly_TOT_DUP$V2
    
GIAB_T2T_lumpy_TOT_DEL$V5 <- GIAB_T2T_lumpy_TOT_DEL$V3 - GIAB_T2T_lumpy_TOT_DEL$V2
GIAB_T2T_lumpy_TOT_INS$V5 <- GIAB_T2T_lumpy_TOT_INS$V3 - GIAB_T2T_lumpy_TOT_INS$V2
GIAB_T2T_lumpy_TOT_DUP$V5 <- GIAB_T2T_lumpy_TOT_DUP$V3 - GIAB_T2T_lumpy_TOT_DUP$V2
    
GIAB_T2T_manta_TOT_DEL$V5 <- GIAB_T2T_manta_TOT_DEL$V3 - GIAB_T2T_manta_TOT_DEL$V2
GIAB_T2T_manta_TOT_INS$V5 <- GIAB_T2T_manta_TOT_INS$V3 - GIAB_T2T_manta_TOT_INS$V2
GIAB_T2T_manta_TOT_DUP$V5 <- GIAB_T2T_manta_TOT_DUP$V3 - GIAB_T2T_manta_TOT_DUP$V2
    
GIAB_T2T_wham_TOT_DEL$V5 <- GIAB_T2T_wham_TOT_DEL$V3 - GIAB_T2T_wham_TOT_DEL$V2
GIAB_T2T_wham_TOT_INS$V5 <- GIAB_T2T_wham_TOT_INS$V3 - GIAB_T2T_wham_TOT_INS$V2
GIAB_T2T_wham_TOT_DUP$V5 <- GIAB_T2T_wham_TOT_DUP$V3 - GIAB_T2T_wham_TOT_DUP$V2
    
pre_liftover_GIAB_GS_DEL_COUNT <- “”  
pre_liftover_GIAB_GS_INS_COUNT <- “”  
pre_liftover_GIAB_GS_DUP_COUNT <- “”  
    
GIAB_hg38_GS_DEL_COUNT <- “”  
GIAB_hg38_GS_INS_COUNT <- “”  
GIAB_hg38_GS_DUP_COUNT <- “”  
GIAB_T2T_GS_DEL_COUNT <- “”  
GIAB_T2T_GS_INS_COUNT <- “”  
GIAB_T2T_GS_DUP_COUNT <- “”  
    
GIAB_hg38_GS_DEL_err_COUNT <- “”  
GIAB_hg38_GS_INS_err_COUNT <- “”  
GIAB_hg38_GS_DUP_err_COUNT <- “”  
GIAB_T2T_GS_DEL_err_COUNT <- “”  
GIAB_T2T_GS_INS_err_COUNT <- “”  
GIAB_T2T_GS_DUP_err_COUNT <- “”  
    
GIAB_hg38_delly_TP_DEL_COUNT <- “”  
GIAB_hg38_delly_TP_INS_COUNT <- “”  
GIAB_hg38_delly_TP_DUP_COUNT <- “”  
    
GIAB_hg38_lumpy_TP_DEL_COUNT <- “”  
GIAB_hg38_lumpy_TP_INS_COUNT <- “”  
GIAB_hg38_lumpy_TP_DUP_COUNT <- “”  
    
GIAB_hg38_manta_TP_DEL_COUNT <- “”  
GIAB_hg38_manta_TP_INS_COUNT <- “”  
GIAB_hg38_manta_TP_DUP_COUNT <- “”  
    
GIAB_hg38_wham_TP_DEL_COUNT <- “”  
GIAB_hg38_wham_TP_INS_COUNT <- “”  
GIAB_hg38_wham_TP_DUP_COUNT <- “”  
    
GIAB_T2T_delly_TP_DEL_COUNT <- “”  
GIAB_T2T_delly_TP_INS_COUNT <- “”  
GIAB_T2T_delly_TP_DUP_COUNT <- “”  
    
GIAB_T2T_lumpy_TP_DEL_COUNT <- “”  
GIAB_T2T_lumpy_TP_INS_COUNT <- “”  
GIAB_T2T_lumpy_TP_DUP_COUNT <- “”  
    
GIAB_T2T_manta_TP_DEL_COUNT <- “”  
GIAB_T2T_manta_TP_INS_COUNT <- “”  
GIAB_T2T_manta_TP_DUP_COUNT <- “”  
    
GIAB_T2T_wham_TP_DEL_COUNT <- “”  
GIAB_T2T_wham_TP_INS_COUNT <- “”  
GIAB_T2T_wham_TP_DUP_COUNT <- “”  
    
GIAB_hg38_delly_TOT_DEL_COUNT <- “”  
GIAB_hg38_delly_TOT_INS_COUNT <- “”  
GIAB_hg38_delly_TOT_DUP_COUNT <- “”  
    
GIAB_hg38_lumpy_TOT_DEL_COUNT <- “”  
GIAB_hg38_lumpy_TOT_INS_COUNT <- “”  
GIAB_hg38_lumpy_TOT_DUP_COUNT <- “”  
    
GIAB_hg38_manta_TOT_DEL_COUNT <- “”  
GIAB_hg38_manta_TOT_INS_COUNT <- “”  
GIAB_hg38_manta_TOT_DUP_COUNT <- “”  
    
GIAB_hg38_wham_TOT_DEL_COUNT <- “”  
GIAB_hg38_wham_TOT_INS_COUNT <- “”  
GIAB_hg38_wham_TOT_DUP_COUNT <- “”  
    
GIAB_T2T_delly_TOT_DEL_COUNT <- “”  
GIAB_T2T_delly_TOT_INS_COUNT <- “”  
GIAB_T2T_delly_TOT_DUP_COUNT <- “”  
    
GIAB_T2T_lumpy_TOT_DEL_COUNT <- “”  
GIAB_T2T_lumpy_TOT_INS_COUNT <- “”  
GIAB_T2T_lumpy_TOT_DUP_COUNT <- “”  
    
GIAB_T2T_manta_TOT_DEL_COUNT <- “”  
GIAB_T2T_manta_TOT_INS_COUNT <- “”  
GIAB_T2T_manta_TOT_DUP_COUNT <- “”  
    
GIAB_T2T_wham_TOT_DEL_COUNT <- “”  
GIAB_T2T_wham_TOT_INS_COUNT <- “”  
GIAB_T2T_wham_TOT_DUP_COUNT <- “”  


################################################################################

GS <- c(GIAB_hg38_GS_DEL_COUNT, GIAB_hg38_GS_INS_COUNT, GIAB_hg38_GS_DUP_COUNT, GIAB_hg38_GS_DEL_COUNT, GIAB_hg38_GS_INS_COUNT, GIAB_hg38_GS_DUP_COUNT, GIAB_hg38_GS_DEL_COUNT, GIAB_hg38_GS_INS_COUNT, GIAB_hg38_GS_DUP_COUNT, GIAB_hg38_GS_DEL_COUNT, GIAB_hg38_GS_INS_COUNT, GIAB_hg38_GS_DUP_COUNT, GIAB_T2T_GS_DEL_COUNT, GIAB_T2T_GS_INS_COUNT, GIAB_T2T_GS_DUP_COUNT, GIAB_T2T_GS_DEL_COUNT, GIAB_T2T_GS_INS_COUNT, GIAB_T2T_GS_DUP_COUNT, GIAB_T2T_GS_DEL_COUNT, GIAB_T2T_GS_INS_COUNT, GIAB_T2T_GS_DUP_COUNT, GIAB_T2T_GS_DEL_COUNT, GIAB_T2T_GS_INS_COUNT, GIAB_T2T_GS_DUP_COUNT)
TOT <- c(GIAB_hg38_delly_TOT_DEL_COUNT, GIAB_hg38_delly_TOT_INS_COUNT, GIAB_hg38_delly_TOT_DUP_COUNT, GIAB_hg38_lumpy_TOT_DEL_COUNT, GIAB_hg38_lumpy_TOT_INS_COUNT, GIAB_hg38_lumpy_TOT_DUP_COUNT, GIAB_hg38_manta_TOT_DEL_COUNT, GIAB_hg38_manta_TOT_INS_COUNT, GIAB_hg38_manta_TOT_DUP_COUNT, GIAB_hg38_wham_TOT_DEL_COUNT, GIAB_hg38_wham_TOT_INS_COUNT, GIAB_hg38_wham_TOT_DUP_COUNT, GIAB_T2T_delly_TOT_DEL_COUNT, GIAB_T2T_delly_TOT_INS_COUNT, GIAB_T2T_delly_TOT_DUP_COUNT, GIAB_T2T_lumpy_TOT_DEL_COUNT, GIAB_T2T_lumpy_TOT_INS_COUNT, GIAB_T2T_lumpy_TOT_DUP_COUNT, GIAB_T2T_manta_TOT_DEL_COUNT, GIAB_T2T_manta_TOT_INS_COUNT, GIAB_T2T_manta_TOT_DUP_COUNT, GIAB_T2T_wham_TOT_DEL_COUNT, GIAB_T2T_wham_TOT_INS_COUNT, GIAB_T2T_wham_TOT_DUP_COUNT)
TP <- c(GIAB_hg38_delly_TP_DEL_COUNT, GIAB_hg38_delly_TP_INS_COUNT, GIAB_hg38_delly_TP_DUP_COUNT, GIAB_hg38_lumpy_TP_DEL_COUNT, GIAB_hg38_lumpy_TP_INS_COUNT, GIAB_hg38_lumpy_TP_DUP_COUNT, GIAB_hg38_manta_TP_DEL_COUNT, GIAB_hg38_manta_TP_INS_COUNT, GIAB_hg38_manta_TP_DUP_COUNT, GIAB_hg38_wham_TP_DEL_COUNT, GIAB_hg38_wham_TP_INS_COUNT, GIAB_hg38_wham_TP_DUP_COUNT, GIAB_T2T_delly_TP_DEL_COUNT, GIAB_T2T_delly_TP_INS_COUNT, GIAB_T2T_delly_TP_DUP_COUNT, GIAB_T2T_lumpy_TP_DEL_COUNT, GIAB_T2T_lumpy_TP_INS_COUNT, GIAB_T2T_lumpy_TP_DUP_COUNT, GIAB_T2T_manta_TP_DEL_COUNT, GIAB_T2T_manta_TP_INS_COUNT, GIAB_T2T_manta_TP_DUP_COUNT, GIAB_T2T_wham_TP_DEL_COUNT, GIAB_T2T_wham_TP_INS_COUNT, GIAB_T2T_wham_TP_DUP_COUNT)
FN <- GS-TP
FP <- TOT-TP
SEN <- round(TP*100/(TP+FN), 2)
PRE <- round(TP*100/(TP+FP), 2)
FP_per <- round(FP*100/(TP+FN), 2)

sample <- c(rep("GIAB_HG002", 24))
genome <- c(rep("GRCh38", 12), rep("T2T", 12))
SV_caller <- rep(c(rep("DELLY", 3), rep("LUMPY", 3), rep("Manta", 3), rep("Wham", 3)), 2)
SV_type <- rep(c("DEL", "INS", "DUP"), 8)
pipeline <- paste(genome, SV_caller, sep = "_")
run <- c("GIAB_hg38_delly_DEL", "GIAB_hg38_delly_INS", "GIAB_hg38_delly_DUP", "GIAB_hg38_lumpy_DEL", "GIAB_hg38_lumpy_INS", "GIAB_hg38_lumpy_DUP", "GIAB_hg38_manta_DEL", "GIAB_hg38_manta_INS", "GIAB_hg38_manta_DUP", "GIAB_hg38_wham_DEL", "GIAB_hg38_wham_INS", "GIAB_hg38_wham_DUP", "GIAB_T2T_delly_DEL", "GIAB_T2T_delly_INS", "GIAB_T2T_delly_DUP", "GIAB_T2T_lumpy_DEL", "GIAB_T2T_lumpy_INS", "GIAB_T2T_lumpy_DUP", "GIAB_T2T_manta_DEL", "GIAB_T2T_manta_INS", "GIAB_T2T_manta_DUP", "GIAB_T2T_wham_DEL", "GIAB_T2T_wham_INS", "GIAB_T2T_wham_DUP")


results_table <- as.data.frame(cbind(run, sample, genome, SV_caller, pipeline, SV_type, GS, TOT, TP, FN, FP, SEN, PRE, FP_per))
colnames(results_table) <- c("Run", "Sample", "Genome",  "SV_caller", "Pipeline", "SV_type", "Benchmark_positives", "Pipeline_positives", "TP", "FN", "FP", "Sensitivity", "Precision", "FP_percentage")
results_table$Run <- as.factor(results_table$Run)
results_table$Sample <- as.factor(results_table$Sample)
results_table$Genome <- as.factor(results_table$Genome)
results_table$SV_caller <- as.factor(results_table$SV_caller)
results_table$Pipeline <- as.factor(results_table$Pipeline)
results_table$SV_type <- as.factor(results_table$SV_type)
results_table$Run <- as.factor(results_table$Run)
results_table$TP <- as.numeric(results_table$TP)
results_table$FN <- as.numeric(results_table$FN)
results_table$FP <- as.numeric(results_table$FP)
results_table$Sensitivity <- as.numeric(results_table$Sensitivity)
results_table$Precision <- as.numeric(results_table$Precision)
results_table$FP_percentage <- as.numeric(results_table$FP_percentage)

write.table(results_table, file = "Results_table.txt", sep = "\t", col.names = TRUE, row.names = FALSE, quote = FALSE)

################################################################################
library(tidyverse)

SEN_table <- results_table %>%
  select(Genome, SV_caller, SV_type, Sensitivity) %>%
  pivot_wider(names_from = c(SV_caller), values_from = Sensitivity)
final_SEN_table <- t(SEN_table)
final_SEN_table
write.table(final_SEN_table, file = "Sensitivity_table.txt", sep = "\t", col.names = FALSE, row.names = TRUE, quote = FALSE)

PRE_table <- results_table %>%
  select(Genome, SV_caller, SV_type, Precision) %>%
  pivot_wider(names_from = c(SV_caller), values_from = Precision)
final_PRE_table <- t(PRE_table)
final_PRE_table
write.table(final_PRE_table, file = "Precision_table.txt", sep = "\t", col.names = FALSE, row.names = TRUE, quote = FALSE)

FP_per_table <- results_table %>%
  select(Genome, SV_caller, SV_type, FP_percentage) %>%
  pivot_wider(names_from = c(SV_caller), values_from = FP_percentage)
final_FP_per_table <- t(FP_per_table)
final_FP_per_table
write.table(final_FP_per_table, file = "FP_per_table.txt", sep = "\t", col.names = FALSE, row.names = TRUE, quote = FALSE)

################################################################################

err <- c(GIAB_hg38_GS_DEL_err_COUNT, GIAB_hg38_GS_INS_err_COUNT, GIAB_hg38_GS_DUP_err_COUNT, GIAB_T2T_GS_DEL_err_COUNT, GIAB_T2T_GS_INS_err_COUNT, GIAB_T2T_GS_DUP_err_COUNT)
SV <- c(pre_liftover_GIAB_GS_DEL_COUNT, pre_liftover_GIAB_GS_INS_COUNT, pre_liftover_GIAB_GS_DUP_COUNT, pre_liftover_GIAB_GS_DEL_COUNT, pre_liftover_GIAB_GS_INS_COUNT, pre_liftover_GIAB_GS_DUP_COUNT)
err_per <-  round(err*100/SV, 2)
genome_err <- c(rep("GRCh38", 3), rep("T2T", 3))
SV_type_err <- rep(c("DEL", "INS", "DUP"), 2)

err_table <- as.data.frame(cbind(genome_err, SV_type_err, err, SV, err_per))
colnames(err_table) <- c("Genome", "SV_type", "Errors", "SVs", "Error_percentage")
err_table$Genome <- as.factor(err_table$Genome)
err_table$SV_type <- as.factor(err_table$SV_type)
err_table$Errors <- as.numeric(err_table$Errors)
err_table$SVs <- as.numeric(err_table$SVs)
err_table$Error_percentage <- as.numeric(err_table$Error_percentage)

write.table(err_table, file = "Liftover_error_table.txt", sep = "\t", col.names = TRUE, row.names = FALSE, quote = FALSE)