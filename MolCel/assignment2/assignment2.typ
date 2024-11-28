#import "@local/assignments:1.0.0": conf
#import "@preview/colorful-boxes:1.3.1": outline-colorbox
#show: doc => conf(title: "Kottyan 2024 take home exam", doc)

#let refseq(
  mrna,
  protein,
) = [#math.underbracket()[#mrna][coding transcript] #sym.arrow #math.underbracket()[#protein][Protein]]

== 1.
#quote(attribution: none)[
  Give the RefSeq identifiers for the curated coding transcripts and proteins (human and mouse) of GLCCI1.
]
#set box(stroke: black, inset: 5pt)
#show link: it => {
  underline(text(blue, it))
}

#outline-colorbox(title: [Human])[#refseq([NM_138426.4], [NP_612435.1])]


#outline-colorbox(title: [Mouse])[
  #grid(
    inset: 8pt,
    columns: 1,
    refseq([NM_138426.4], [NP_612435.1]),
    refseq([NM_001286728.1], [NP_001273657.1]),
    refseq([NM_133236.3], [NP_573499.2]),
  )
]

== 2.
#quote(attribution: none)[
  What is the position of GLCCI1, isoform a in genome build hg19? What is the position of this gene in hg38?
]

chr7:8,008,427-chr7:8,128,710

#pagebreak()
== 3.
#quote(attribution: none)[
  What cell line would you choose for experiments based on its very high human IRF7 expression? Please show screen shots and give web addresses (url) to support your answers.
]

#figure(
  image("biogpsirf7.png", width: 80%),
  caption: [
    HCC2998.1 is the cell line with the highest expression for IRF7. Therefore, HCC2998.1 should be selected for experiments.
  ],
)

== 4.
#quote(attribution: none)[Based upon data from the Protein Atlas, what antibody (dilutions) would you try first to perform immunohistochemistry to probe for GLCCI1 in a lymph node section? Where do you expect to see staining within the cell (e.g. nuclear, cytoplasmic, membrane, etc.)? Please provide a screen shot and web address (url) to support your answer.]

Antibody HPA001674 should be tried first with a dilution of 1:50, as previous data has validated HPA001674 through immunocytochemistry as well as immunocytochemistry. Staining is likely to appear in the cytoplasm as previous validation in human testis show cystplasmic positivity. Additionally, immunohistochemistry with HPA005987 (another possible antibody) in human stomach cells also show cytoplasmic positivity.

#outline-colorbox(title: "URL")[https://www.proteinatlas.org/ENSG00000106415-GLCCI1/summary/antibody]

#figure(
  image("proteinatlasglcci1.png"),
  caption: [
    HPA001674 has been validated through immunocytochemistry, immunohistochemistry, and via protein array. Antibody HPA005987 may be considered a "second choice" as validation exists for immunohistochemistry and protein array, but not immunocytochemistry.
  ],
)

== 5.
#quote(attribution: none)[Using the GTEx dataset, please provide a figure for GLCCI1 expression ranked by expression from highest tissue to lowest. What three tissues has the highest GLCCI1 expression? How many isoforms are expressed at a frequency of at least 3 TPM?]

#figure(
  image("gene-exp-plot.svg"),
)

=== Top 3 Tissues
- Cells - EBV-transformed lymphocytes
- Thyroid
- Brain - Cerebellar Hemisphere
One could argue that Epstein-Barr virus transformed lymphocytes are not really a "tissue type", in which case _Brain - Cerebellum_ would be the third highly expressed tissue.

=== Isoforms expressed with TPM #sym.gt.eq 3
- ENST00000482540.1
- ENST00000223145.9
- ENST00000491947.1
- ENST00000470583.5
- ENST00000489405.5
See the #link(<isoforms>)[isoform expression] plot for more details on how these were determined.

== 6.
#quote(attribution: none)[
  Please perform a pathway analysis in ToppFun for the following list of genes. Perform the default analysis. Please provide the top two enriched GO: Molecular Function and top two GO: Biological Process results with enrichment statistics and p-values.
]

