######CNMOP Script####
pacman::p_load(optparse,cn.mops)


option_list = list(
  make_option(c("-i", "--input"), type="character", default=NULL, 
              help="Input bam", metavar="character"),
  make_option(c("-o", "--out"), type="character", default=NULL, 
              help="output rds file", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

segments <- read.table("/data/CCBR_Pipeliner/db/PipeDB/lib/Agilent_SSv7_allExons_hg38.bed",sep="\t",as.is=TRUE)
gr <- GRanges(segments[,1],IRanges(segments[,2],segments[,3]))
X <- getSegmentReadCountsFromBAM(opt$input,GR=gr)
saveRDS(X,opt$out)
