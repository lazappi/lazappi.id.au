---
title: "Extracting alignment statistics using Python"
description: "A Python script for extracting alignment statistics from BAM files"
authors: ["**Luke Zappia**"]
categories: ["python", "alignment", "statistics"]
date: 2016-03-30
---

Recently [this paper](http://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0888-1)
by Ilicic et al. suggested a method for assessing the quality of individual
cells in a single-cell RNA-seq experiment. The basic idea is to extract various
biological and technical features from each the reads for each cell, then use
PCA with outlier detection or a SVM to classify cells as "high" or "low"
quality. There are two pieces of software associated with the paper: `cellity`,
an R package that performs the classification and `Celloline`, a Python script
that performs alignment, summarisation and extraction of alignment statistics
such as the number of reads aligned to exons, introns, intergenic regions etc.
I was interested in using `cellity` but I didn't want to change my whole
workflow to use the `Celloline` pipeline, so instead I decided to take the part
responsible for extracting alignment statistics (available
[here](https://github.com/Teichlab/celloline/blob/master/lib/stats.py)) and
convert it to a stand-alone Python script.

The core processing remains the same (except I have removed read counting which
I do with `featureCounts`), but I have added a few features:

1. Multiple files - paths to multiple alignment files can now be provided as
   arguments on the command line.
2. BAM files - the script can now handle BAM files as well as SAM using
   [pysam](https://github.com/pysam-developers/pysam). It will work if the BAM
   is unsorted, but the output can be slightly different.
3. Index - reading the GTF annotation file can take a significant amount of
   time, particularly for a single-cell experiment where there are a large
   number of files with relatively few reads. To limit this overhead the object
   holding the annotation can be pickled to disk for future use.
4. Parallel - multiple files can now be processed in parallel using
   [joblib](https://pythonhosted.org/joblib/). This is fairly crude but it is a
   significant improvment, particularly when combined with a pickled index.
5. Argument handling - now performed by
   [argparse](https://docs.python.org/3/library/argparse.html), complete with
   handy help message.
6. Logging - progress and error messages.

Putting it all together I can now extract alignment statistics from multiple BAM
files in parallel with a single command:

```
alignStats -o stats.csv -g annotation.gtf -i annotation.index -t bam -p 10 *.bam
```

The script is available on
[Github](https://github.com/lazappi/binf-scripts/blob/master/alignStats.py).
