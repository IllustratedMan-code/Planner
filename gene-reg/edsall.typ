#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "Gene Regulation Exam: Edsall", doc)

= Question 1.
#quote(attribution: "Dr. Edsall")[
  you have fastq files for a CUT&RUN experiment. What software (or software package)
  would you use to analyze (meaning align, call peaks, and QC) this data? Why?]

Since CUT&RUN data is roughly equivalent to ChIP-seq data. I would use something like the
Chip-seq pipeline from nf-core. @patelNfcoreChipseqNfcore2024

#figure(image("chipseq.png"), caption: [The pipeline uses many different tools to accomplish analysis. ])

To be more specific, within the pipeline:
- BWA, Chromap, Bowtie2 and STAR provide the alignment for the sequences
- Peak calling is performed by MACS3
- Many QC steps are performed using different tools including FastQC, Picard, and BEDTools

As for the motivation behind using this tool:
- An all-in-one solution
- Relatively user-friendly
- Easy to read and understand outputs
- Good base for further customization


== Alternative tools

Other options include the cutandrun nf-core pipeline @cheshireNfcoreCutandrunNfcore2024 which is similar to the ChIP-seq pipeline
and contains cut and run specific optimizations and downstream analysis. It seems to have fewer aligner options, so depending on
the use case, the ChIP-seq pipeline may be more useful.

In the end, these pipelines would still act as a base for further customization, so some chimera of the two pipelines is not out
of the question.


= Question 2.
#quote(attribution: "Dr. Edsall")[
  You analyzed H3K4me3 ChIP-seq data from B cells. What would you check to determine if
  the ChIP-seq experiment worked?]

Using the above ChIP-seq pipeline as the analysis tool, the ChIP-seq experiment data would go through several levels of QC.
Assuming all of the QC levels are passed, additional inspection of the peaks using a genome browser could illuminate whether an
experiment worked satisfactorily.

Some things to look out for:
- Extremely large number of peaks
- No difference in peaks between conditions
- Lots of noise
- Large number of inconsistent peaks in B cells of the same condition

= Question 3
#quote(attribution: "Dr. Edsall")[Your PI is studying a new disease (for which nothing is known about the molecular
  mechanisms) and has fastq files from ATAC-seq experiments in B cells from 5 patients and
  5 healthy controls. What analyses can you do and what biology can you learn from them?
  Give 2 examples.]

ATAC-seq data first needs to be processed into peaks (as with ChIP-seq data) before analysis. Something like the nf-core atac-seq pipeline could be used for this purpose.@patelNfcoreAtacseq2122023 Once the data is pre-processed, one can start thinking about comparisons between the treatment (new disease) and control group. In any potential analysis, the goal is
to determine the effect of the treatment on gene regulation and more specifically, the chromatin landscape (changes in accessible regions).

One possible analysis is peak overlap comparison. By determining the overlap between peaks, one can understand the chromatin landscape and _more importantly_ how the chromatin landscape
changes based on treatment. Areas where peaks are significantly different between control and treatment likely indicates a particular pathway being activated or repressed. The peaks give an indication as to what regions of the genome are integral to a particular pathway.

Another possible analysis is to compare gene regulatory networks constructed from the ATAC-seq peaks. This is similar to the previously stated analysis in its goal; however,
additional data can be used in the construction of a gene regulatory network to enhance the ability to make biologically relevant inferences. For example, known biochemical pathways can be integrated into the network and by observing the change in the edges/nodes within the network during treatment, one can then make a testable hypothesis on the effect of the treatment on a known biochemical pathway.


#bibliography("gene-reg-exam.bib", style: "american-medical-association")
