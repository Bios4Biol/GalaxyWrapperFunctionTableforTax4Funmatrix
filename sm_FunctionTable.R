
#!/usr/bin/env Rscript

# DEFAULT OPTIONS

opt = list()
opt$log10 = FALSE
opt$pseudocount = 1e-04
opt$row_as_variables = FALSE

suppressPackageStartupMessages(library("optparse"))

options(stringsAsFactors=F)

##################
# OPTION PARSING
##################

option_list <- list(
make_option(c("-i", "--input_matrix"), help="the matrix you want to analyze."),
make_option(c("-o", "--output"), default="output name file"),
make_option(c("-ofxntable", "--outputfile_fxn_table"), default="outputfile_fxn_table.txt"),
make_option(c("-ofxnmeta", "--outputfile_fxn_meta"), default="outputfile_fxn_meta.txt"),
make_option(c("-omethodmeta", "--outputfile_method_meta"), default="outputfile_method_meta.txt")
)

parser <- OptionParser(usage = "%prog [options] file", option_list=option_list)
arguments <- parse_args(parser, positional_arguments = TRUE)
opt <- arguments$options

#if (opt$verbose) {print(opt)}
##------------
## LIBRARIES
##------------ 
suppressPackageStartupMessages(library("phyloseq"))
suppressPackageStartupMessages(library("themetagenomics"))


###############
# BEGIN
##############

# read input tables
path <- opt$input_matrix
load(path)
ABUND <- t(otu_table(data))
TAX <- tax_table(data)
tmp <- tempdir()

download_ref(tmp,reference='silva_ko',overwrite=FALSE)
system.time(FUNCTIONS <- t4f(otu_table=ABUND,rows_are_taxa=FALSE,tax_table=TAX, reference_path=tmp,type='uproc',short=TRUE, cn_normalize=TRUE,sample_normalize=TRUE,drop=TRUE))
fxn_table <- t(FUNCTIONS$fxn_table)
fxn_meta <- data.frame(FUNCTIONS$fxn_meta$KEGG_Description)
method_meta <- FUNCTIONS$method_meta

#########
# OUTPUT
#########

output_name = opt$output


write.table(fxn_table, sprintf("%s.fxn_table.txt", output_name), quote=F, sep="\t")
write.table(fxn_meta, sprintf("%s.fxn_meta.txt", output_name), quote=F, sep="\t")
write.table(method_meta, sprintf("%s.method_meta.txt", output_name), quote=F, sep="\t")



###############
# END
##############
#dev.off()
q(save='no')
