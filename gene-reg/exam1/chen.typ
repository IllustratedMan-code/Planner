#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Gene regulation exam: Chen", doc)


#outline()

#pagebreak()
= Question
#quote(attribution: [Dr. Chen])[The example scRNA-seq script compares alveolar type 1 (AT1) cells in control versus
  mutant lungs. This addresses the cell autonomous function of NKX2-1 since it is deleted
  from AT1 cells. Please use the same dataset to examine if NKX2-1 has non-cell
  autonomous function. Specifically, choose another cell type and describe why you name
  certain cluster(s) as the cell type of choice (include your own script and include plots to
  make your point). Then perform pseudobulk comparison of this cell type between control
  and mutant lungs. Show script and a volcano plot, and interpret the results. Equal credits
  will be given to naming cells and comparing cells.
]

#quote()[I'll refer to the 'original script' a fair amount. This is just the script that was provided by Dr. Chen and used in class.]

= Selecting Another Cell type (Cluster Naming)

In the original script, AT1 cells are identified using 2 methods. First `DimPlot` is used to visualize hyperdimensional clusters in a 2D plane, then clusters that are "close" together in this plane are identified. After DimPlot, Dotplot is used to determine the expression levels of various markers or genes that indicate the presence of a particular cell type in a cluster.

Here, we will target AT2 cells. According to Lung Map's Cell cards @LungMAPCellCards, the following markers are significant to AT2 cells: Lamp3, Sftpc, Kcnj15, and Abca3. To determine which clusters are likely to be AT2 cells, the expression of these markers will be compared.

In @dotplot-at2, 4 potential AT2 cluster candidates can be identified: 0, 14, 19, and 22.
In the original script, candidates for AT1 were not used if high expression of Mki67 was identified (indicates mutant with high proliferation). This leaves only 0, 14, and 22. However, Cluster 22 is much further away in the UMAP visualization in @dimplot. This indicates that there is likely a biomarker that wildly differentiates cluster 22 from clusters 0 and 14. For this reason, when subsetting the dataset to include only AT2 cells, only 0 and 14 would be used.

#figure(
  image("dotplot-at2.png"),
  caption: [Comparison of expression level between clusters for markers import for AT2 identification],
) <dotplot-at2>

#figure(image("dimplot.png"), caption: [UMAP visualization of cell clusters.]) <dimplot>

= Comparing Cells

The effect of the mut condition on the clusters of interest is not as significant as it was with the AT1 clusters in the original script. Only cluster 0 shows major differences between the two conditions whereas 14, 19, and 22 are relatively constant as shown in @dimplot-mut.

#figure(image("dimplot-mut.png"), caption: [UMAP clusters based on ctrl/mut condition.]) <dimplot-mut>


== Pseudobulk

While there is little difference in the clusters between conditions, many differentially expressed markers do exist (red in @volcano). This indicates that there _are non-cell autonomous functions_ of NKX2-1.

#figure(
  image("volcano.png"),
  caption: [Pseudobulk representation of significantly differentially expressed markers],
) <volcano>





#bibliography("gene-reg-exam.bib", style: "american-medical-association")


= Script
#quote()[
  This is here for your reference, I'll also include a separate copy of the script in the submission.]
#raw(read("chen.r"), block: true, lang: "R")
