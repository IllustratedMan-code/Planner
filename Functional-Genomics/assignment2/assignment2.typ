#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Assignment 2: Morpheus", doc)



#figure(
  image("kmeans_3_N100.png"),
  caption: [
    K=3, Top 100 most variant genes.
  ]
)<k3>
#figure(
  image("kmeans_5_N100.png"),
  caption: [
    K=5, Top 100 most variant genes.
  ]
)<k5>

#figure(
  image("kmeans_3_N500.png"),
  caption: [
    K=3, Top 500 most variant genes.
  ]

)<k31>
#figure(
  image("kmeans_5_N500.png"),
  caption: [
    K=5, Top 500 most variant genes.
  ]
)<k51>
= Discussion
#quote(attribution: [David])[
  I would like to note that the k-means clustering was not consistent between runs. 
  Repeated use of k-means clusters created different clusters each time (even though they were somewhat similar).
  Colors especially did not remain consistent.
]

While some clusters are visible, they are very noisy. In other words, the clusters are not solid colors,
instead there are areas within each cluster that do not fit the pattern. Predominantly red (high expression) clusters
have some blue bands of relatively low expression genes. Increasing the number of genes does seem to have a positive effect 
on clustering for some clusters, but not others. For example the top-right cluster in @k31 is very well defined, but the
left column of clusters in @k31 is less well defined than the clusters in @k3. It should be noted that the kmeans clustering does roughly
match the mRNA clustering (cancer subtypes). This relationship is very robust, maintaining across both the changes in number of genes or value for
k. 

Quantitatively, one way to pick an ideal $k$ for k-means clustering is to use the elbow method to find the point where the sum
of squared distance between data points and their centroids is suitably minimized. Another method, often used in conjunction with the
elbow method, is the silhouette method, which attempts to maximize the degree of separation between clusters. k=3, as in @k3
probably has a better separation between clusters than @k5, but may have a significantly larger
sum of squared distance between data points and their centroids. 

Additionally, larger numbers of data points usually introduce noise into the dataset, making clusters harder to determine. 
However, if very distinct clusters show up in large data sets, then the clusters become more interesting, as they the
noise of the dataset did not effect their clustering. Increasing the number of datapoints can also provide a visual averaging
effect, which may make clusters seem less noisy. This is obvious when looking at @k5 compared to @k51. @k51 looks "smoother" than @k5, 
which is due to the larger number of genes (data points).

Optimizing the clusters using these statistics is essentially impossible using the heatmaps alone. Qualitative analysis can 
only take analysis so far, especially when there is lots of noise in the data. 
