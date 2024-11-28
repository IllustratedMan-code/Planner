#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Case Study #3", subtitle: "Critical Appraisal of a Paper", doc)

#let article = [_Using natural language processing to characterize and predict homeopathic product-associated adverse events in consumer reviews: comparison to reports to FDA Adverse Event Reporting System (FAERS)_]

The article: #article will be referred to as "the article" for the duration of this document.

= Very Brief Summary of the Article
Amazon reviews of homeopathic health products were compared to the FDA adverse events reporting system (FAERS) reports for the same class of homeopathic products. The article found that amazon reviews complemented the FAERS dataset, with similar symptoms being reported for similar classes of homeopathic products. The authors concluded that Amazon reviews could be used as a complimentary data source for the identification of adverse events for treatments unapproved by the FDA.

= Critique
To be trusted by clinicians, a source of data must be trustworthy. The article tries to establish trust in Amazon reviews as a data source for adverse events by linking it to the FAERS dataset. The comparison between these two datasets is created by comparing symptoms of various "classes" of homeopathic products, not individual products. Homeopathic products may have diverse ingredients not necessarily correlated to the class of product. Additionally, homeopathic products are often highly diluted, so the effect of the product is often hard to predict. For these reason, it is difficult to trust this link between the FAERS dataset and the Amazon reviews.

Beyond the problem of data legitimacy, it is likely that Amazon reviews are victim to sampling bias. Most customers do not leave reviews and the one's that do may do so at radically different times. Types of adverse events reported may also be subject to bias.
Linking the adverse event to the actual product may also be difficult. Given the questionable equality of the data, it is hard to justify the use of Amazon reviews to make clinical decision.

In terms of methods, the article does not present any novel model, but uses the JMP 16 Pro Text Explorer software to evaluate different models. Because of this, it is very difficult to reproduce their results. Their best performing model, "Boosted Neural Network", is vaguely defined even on the website for the JMP tool. Since they did not provide their annotations, it is essentially impossible to evaluate if their results are legitimate.

The article reads as an early proof of concept, but for anyone to build upon their results, they would need to not only acquire the annotated data, but also recreate the model. Unfortunately, this makes the article have questionable utility for future analysis. On the other hand, the article was easy to read and understand, so it may provide an introduction to the topic for future analysis.

The article, while clear and concise, uses a flawed dataset that would never be free from bias. Additionally, it would be difficult for any future work to build directly off of the research in the article due to a lack of supplementary material such as annotated datasets.

