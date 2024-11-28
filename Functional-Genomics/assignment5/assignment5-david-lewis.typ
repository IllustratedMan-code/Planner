#import "@local/assignments:1.0.0": conf
#show: doc => conf(
  title: "Assignment 5: UCSC Genome Browser",
  date: "October 6, 2024",
  doc,
)


#let genes = read("genes.txt")

#quote()[
  Identify a likely transcriptional regulatory region in the IKZF3 locus. This region should be no longer than 200 bases long (a length amenable for testing with many experimental assays). Use multiple data sources (hint: ENCODE data in the UCSC Genome Browser is a great place to start!) A good answer would have support from at least three different data types (e.g., ChIP-seq for histone marks, ChIP-seq for specific transcription factors, DNase-seq, genome conservation, etc). Show the region in the form of a UCSC genome browser shot (with relevant information in the form of “tracks” turned on), and also provide the 200 DNA bases themselves.
]

// session: weirauch-assignment
// Region: chr17:39,770,061-39,770,256
= Answer

#figure(
  raw(genes, block: true),
  caption: [Nucleotide sequence for suspected transcriptional regulatory region (highlighted region from @tracks).],
)

#figure(
  image("tracks.png"),
  caption: [
    The suspected transcriptional regulatory region is highlighted in blue.
  ],
) <tracks>

The DNase signal, gene conservation, and ReMap ChIP-seq tracks are all very indicative of the highlighted region in @tracks being a transcriptional regulatory region. The TF clusters track from ENCODE also shows increased activity of transcription factors in the larger region surrounding the highlighted region.

#figure(
  image("tracks-zoomed-out.png"),
  caption: [
    The suspected transcriptional regulatory region is highlighted in blue, zoomed out from @tracks by 100x.
  ],
) <tracks-out>

Zooming out, the DNA-signal and ReMap ChIP-seq tracks show particularly large activity for the highlighted region in comparison to the surrounding regions. The TF clusters track also shows a relatively large amount of activity compared to other regions.

The relatively high degree of conservation, DNase activity, and ChIP-seq activity indicate that the highlighted region is likely to be an important transcriptional regulatory region.


