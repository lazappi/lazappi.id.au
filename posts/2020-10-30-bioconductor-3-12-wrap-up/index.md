---
title: "Bioconductor 3.12 wrap-up"
abstract: "My wrap-up of the Bioconductor 3.12 release."
authors: ["**Luke Zappia**"]
categories: ["Bioconductor", "R"]
date: 2020-10-30
---

The Bioconductor 3.12 release was this week. Here is my wrap-up of new packages
and updates. This is only the things I found interesting based on the release
and they don't come with any particular endorsement. If there is
something else you are looking for have a look at the release notes
[here][bioc-news].

# My packages

## [**{splatter}**][splatter]

* Add the splatPop simulation. This is a extension to the splat simulation contributed by Christina Azodi and Davis McCarthy that adds population effects.
  It allows you to specify relatedness between individuals and generate cell-type specific eQTL effects.
* Add a batch.rmEffect parameter to the Splat simulation.
  This allows generation of a paired simulation without any batch effects.
* Add a new minimiseSCE function which can be used to remove unneeded information from simulation output (or any SingleCellExperiment)
* All simulations now return sparse assay matrices by default when they would be smaller than the equivalent dense matrix.
  This is controlled by a new sparsify argument.
* Users will now be automatically prompted to install packages if they try to use a simulation for which the suggested dependencies are not available

## [**{zellkonverter}**][zellkonverter]

This is a new package (with help from Aaron Lun) that contains methods to convert between SingleCellExperiment and Python AnnData objects.

# New packages

* [**{ADImpute}**][ADImpute] - dropout imputation using information from gene regulatory networks
* [**{aggregateBioVar}**][aggregateBioVar] - provides tools to aggregating SummarizedExperiment objects at the subject level
* [**{BayesSpace}**][BayesSpace] - tools for clustering tha enhancing spatial gene expression
* [**{BiocIO}**][BiocIO] - generics for importing and exporting biological data
* [**{biocthis}**][biocthis] - automate setting up packages for Bioconductor
* [**{bluster}**][bluster] - wraps common clustering algorithms for Bioconductor
* [**{corral}**][corral] - correspondence analysis for single-cell data
* [**{densvis}**][densvis] - implements the density-preserving modifications to t-SNE and UMAP
* [**{escape}**][escape] - bridging package for scRNA-seq gene set enrichment
* [**{ExperimentSubset}**][ExperimentSubset] - interface for accessing subsets of SummarizedExperiment objects
* [**{Herper}**][Herper] - interface for managing conda environments
* [**{ILoReg}**][ILoReg] - high-resolution scRNA-seq population identification
* [**{Informeasure}**][Informeasure] - implementation of information measures such as mutual information
* [**{Nebulosa}**][Nebulosa] - visualisation of scRNA-seq using gene-weighted density estimation
* [**{NewWave}**][NewWave] - dimensionality reduction and batch correction for scRNA-seq
* [**{pipeComp}**][pipeComp] - simple framework for comparing pipelines
* [**{recount3}**][recount3] - access data from recount3
* [**{scCB2}**][scCB2] - extends the EmptyDrops method for identifying real cells by testing clusters
* [**{scDataviz}**][scDataviz] - functions for plotting single-cell data
* [**{scuttle}**][scuttle] - basic functions for single-cell analysis (most previously in **{scater}**)
* [**{snifter}**][snifter] - R wrapper for the Python openTSNE library
* [**{SpatialExperiment}**][SpatialExperiment] - S4 class for storing spatial experiments
* [**{SPsimSeq}**][SPsimSeq] - Semi-parametric RNA-seq simulation
* [**{velociraptor}**][velociraptor] - R wrapper for the scVelo Python package

# Updates

