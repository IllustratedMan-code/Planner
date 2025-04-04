#### Seurat #############################################################################
BiocManager::install("cole-trapnell-lab/monocle3")
library(Seurat)
library(SeuratWrappers)
library(SeuratData)
library(monocle3)
library(magrittr)
library(dplyr)
library(ggplot2)
library(EnhancedVolcano)

data <- Read10X(data.dir = "/users/lew4xi/Documents/gene-reg/mm10")

integrate <- CreateSeuratObject(data, min.cells = 3, min.features = 200) %>%
    PercentageFeatureSet(pattern = "^mt-", col.name = "percent.mt") %>%
    NormalizeData() %>%
    FindVariableFeatures() %>%
    ScaleData()

VlnPlot(integrate, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"))
integrate <- subset(integrate, subset = nFeature_RNA > 200 & nFeature_RNA < 5000 & percent.mt < 15)

integrate <- ScaleData(integrate) %>%
    RunPCA(npcs = 30) %>%
    RunUMAP(dims = 1:30) %>%
    FindNeighbors() %>%
    FindClusters()

integrate$geno <- substr(colnames(integrate@assays$RNA$counts), 18, 18)
integrate$geno <- plyr::mapvalues(
    x = integrate$geno,
    from = 1:2,
    to = c("mut", "ctrl")
)
rm(data)

saveRDS(integrate, file = file.path(getwd(), "integrate"))
integrate <- readRDS(file = file.path(getwd(), "integrate"))

features_of_interest <- c("Cdh1", "Mki67", "Lamp3", "Sftpc", "Kcnj15", "Abca3")

DimPlot(integrate, label = T) + NoLegend()
DimPlot(integrate, split.by = "geno", label = T) + NoLegend()
VlnPlot(integrate, features = features_of_interest)
DotPlot(integrate, features = features_of_interest) + coord_flip()
FeaturePlot(integrate, features = features_of_interest, split.by = "geno", cols = c("lightgrey", "red"))
top5 <- FindAllMarkers(integrate, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25) %>%
    group_by(cluster) %>%
    top_n(n = 5, wt = avg_log2FC)
DoHeatmap(integrate, features = top5$gene) + NoLegend()

head(FindMarkers(integrate, ident.1 = 4, ident.2 = c(3, 5, 6, 7)))


integrate_AT2 <- subset(integrate, idents = c(0, 14))

#### Pseudobulk (mut vs ctrl)
integrate_AT2 <- NormalizeData(integrate_AT2) %>%
    FindVariableFeatures() %>%
    ScaleData()
Idents(integrate_AT2) <- "geno"
diffvol <- FindMarkers(integrate_AT2, ident.1 = "mut", ident.2 = "ctrl", min.pct = 0.01, logfc.threshold = 0.01, pseudocount.use = 0.01)
EnhancedVolcano(diffvol,
    lab = rownames(diffvol), x = "avg_log2FC", y = "p_val_adj", FCcutoff = 1, pCutoff = 10e-5,
    xlim = c(-max(abs(diffvol$avg_log2FC)) - .1, max(abs(diffvol$avg_log2FC)) + .1),
    gridlines.major = F, gridlines.minor = F, xlab = "ln(fold change)", colAlpha = 1,
    title = NULL, subtitle = NULL, col = c("black", "black", "black", "red")
)
