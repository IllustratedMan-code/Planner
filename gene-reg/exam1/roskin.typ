#import "@local/assignments:1.0.0": conf, csvtable
#show: doc => conf(title: "Gene Regulation Exam: Dr. Roskin", doc)



= Part1: A Different Cell Type

#quote()[I'm just going to stick with T1D (I think it is interesting)]


To Select a different cell type than the one in the original script, we first look at available cell types within the dataset.

```r
unique(metadata$celltype)
```

As CD8 cells are listed as existing within the dataset, we can modify the ```r celltype=="CD4"``` expression when subsetting the data.


```r
part1.m <- subset(metadata, (celltype=='CD8') & (diseasestatus %in% c('Healthy Control', 'Type 1 Diabetes')))
```

#let tableselect(arr) = {
  (arr.at(0), arr.at(1), arr.at(2), arr.at(3), arr.at(-3), arr.at(-2), arr.at(-1))
}


#figure(
  csvtable(tableselect(csv("CD8_sig_res.csv")).map(it => (it.slice(0, 5)))),
  caption: [
    Subset (n=#{csv("CD8_sig_res.csv").len()-1}) of significantly differentially expressed genes for Healthy vs Type 1 Diabetes in CD8 cells.
  ],
) <cd8-sig>

Upon investigation, some genes (including GSTM1, FASN, and RMRP) in @cd8-sig are supported in the literature as being significant for type 1 diabetes (T1D) in this cell type. @bekrisGlutathionestransferaseM1T12005 @ludovicoFattyAcidmediatedSignaling2023 @yangSp1InducedLncRNARmrp2021 T1D is an autoimmune condition in which pancreatic beta cells (isulin producing cells) are destroyed by hyperactive T cells. As CD8 cells are a type of T cell, it makes sense that any disruption to normal functioning of these cells would have an effect on the diagnosis of T1D.

= Part 2: Two different cell types.

Assuming that "pick two different cell types do the analysis" means the pool of data after subsetting contains 2 different cell types, it can easily be achieved by adding another condition to the same expression as in Part 1. Additionally, we'll only use the healthy controls and set the design matrix based on cell type instead of diseasestatus (see script for more details).

```r
part2.m <- subset(metadata, (celltype=='CD8' | celltype=='NK') & (diseasestatus %in% c('Healthy Control')))
```

#figure(
  csvtable(tableselect(csv("CD8_NK_sig_res.csv")).map(it => (it.slice(0, 5)))),
  caption: [
    Subset (n=#{csv("CD8_NK_sig_res.csv").len()-1}) of significantly differentially expressed genes for Healthy vs Type 1 Diabetes in CD8 and NK cells.
  ],
) <cd8-NK-sig>


The genes in @cd8-NK-sig represent the most significant differentially expressed genes between the two cell types in healthy controls. This analysis is different because the comparison is focused on the difference between cell types instead of differences between disease condition. As such, the number of differentially expressed genes is greatly increased. As NK cells and CD8 cells are significantly different in function, so there gene expression differs significantly.

#bibliography("gene-reg-exam.bib", style: "american-medical-association")


= Script

#raw(lang: "R", block: true, read("roskin-analysis.r"))