* [**{BASiCS}**][BASiCS] - many updates and improvements
* [**{basilisk}**][basilisk] - support for setting conda channels and safer environment construction
* [**{DESeq2}**][DESeq2] - overhaul of dispersion estimation allowing use of the **{glmGamPoi}** package for single-cell data
* [**{DropletUtils}**][DropletUtils] - functions for handling ambient counts
* [**{edgeR}**][edgeR] - support for SummarizedExperiment objects and improvements to the limma voom-lmFit pipeline
* [**{limma}**][limma] - improvements to some fitting functions
* [**{scran}**][scran] - various new function arguments, some functions moved to other packages

[bioc-news]: https://bioconductor.org/news/bioc_3_12_release/ "Bioconductor 3.12 release notes"
[splatter]: https://bioconductor.org/packages/release/bioc/html/splatter.html "splatter"
[zellkonverter]: https://bioconductor.org/packages/release/bioc/html/zellkonverter.html "zellkonverter"
[ADImpute]: https://bioconductor.org/packages/release/bioc/html/ADImpute.html "ADImpute"
[aggregateBioVar]: https://bioconductor.org/packages/release/bioc/html/aggregateBioVar.html "aggregateBioVar"
[BayesSpace]: https://bioconductor.org/packages/release/bioc/html/BayesSpace.html "BayesSpace"
[BiocIO]: https://bioconductor.org/packages/release/bioc/html/BiocIO.html "BiocIO"
[biocthis]: https://bioconductor.org/packages/release/bioc/html/biocthis.html "biocthis"
[bluster]: https://bioconductor.org/packages/release/bioc/html/bluster.html "bluster"
[corral]: https://bioconductor.org/packages/release/bioc/html/corral.html "corral"
[densvis]: https://bioconductor.org/packages/release/bioc/html/densvis.html "densvis"
[escape]: https://bioconductor.org/packages/release/bioc/html/escape.html "escape"
[ExperimentSubset]: https://bioconductor.org/packages/release/bioc/html/ExperimentSubset.html "ExperimentSubset"
[Herper]: https://bioconductor.org/packages/release/bioc/html/Herper.html "Herper"
[ILoReg]: https://bioconductor.org/packages/release/bioc/html/ILoReg.html "ILoReg"
[Informeasure]: https://bioconductor.org/packages/release/bioc/html/Informeasure.html "Informeasure"
[Nebulosa]: https://bioconductor.org/packages/release/bioc/html/Nebulosa.html "Nebulosa"
[NewWave]: https://bioconductor.org/packages/release/bioc/html/NewWave.html "NewWave"
[pipeComp]: https://bioconductor.org/packages/release/bioc/html/pipeComp.html "pipeComp"
[recount3]: https://bioconductor.org/packages/release/bioc/html/recount3.html "recount3"
[scCB2]: https://bioconductor.org/packages/release/bioc/html/scDataviz.html "scCB2"
[scDataviz]: https://bioconductor.org/packages/release/bioc/html/scDataviz.html "scDataviz"
[scuttle]: https://bioconductor.org/packages/release/bioc/html/scuttle.html "scuttle"
[snifter]: https://bioconductor.org/packages/release/bioc/html/snifter.html "snifter"
[SpatialExperiment]: https://bioconductor.org/packages/release/bioc/html/SpatialExperiment.html "SpatialExperiment"
[SPsimSeq]: https://bioconductor.org/packages/release/bioc/html/SPsimSeq.html "SPsimSeq"
[velociraptor]: https://bioconductor.org/packages/release/bioc/html/velociraptor.html "velociraptor"
[BASiCS]: https://bioconductor.org/packages/release/bioc/html/BASiCS.html "BASiCS"
[basilisk]: https://bioconductor.org/packages/release/bioc/html/basilisk.html "basilisk"
[DESeq2]: https://bioconductor.org/packages/release/bioc/html/DESeq2.html "DESeq2"
[DropletUtils]: https://bioconductor.org/packages/release/bioc/html/DropletUtils.html "DropletUtils"
[edgeR]: https://bioconductor.org/packages/release/bioc/html/edgeR.html "edgeR"
[limma]: https://bioconductor.org/packages/release/bioc/html/limma.html "limma"
[scran]: https://bioconductor.org/packages/release/bioc/html/scran.html "scran"
