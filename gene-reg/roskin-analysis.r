.libPaths(c("/scratch/ros6cc/class/x86_64-pc-linux-gnu-library/4.1", .libPaths()))
library(DESeq2)
#### load matrix count ####
# load count data
counts <-
  read.csv('/scratch/ros6cc/class/GSE60424_raw_counts_GRCh38.p13_NCBI.tsv', sep='\t')
View(counts)
# GeneIDs are not gene symbols!
# load data about the genes to mape GeneIDs to Symbols
genes <-
  read.csv('/scratch/ros6cc/class/Human.GRCh38.p13.annot.tsv', sep='\t')
View(genes)
#### put gene Symbols into row.names ####
# GeneIDs seem to be in the same order, check
stopifnot(all(counts$GeneID == genes$GeneID))
# copy over the gene Symbols since the GeneIDs are in the same order
#row.names(counts) <- genes$Symbol
# error, non-unique value when setting row.names: TRNAV-CAC
dupd_gene_ids <- genes$GeneID[genes$Symbol=='TRNAV-CAC']
# drop TRNAV-CAC from both
counts <- subset(counts, !(GeneID %in% dupd_gene_ids))
genes <- subset(genes, !(GeneID %in% dupd_gene_ids))
# check order again
stopifnot(all(counts$GeneID == genes$GeneID))
# copy over the gene Symbols since the GeneIDs are in the same order
row.names(counts) <- genes$Symbol
# drop the GeneIDs
counts <- subset(counts, select=-GeneID)
#### load sample metadata ####
metadata <- read.csv('/scratch/ros6cc/class/GSE60424_series_matrix.csv')
# set the row.names, same IDs as used fro counts
row.names(metadata) <- metadata$geo_accession
# explore some of the metadata
table(metadata$celltype.ch1)
table(metadata$diseasestatus.ch1)
table(metadata$celltype.ch1, metadata$diseasestatus.ch1)
# add simpler columns for cell type and disease
metadata$celltype <- factor(metadata$celltype.ch1)
metadata$diseasestatus <-
  factor(metadata$diseasestatus.ch1)
#### DEG analysis

## Looking at possible celltypes
unique(metadata$celltype)
unique(metadata$diseasestatus)

## Changing celltype to CD8
#Part 1: m <- subset(metadata, (celltype=='CD8') & (diseasestatus %in% c('Healthy Control', 'Type 1 Diabetes')))
#Part 2: m <- subset(metadata, (celltype=='CD8' | celltype=='NK') & (diseasestatus %in% c('Healthy Control', 'Type 1 Diabetes')))
part1.m <- subset(metadata, (celltype=='CD8') & (diseasestatus %in% c('Healthy Control', 'Type 1 Diabetes')))
part2.m <- subset(metadata, (celltype %in% c("CD8", 'NK')) & (diseasestatus %in% c('Healthy Control')))

analyze <- function(m, res_filename, design=~diseasestatus, intgroup="diseasestatus"){
  c <- subset(counts, select=m$geo_accession)
  # set up DESeq object
  dds <- DESeqDataSetFromMatrix(countData=c, #count matrix
                                colData=m, # metadata
                                design=design) # metadata column for diff.
  # run analysis
  dds <- DESeq(dds)
  # check result names
  print(resultsNames(dds))
  
  # apply shrinkage
  resLFC <- lfcShrink(dds,
                      coef=resultsNames(dds)[2]
                      , type="apeglm")
  #### make a volcano plot ####
  library(ggplot2)
  library(ggrepel)
  # get data
  res <- data.frame(resLFC)
  # label genes with good LFC and adjusted p-value
  res$label <- row.names(res)
  res$label[abs(res$log2FoldChange) < 1.0] <- NA
  res$label[res$padj > 0.01] <- NA
  # make plot
  plot <- ggplot(res, aes(x=log2FoldChange, y=-log10(padj),
                          label=label)) +
    geom_point() +
    geom_label_repel() +
    scale_y_continuous(breaks=seq(0, 20, by=2)) +
    annotate('rect', xmin=-Inf, xmax=Inf, ymax=2, ymin=-Inf,
             fill='red', alpha=0.1) +
    annotate('rect', xmin=-1, xmax=1, ymax=Inf, ymin=2,
             fill='red', alpha=0.1)
  #### explore DEGs ####
  res_sig <- subset(res, (padj < 0.05) &
                      (abs(res$log2FoldChange) > 1.0))
  # sort data by log-fold change
  res_sig <- res_sig[order(res_sig$log2FoldChange),]
  write.csv(res_sig, res_filename)
  View(res_sig)
  # look a adjusted counts for most negative fold-change
  svg(sprintf("top-gene.svg"))
  plotCounts(dds, gene=(rownames(res_sig)[1]), intgroup=intgroup)
  dev.off()
  svg("second-top-gene.svg")
  plotCounts(dds, gene=(rownames(res_sig)[2]), intgroup=intgroup)
  dev.off()
  # look a adjusted counts for most positve fold-change
  svg("top-pos-gene.svg")
  plotCounts(dds, gene=(rownames(res_sig)[nrow(res_sig)]),
             intgroup=intgroup)
  dev.off()
  svg("second-top-pos-gene.svg")
  plotCounts(dds, gene=(rownames(res_sig)[nrow(res_sig)-1]), intgroup=intgroup)
  dev.off()
  #### make some heatmaps ####
  # use rlog-transformed numbers
  rld <- rlog(dds)
  # pull out the DEGs from above, in the same order
  data <- assay(rld[row.names(res_sig)])
  # make heatmap
  library(pheatmap)
  pheatmap(data, cluster_rows=FALSE,
           annotation_col=m[c(intgroup)])
}

analyze(part1.m, "CD8_sig_res.csv")
analyze(part2.m, "CD8_NK_sig_res.csv", design=~celltype, intgroup="celltype")
