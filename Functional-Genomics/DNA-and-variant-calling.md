---
title: "DNA and variant calling"
---

# TCGA data

## DNA sequencing

- Cost of sequencing has gone down a lot, faster than Moore's law.
- Next generation sequencing is really cheap.
- Lots of data

### Sequencing protocol

- fragment the DNA (sound?)
- library preparation
- amplify (PCR)
- sequence (cDNA library -> bridge amplification)
- fluorescent dye binds to terminal nucleotide on cDNA
- fastq is the output (reads + qualities)

### Mutations

How do you reliably "call" genotype variants given a large error rate (~1%-0.1%)

"calling" a variant refers to assigning a nucleotide as a mutation or
non-mutation.

#### Bayes law

$$ P(H|D) = \frac{P(H)P(D|H)}{\sum_h P(H) P(D|H)} $$

probabilistic model that is optimized iteratively based on observations. Assumes
independence.


