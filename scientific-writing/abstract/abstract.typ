#import "poster.typ": conf
#show: doc => conf(title: [Comparison Of "Healthy Controls" using B Cell Repertoires ], doc)


= Abstract
To make inferences about treatment groups across diffferent data sets, consistency
within control group is necessary to ensure quality results. To this end, this study hopes to identify potential confounders by comparing various groups of "healthy controls".

= Introduction
Two types of diversity are created in B cell lineages. Initial diversity is created via VDJ recombination.

#figure(image("vdj-antibody.png", width: 60%))
After vdj recombintation, additional diversity is created after antigen exposure and detection via somatic hypermutation (SHM) on the V and D segments. These VDJ segments are sequenced for each healthy cohort and compared to identify potential confounding factors.

= Results
Initial Results compared SHM rates between adult (HHC) and child (MPAACH) data sets.
#figure(image("facetgrid.svg", width: 80%))


#v(1fr)
= Methods

== Data Fetching

Custom python scripts use a REST API from Adaptive Immune Receptor Repertoire (AIRR) community data repositories (IReceptor).

== Data Annotation
AIRR community nextflow pipeline (airrflow).

#figure(image("airrflow_workflow_overview.png"))


== Data Visualization

Custom Python Visualization Scripts and nextflow pipeline outputs.

#par([
  SHM rates are collapsed to subject level from read level using a median, then a mean operation.
])


#figure(image("organization.png"))



= Discussion

Initial results confirm age as a confounder for comparison. Additional confounders may be identified by including more datasets in the comparison analysis (as is planned).

#par([
  Once confounders are identified, a systematic review of the literature could be performed to identify studies that do not take into account identified confounders.
])






