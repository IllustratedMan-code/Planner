
#import "assignments.typ": conf

#show: doc => conf(title: "Assignment 1", doc)
#show heading.where(level: 1): it => { pagebreak(weak: true); it }
#set grid(gutter: 2pt)

= 1. Oncoprints 

#figure(
  image("oncoprint1.svg"),
  caption: [

  ]
)


#figure(
  image("oncoprint2.svg"),
  caption: [
The most common mutation patterns associated with the various subtypes are amplification and missense mutations. TP53 is also notable because there is a significant amount of truncating mutations present. Luminal A and B are also interesting because many occurances of those subtypes do not seem to be related to these four genes of interest (many cases of no alterations in any of the 4 genes).
  ]
)

= 2. Mutation frequency

#figure(
  image("GroupComparisonGeneFrequencyPlot.svg"),
  caption: [
    TP53 has the largest difference in mutation frequency between the two groups. PIK3CA is also notable because it is the only gene where mutation frequency is larger in the positive group.
  ]
)

= 3. Tables

#quote(attribution: [David])[Note that I did remove some columns that did not seem relevant.]

#let high = csv("negative_high.csv")
#let low = csv("negative_low.csv")
#let difference = csv("largest_difference.csv")
#set table(stroke: (_, y) => if y == 0 { (bottom: 1pt) })

#let genetable(data) = table(
  columns: 4,
  table.header(
    ..data.first()
    ),
  ..data.slice(1).flatten(),
)

#figure(
    genetable(high),
    caption: [
      Genes were filtered by p-value (lowest possible) and by the sign of log2 ratio. Positive log2 ratio corresponds to over expressed genes in the ER- condition.
    ]
  ),

#figure(
    genetable(low),
    caption: [
      Genes were filtered by p-value (lowest possible) and by the sign of log2 ratio. Negative log2 ratio corresponds to under expressed genes in the ER- condition.
    ]
  ),

= 4. Correlation plots

#figure(
  image("correlation-all.svg"),
  caption: [
    All other subtypes (except Her-2, or ERBB2). There is a large centrally located cluster of points making pearson and spearman coefficient relatively low.
  ]
) <all-other>
#figure(
  image("correlation-her2-enriched.svg"),
  caption: [
    Her2-enriched subtype seems to have a much more even density of points as well as a higher pearson and spearman coefficient than all the other subtypes. In essence, the correlation between protein an mRNA is stronger in the Her2-enriched subtype. Many of the mutations are amplification mutations, so it makes sense that more copies would be transcribed and translated into protein increasing the strength of the mRNA-protein correlation. The large cluster of points in @all-other are shallow deletions which may randomly effect whether a protein is successfully translated or transcribed, decreasing the strength of the correlation.
  ]
)