#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Gene Expression Analysis with iLINCS", doc)

// enricher 200: https://maayanlab.cloud/Enrichr/enrich?dataset=b76cbc335e7810acddb1fe2e5fd87ab5


// enricher for small: https://maayanlab.cloud/Enrichr/enrich?dataset=532c0b69fc22f2c2911fd6a7161c7e42

#let large = "Large"
#let medium = "Medium"
#let small = "Small"
#set table(stroke: (x, y) => if y == 0 {
  (bottom: black)
})

#show figure: it => {
  align(center)[
    #box(
      inset: 5pt,
      radius: 5pt,
      stroke: (paint: gray),
      it,
    )
  ]
}

#quote(attribution: "David")[
  This table is not a figure.
]
#figure(
  caption: [List of values used for gene cutoffs],
  table(
    columns: 4,
    table.header(
      [analysis name],
      [log expression cutoff \
        (absolute value)
      ],
      [p-value cutoff],
      [number of genes],
    ),

    [#large], [1.29], [0.005], [496],
    [#medium], [1.29], [0.001], [224],
    [#small], [1.29], [0.00005], [45],
  ),
) <analysis>


I completed my analysis using the gene sets given by the values in @analysis.

= Pathway analysis
The #small analysis was the most successful in determining the pathways of interest for the ER+ vs ER- comparison.

#figure(
  image("Reactome_small.svg"),
  caption: [
    The top result for the Reactome dataset is estrogen dependent gene expression for the #small analysis
  ],
)

The ER+ vs ER- comparison refers to differences in the presence of estrogen receptors and lack thereof respectively.
So we would expect expression that is dependent on the presence of estrogen to be the highest result.
However, only the #small set of genes gave this result.
This makes sense because the #small set of genes has the smallest p-value cutoff making for the most significant genes for the comparison.

The most enriched TF in the #small analysis is ESR1, which makes sense because ESR1 is an estrogen receptor and ligand activated transcription factor. In the #medium and #large analysis, ESR1 still sometimes shows up, but not as significantly as the #small analysis.


= Comparison of Clustering



#figure(
  image("heirarchicalvskmeans-small-euclidean.png"),
  caption: [
    K-means and hierarchical clustering using the euclidean distance metric for the #small analysis
  ],
)<small-euclid>

#figure(
  image("heirarchicalvskmeans-small-pearson.png"),
  caption: [
    K-means and hierarchical clustering using the pearson-1 distance metric for the #small analysis
  ],
)

Hierarchical clustering and k-means clustering perform similarly assuming they use the same distance metric. The Euclidean distance metric is closer to the existing ER categorization as shown in @small-euclid.

#figure(
  image("heirarchicalvskmeans-large-euclidean.png"),
  caption: [
    K-means and hierarchical clustering using the euclidiean distance metric for the #large analysis
  ],
)<large-euclid>

Clustering performance does decrease as the number of genes increases in this case. This is shown by the decrease in how well the k-means and hierarchical clustering matches the ER categorization as shown in @large-euclid.