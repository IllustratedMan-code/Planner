
#import "./proposal-template.typ": conf
#import "@preview/marge:0.1.0": sidenote
#show: doc => conf(title: "Proposal", doc)
#import "@preview/drafting:0.2.1": margin-note

#let sidenote = sidenote.with(
  numbering: "1",
  padding: 0pt,
  format: it => { text(size: 9pt, weight: "regular")[#it.default] },
)


#let todocite(content) = {
  strong(text(red)[(CITE: #content)])
}
#outline()
#pagebreak()

#let number(..numbs) = {
  numbs = numbs.pos()
  if numbs.first() <= 1 { } else {
    numbs.at(0) = numbs.at(0) - 1
    numbering("A.1.a.", ..numbs)
  }
}
#set heading(numbering: number, hanging-indent: 0pt)
#show heading: it => {
  if it.level == 1 {
    upper(it)
  } else {
    it
  }
}

= Specific Aims
//#quote()[Am I suppost to cite anything in the specific aims? This #underline(text(blue)[#link("https://www.niaid.nih.gov/sites/default/files/r01ai181321-01-liu-application.pdf", "proposal")]) example on the nih website seems to wait until the significance section.]

Transcription factors regulate the epigenetic machinery within cells leading to environmentally dependant phenotypes. PU.1 is a member of the ETS family of transcription factors and is integral to immune cell development and differentiation. @liTranscriptionFactorPU12020 While the general effects of PU.1 transcription factors are understood, many specifc interactions have yet to be discovered. Understanding of transcription factor interactions drives advancement of medical treatments and leads to greater understanding of biological systems.

The central objective of this proposal is to understand the role of PU.1 in immune cell development and uncover novel epigenetic interactions via the use of a newly developed computational pipeline.

== Specific Aim 1: Develop a portable Computational pipeline that facilitates analysis of peak data for discovery of novel transcription factor interactions.
- Rust based pipeline
- Extendable with python or R
- Support for high-performance clusters
- containerized
- Computes unexpectedness of interactions using global gene regulatory networks


== Specific Aim 1: Determine specific effect of PU.1 on immune cell differentiation.
Many possible transcription factor interactions have yet to be uncovered. Identifying these interactions will shed light on the greater role of PU.1.

PU.1 is known to interact with GATA in certain immune cell types. This proposal aims to verify this relationship as well as determine novel partner transcription factors @chouGradedRepressionPU12009.


== Specific Aim 3: Examine potential drug-disease interactions related to PU.1 pathways

#quote()[This one is kind of a shot in the dark, don't know how useful this would be. Might not be worth an entire paper.]

Using novel PU.1 interactions, uncover potential pathways affected by known pharmaceutical agents.


= Significance
Transcription factors regulate the expression of genes. Transcription factors interact with genetic and protein components to create environmentally dependant phenotypes. PU.1 is a transcription factor related to immune cell differentiation. @liTranscriptionFactorPU12020. Previous work on the PU.1 factor in neutrophils predicted novel interactions with genes underlying immune cell phenotypes. @wattGeneticPerturbationPU12021

Additionally, PU.1 has been shown to have interactions with another transcription factor family, GATA in certain immune cell types. @chouGradedRepressionPU12009 This proposal will attempt to verify these interactions as well as predict novel interactions in diverse cell types.

Computational pipelines for bioinformatics analysis often lack software engineering rigor, leading to lack of performance and longer turnover times for analysis. Pipelines are often monolithic and hard to interpret, making mistakes hard to catch. Bad software can even lead to article retractions. @millerScientistsNightmareSoftware2006 This proposoal will highlight methods used to create a pipeline framework that facilitates pipeline creation and inspection.

== Focus on mechanisms that explain PU.1's importance to immune cell development.
While it is known that PU.1 is an important regulator of immune cell differentiation, not much is known about the mechanism and potential recruitment of other transcription factors. Particularly, with the exception of neutrophils @wattGeneticPerturbationPU12021, specific details about the effect of PU.1 on immune cell type development are relatively unknown @liTranscriptionFactorPU12020.


== Integrating novel interactions into global gene regulatory models

#quote()[I need to do more research on this point, but looks like a fairly undiscovered verification method for gene regulatory models]

Global Gene regulatory networks attempt to model attempt to model all active epigenetic machinery for a specific condition. Determining the role of PU.1 within the predicted network could give insight into accuracy of predicted interactions.



= Innovation

#quote()[
  I feel like I am wrestling with my lack of knowledge about specific implementation details that I know exist but don't have a solid intellectual understanding of. For example, I know that to obtain useable ChIP-seq data, one must perform 'peak calling' to obtain the usable data. However, I do not know the details of this process. I'm not super sure of what processes are considered 'default' and which require detailed descriptions. I don't think I am struggling with the exercise of writing the innovation section, just that I would have lots of PI-specific questions.
]

