#import "@local/assignments:1.0.0": conf
#show: doc => conf(title: "metadata insanity", doc)

*Main problem:* It is unclear how to get sample data from files.

= General Issues
The only file that annotates the cram files is `samples_file.tsv` however, the only annotation is the sample alias.
The sample alias is not unique to the cram file. What this means is that there is no way to connect the cram file with
the experiment_accession_id. The experiment_accession_id may or may not be unique to each file (I suspect not).


Also, runs do not correlate with sample (i.e multiple runs can be in a single sample and multiple samples can be in a single run).

The total reads/mapq1 reads are given for each sample, but as each sample contains multiple files, which may or may not relate to different runs,
it is a challenge to understand what to do with each file. Some files are also very small, so do we combine them when they are part of the same sample?


= Conflicting Endedness Annotation
If that wasn't enough, it seems that there may be both a "paired" and a "single" end annotation for a single file. So that must mean that a single file can contain multiple runs.

This is one of the offenders:

```log
public_datasets/EGA/EGAD00001004571/raw_files/cram_files/EGAF00000765339/14594_7#80.cram
13412105 + 1992 in total (QC-passed reads + QC-failed reads)
13412105 + 1992 primary
0 + 0 secondary
0 + 0 supplementary
1780845 + 0 duplicates
1780845 + 0 primary duplicates
12984628 + 1940 mapped (96.81% : 97.39%)
12984628 + 1940 primary mapped (96.81% : 97.39%)
0 + 0 paired in sequencing
0 + 0 read1
0 + 0 read2
0 + 0 properly paired (N/A : N/A)
0 + 0 with itself and mate mapped
0 + 0 singletons (N/A : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
```

It appears to only be single end???????
#pagebreak()
Another offender:
```log
public_datasets/EGA/EGAD00001004571/raw_files/cram_files/EGAF00000703215/14331_1#40.cram
260598 + 0 in total (QC-passed reads + QC-failed reads)
260598 + 0 primary
0 + 0 secondary
0 + 0 supplementary
2017 + 0 duplicates
2017 + 0 primary duplicates
253966 + 0 mapped (97.46% : N/A)
253966 + 0 primary mapped (97.46% : N/A)
260598 + 0 paired in sequencing
130299 + 0 read1
130299 + 0 read2
246636 + 0 properly paired (94.64% : N/A)
251888 + 0 with itself and mate mapped
2078 + 0 singletons (0.80% : N/A)
4624 + 0 with mate mapped to a different chr
2069 + 0 with mate mapped to a different chr (mapQ>=5)

```
It's only paired end??? And also extremely small??

Keep in mind that each sample has only a single count for number of reads.

This conflicting result comes from files sharing both a runID (14331_1) _and_ a sampleID having multiple entries with different endedness anotations.

