#import "@local/assignments:1.0.0": conf, csvtable
#show: doc => conf(title: "Assignment 4", subtitle: "Classifying Tumors Using Cell Line Signatures", doc)

#let small = "Small"
#let large = "Large"
#show link: it => underline(stroke: gradient.linear(..color.map.flare))[#it]

#let eds = "EDS-1014"
#let brca = "TCGA_BRCA_RNASeqV2_2019"
#show figure.caption: it => pad(
  left: 0cm,
  right: 0cm,
  align(left, par(hanging-indent: 1cm, justify: true, it)),
)
#figure(
  table(
    columns: 5,
    table.header(
      [Analysis Name],
      [Diff Expression Range],
      [P-value Cutoff],
      [Number of Genes],
      [Number of Genes After Selecting Dataset],
    ),

    [#small], [(0, 0)], [0.005], [100], [99],
    [#large], [(-1.5, 1.5)], [0.005], [448], [439],
  ),
  caption: [Initialization parameters for the signatures in the #eds dataset.],
)

= 1-Pearson Correlation vs Euclidean
#figure(
  grid(
    columns: 2,
    image("kmeans_2_100.png"), image("kmeans_3_100.png"),
  ),
  caption: [1-Pearson correlation fails to match the ER labels well],
)
1-Pearson as the distance metric performs measurably worse than Euclidean distance. This may be because 1-Pearson does not necessarily take into account the "closeness" of different data points. Points that are far away can be just as highly correlated as close points, but the distance would be very different.


= #small Analysis

#figure(
  image("kmeans_2_100.png"),
  caption: [
    k-means (Euclidean): k=2, Number of genes: 99
  ],
) <kmeans-2-100>


#figure(
  image("kmeans_3_100.png"),
  caption: [
    k-means (Euclidean): k=3, Number of genes: 99
  ],
) <kmeans-3-100>

It is clear that the k-means clustering is an approximate match to ER categories. See the #link(<accuracy>)[accuracy analysis] for more details.

= #large Analysis
#figure(
  image("kmeans_2_500.png"),
  caption: [
    k-means (Euclidean): k=2 Number of genes: 439
  ],
) <kmeans-2-500>

#figure(
  image("kmeans_3_500.png"),
  caption: [
    k-means (Euclidean): k=3 Number of genes: 439
  ],
) <kmeans-3-500>

Similar results to the #small analysis are given here. The results seem to be robust to the choice of k, i.e. there is not much change in accuracy when k changes.

= Accuracy Analysis <accuracy>
#let accuracy = csv("accuracy.csv")
#figure(
  csvtable(accuracy),
  caption: [
    Accuracy calculation for each clustering.
  ],
)

There is very little change in accuracy when changing the k or the number of genes. This may imply that both of the selections from the original #eds dataset represented significant differential expression between the ER positive and ER negative conditions. It could also mean that the selection had little effect on the clustering of the final dataset. More testing would be required to evaluate this possibility.

Accuracy is calulated using a "maximum equals affinity" method where the maximum number of data points for a cluster that fit a label becomes ground truth. This method is somewhat sensitive to cluster purity, but does not give a complete picture of how well the clusters fit the labels. For more information about the accuracy methods, as well as exploration of a different metric, see the #link(<methods>)[supplementary methods].

= Assignment Discussion
Beyond an excercise in using iLNCS and Morpheus, this assignment shows how one might compare categorical variables within different datasets.
In this case, the #eds dataset is our "training" set and the #brca dataset is our evaluation set.
More specifically, by selecting the signature for ER+ and ER- in the #eds dataset, the ER+ and ER- categories in the #eds dataset become our training labels. The ER+ and ER- labels in the #brca
dataset therefore become our test labels.

This analogy does fall apart slightly since the clustering model is not supervised, i.e. the model does not take into account training labels. Instead, the model is subsetting genes that fall into two categories that are significantly different from one another in one dataset and seeing if those results are reproducable in another dataset.

= Supplementary Methods <methods>
#quote()[
  Reading this isn't really necessary for the purposes of the assignment,
  but it felt strange to not explain the way I calculated accuracy.
]
Since cluster numbers are not initially associated with ER categories, there must be some method
to assign clusters to unique categories. First, a count matrix was created, see @count-matrix, then the largest count for each cluster-category pairing was assigned as the true-positive count for that pairing. This method is robust to the number of clusters, but can result in cases where no clusters are assigned to a particular label. So in the case of k=2, both clusters may be assigned to the ER positive category. This may be problematic depending on the purpose of the clustering.
This is the

#let count_matrix = csv("example_count_matrix.csv")

#figure(
  csvtable(count_matrix),
  caption: [
    K-means (euclidean) k=2, 99 genes. Here we see that the negative label would get associated with cluster 1, and the positive label would get associated with cluster 2.
  ],
) <count-matrix>
Another method attempts to assign cluster-category pairing is assigned, the next pairing assignment cannot use either the cluster or the ER category used in the previous cluster-category assignments. This was achieved using the ```python linear_sum_assignment()``` function from `scipy`. Once the all the clusters were assigned, the "true positive" values were summed and divided by the total count to determine accuracy. For a more detailed look at the methods please refer to @code-methods.



#pagebreak()
#quote()[
  Please do not feel the need to read the code, I just included it for completion's sake.
]
#let c = read("analysis.py")

#[
  #show figure: set block(breakable: true)
  #figure(
    raw(block: true, lang: "python", c),
    caption: [
      Code for determining accuracy. Files containing the cluster and ER category annotations were
      matched together and the accuracy was computed using the ```python accuracy``` property of the cluster evaluator class.
    ],
  ) <code-methods>
]