#figure(
  box(
    table(
      columns: 6,
      table.header([ID], [Name], [pValue], [FDR \ B&H], [FDR \ B&Y], [Bonferroni]),
      [GO:0000978],
      [RNA polymerase II cis-regulatory region sequence-specific DNA binding],
      [1.877E-5],
      [4.128E-4],
      [2.007E-3],
      [1.351E-3],

      [GO:0000981],
      [DNA-binding transcription factor activity, RNA polymerase II-specific],
      [1.906E-5],
      [4.128E-4 ],
      [2.007E-3 ],
      [1.372E-3 ],
    ),
  ),
  caption: [GO: Molecular Function],
)
#figure(
  box(
    table(
      columns: 6,
      table.header([ID], [Name], [pValue], [FDR \ B&H], [FDR \ B&Y], [Bonferroni]),
      [GO:0032727],
      [positive regulation of interferon-alpha production],
      [9.647E-8],
      [5.040E-5 ],
      [3.552E-4 ],
      [6.223E-5],

      [GO:0032647],
      [DNA-binding transcription factor activity, RNA polymerase II-specific],
      [1.844E-7 ],
      [5.040E-5],
      [3.552E-4],
      [1.190E-4 ],
    ),
  ),
  caption: [GO: Biological Process],
)





== 7
#quote(attribution: none)[
  Take a screen shot of the BLAST alignment of amino acids between IRF7 isoform a and IRF7 isoform d in human. What do you conclude from the score and E-value? What happens if you switch the query and ­­subject isoforms? Where are the differences in these two isoforms?
]

#figure(
  image("blast.png", width: 100%),
  caption: [Alignment between IRF7 isoform A and IRF7 isoform B. Sequences were acquired from Uniprot.],
)
#figure(
  table(
    columns: 7,
    table.header([Max Score], [Total Score], [Query Cover], [E value], [Percent Identity]),
    [998], [998], [98%], [0.0], [100%],
  ),
)

The E value is 0.0 in this case which indicates that there are 0 expected random alignments
in this search. This value might not mean much in this context because the "database" that
blast is using only contains 1 sequence (IRF7 isoform D). Score is also somewhat hard to interpret in this case as there
are no other alignments to compare it to. Max Score and Total Score are identical, indicating that there is only 1 global
alignment present, which usually indicates a strong alignment. Percent Identity is a useful metric, as it indicates that the alignment is 100% identical. Switching the isoforms so that IRF7 isoform A is the subject and IRF7 isoform D is the query only changes the query coverage from 98% to 96%. The differences in the amino acid sequences are in the first 7 and 20 for IRF7 isoform A and IRF7 isoform D respectively. This explains the change to Query Coverage as IRF7 isoform D is longer than IRF7 isoform A so the query coverage would decrease if IRF7 isoform D was the query.

#pagebreak()
== 8.
#quote(attribution: none)[Please show the HMM Epigenetic Roadmap HMM summary data for CD4 Naïve Primary cells for the genetic locus that contain the GLCCI1 gene in humans in Genome Build 37/hg19 with a screen shot. I only want to see three tracks for this : Position on Chr 7, HMM Epigenetic RoadMapp HMM summary data, and RefSeq Genes (all configured to dense). Give the URL for the browser instance that you used to do this analysis. Make one conclusion based upon the color codes and available epigenetic data.]
#outline-colorbox(title: "URL")[https://genome.ucsc.edu/cgi-bin/hgTracks?db=hg19&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr7%3A8008427%2D8128710&hgsid=2369893403_j3cwtDdRyTS9iK3u0JLvlckbfTvS]
#figure(image("hmm.png"))
The red color represents an active transcription transcription start state, the yellow represents enhancer activity, and the dark green represents weak transcription. Using this information, one can conclude that the GLCCI1 gene is weakly active in naive CD4 cells.

== 9.
#quote(attribution: none)[
  Use PolyPhen2 to predict the functional effect of the following mutations. Please provide a screen shot and the PolyPhen2 prediction for the mutation (e.g. benign, damaging, and probably damaging).
]

#figure(
  image("IRF7-mutation.png"),
  caption: [Q412R IRF7],
)

#figure(
  image("PTP-mutation.png"),
  caption: [R620W PTPN22],
)

= The most important section
#figure(
  image("cat.jpg", width: 60%),
  caption: "Juniper is studying for the big test.",
)
#pagebreak()
= Supplemental Figures
#quote()[For grading purposes, you can disregard this section. I just put some extra evidence for some of my reasoning.]
#figure(
  image("Isoformtpm.png"),
  caption: [Isoform Expression across tissue type.],
) <isoforms>


// https://gtexportal.org/home/gene/GLCCI1