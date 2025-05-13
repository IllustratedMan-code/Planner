---
title: Peak Calling
---

Identification of likely regions where a protein is bound given a set of mapped
reads.

"Peaks" are defined as an increased signal point where the signal is the number
of mapped reads at a particular location along the genome.

Peak calling transforms the mapping data into signal data and identifies the
peaks in the signal as a region on the genome. These peaks are usually stored in
a [[bed]].

Intuitively, one can think of "peaks" as a stack of aligned reads. The higher
the stack, the higher the peak. The wider the stack is (alignments can increase
width), the wider the peak.

Peak data is aquired from either protein binding ([ChIP-seq](./ChIP-seq.md), 
[Cut&RUN](https://en.wikipedia.org/wiki/CUT%26RUN_sequencing)), 
chromatin-conformation ([Hi-C](https://en.wikipedia.org/wiki/Hi-C_(genomic_analysis_technique)), [4C-seq](https://en.wikipedia.org/wiki/Chromosome_conformation_capture), or
chromatin accessibilitiy ([ATAC-seq](https://en.wikipedia.org/wiki/ATAC-seq))
assays.

- separating peaks logically is difficult

# Regulatory Elements

- Transcription factors interact with Histones
- Histone modifications forms a "code" that results in different regulatory
  effects

# Assays

- HiChIP and Hi-C are chromatin conformation assays
- DNase-seq and ATAC-seq are accessibility assays
- ChIP-seq and CUT and RUN and CUT and TAG are TF binding assays

## When there is no antibody for the protein

- Fuse a GFP tag to protein of interest, use antibody with GFP