== Techinical innovation - Development of computational pipeline
A computational pipeline would be developed for completing the comparitive analysis of PU.1 activity in immune cell types but would be applicable to any future study that compares transcription factor activities between cell types.


== Novel PU.1 relationships to previously unstudied cell types

To identify novel PU.1 relationships, motif enrichment analysis would be performed to first identify potential binding partners. Then additional ChIP-seq experiements would be performed to assess the validity of the likely binding partners. Additionally, identification of the relationships between separate ChIP experiments would be done by performing intersection analysis of the resulting peaks.

Applying Homer + RELI + GREAT analysis on new and previously studied data to perform comparitive analysis between cell types. #margin-note()[Which specifics do I save for the Approach?]

== Identification of novel drug interactions

Pathway analysis can be performed to identify possible drug interactions with novel PU.1 interactions.


== Novel Network Verification method

Gene network models are often unable to assess the accuracy of predicted interactions. Using popular gene regulatory network models, this proposal hopes to create a standardized "unexpectedness" score for novel interactions when compared to popular gene regulatory network models.


= Approach
== First Aim

- *Specific Aim 1:* Determine specific effect of PU.1 on immune cell differentiation.

- *Hypothesis 1:* PU.1 has additional Transcription factor partners/competitors that alter cell fate.
- *Expected outcomes:* Identification and verification of transcription factor partners/competitors present during cell-specific differentiation.
=== Justification and Feasibility
Identifying the interactions between other transcription factors and PU.1 during immune cell differentiation lays the groundwork for treating conditions related to the immune system.
PU.1 is an important transcription factor for immune health @liTranscriptionFactorPU12020. Therefore, understanding the role of PU.1 is advantageous for understanding immune conditions.

As this aim is an application of existing methodologies, there should be no feasibility concerns.

=== Research Design
==== Methods

To assess the relationship between PU.1 and other transcription factors during immune cell differentiation, the creation, and collection of ChIP-seq @parkChIPSeqAdvantagesChallenges2009 experimental data
targeting PU.1 in differentiating immune cells. Once the ChIP-seq data is acquired, motif enrichment analysis would be performed to predict
potential transcription factors that interact with PU.1.

First, depending on the source of the PU.1 ChIP-seq data, raw reads are transformed into peak sets via a process called peak calling. Once the peak sets are acquired,
motif enrichment is performed, @HomerSoftwareData2016 utilizing an existing database of transcription factor motifs, or binding preferences are used to predict potential transcription factor
binding. Since the ChIP-seq peaks represent known binding sites for PU.1 during cell differentiation, any other predicted transcription factors represent potential binding partners/competitors to Pu.1.

Once potential binding partners are identified, additional ChIP-seq experiments can be performed to verify whether the predicted binding partners are actually present during differentiation.

=== Potential problems and alternative strategies
There may not be enough public data or the data may be of poor quality. To assuage this problem, more ChIP-seq experiments could be performed, however this may increase the cost.





// == Data Collection
// - ChIP-seq
// - ATAC-seq
// - CUT and RUN?
// - Public Datasets


// == Data Management


== Future Directions
- Use developed pipeline to analyze other transcription factors
- Iterative use of the pipeline could allow for incremental exploration of pathways related to PU.1

#bibliography("proposal.bib", style: "american-medical-association")
