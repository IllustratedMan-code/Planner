# Useful Resources

[Practical Guidelines for ChIP-seq analysis](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3828144/)

# Overview

ChIP-seq (chromatin Immunoprecipitation followed by sequencing) uses antibodies
to determine where a protein binds to a genome.

# Analysis

The initial output of ChIP-seq is a set of (short) reads corresponding to the
sequences that are bound by a protein. These reads are then run through quality
control, then mapped to a genome. The mapping locations do not yet tell us which
part of the genome the protein was bound, so [[peak-calling]] must be performed
to identify likely regions where the protein is bound (peaks). These peaks are
then annotated with relevant information, such as gene start sites, known
promoter locations, etc.

One of the goals of ChIP-seq analysis is to find a unique [[DNA motif]]
associated with each protein binding site. It is assumed that a
[[transcription factor]] binds to a semi-unique sequence on the genome. By
identification of the unique motif, one can associate the bound transcription
factor to the unique motif.
