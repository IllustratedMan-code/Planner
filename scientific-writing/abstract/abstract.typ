#import "poster.typ": conf
#show: doc => conf(
  title: [Comparison Of "Healthy Controls" using B Cell Repertoires ],
  authors: (
    "David Lewis": (affiliation: ("Cincinatti Children's Medical Center", "University of Cincinnati")),
    "Krishna Roskin PhD": (affiliation: ("Cincinatti Children's Medical Center",)),
  ),
  width: 40in,
  height: 27in,
  ncolumns: 8,
  nrows: 6,
  rowspans: (3, 3, 3, 3, 3),
  colspans: (2, 3, 3, 6, 2),
  x: (0, 2, 5, 0, 6),
  y: (0, 0, 0, 3, 3),
  doc,
)


= Abstract
To make inferences about treatment groups across diffferent data sets, consistency
within control group is necessary to ensure quality results. To this end, this study hopes to identify potential confounders by comparing various groups of "healthy controls".

= Introduction
#grid(
  columns: (1fr, 1fr),
  [Two types of diversity are created in B cell lineages. Initial diversity is created via VDJ recombination.

    After VDJ recombintation, additional diversity is created after antigen exposure and detection via somatic hypermutation (SHM) on the V and D segments. These VDJ segments are sequenced for each healthy cohort and compared to identify potential confounding factors.],
  image("vdj-antibody.png", width: 95%),
)
= Results

#figure(image("facetgrid.svg", height: 90%)),


= Methods

#grid(
  columns: (1fr, 1fr, 1fr),
  rows: (0.5fr, 1fr),
  [== Data Fetching

    Custom python scripts use a REST API from Adaptive Immune Receptor Repertoire (AIRR) community data repositories (IReceptor).
  ],
  [
    == Data Annotation
    AIRR community nextflow pipeline (airrflow).
  ],
  [
    == Data Visualization

    Custom Python Visualization Scripts and nextflow pipeline outputs.

    #par([
      SHM rates are collapsed to subject level from read level using a median, then a mean operation.
    ])

  ],
  grid.cell(x: 2, y: 1, figure(image("organization.png", width: 100%))),
  grid.cell(x: 0, y: 1, colspan: 2, figure(image("airrflow_workflow_overview.png", height: 85%)))
)

= Discussion

Initial results confirm age as a confounder for comparison. Additional confounders may be identified by including more datasets in the comparison analysis (as is planned).

#par([
  Once confounders are identified, a systematic review of the literature could be performed to identify studies that do not take into account identified confounders.
])






