---
title: "Bioconductor 3.11 wrap-up"
description: "My wrap-up of the Bioconductor 3.11 release"
authors: ["**Luke Zappia**"]
categories: ["bioconductor", "R"]
date: 2020-04-29
---

The Bioconductor 3.11 release was yesterday. Here is my wrap-up of new packages
and updates. This is only the things I found interesting based on the release
and they don't come with any particular endorsement. If there is
something else you are looking for have a look at the release notes
[here][bioc-news].

# New packages

* [**{basilisk}**][basilisk] - installs a self-contained Python instance that is
  maintained by the R installation
* [**{BiocDockerManager}**][BiocDockerManager] - management of Bioconductor
  Docker images
* [**{CiteFuse}**][CiteFuse] - suite of methods for working with CITE-seq data
* [**{clustifyr}**][clustifyr] - classify cells in scRNA-seq data using external
  references
* [**{cmapR}**][cmapR] - interface for the Broad Institute Connectivity Map
  resource of gene perturbation expression profiles
* [**{ctgGEM}**][ctgGEM] - streamlines building of cell-state hierarchies from
  single-cell gene expression data
* [**{distinct}**][distinct] - differential testing of distributions
* [**{dittoSeq}**][dittoSeq] - user friendly visualisation of bulk and
  single-cell RNA-seq data including consideration of colour blindness
* [**{Dune}**][Dune] - merges pairs of clusters to increase ARI and improve
  reproducibility
* [**{frenchFISH}**][frenchFISH] - Poisson models for DNA copy number from FISH
  data (_bonus points for the excellent name_)
* [**{GeneTonic}**][GeneTonic] - Shiny app for looking at enrichment results
  from expression data (_another great name_)
* [**{HIPPO}**][HIPPO] - scRNA-seq feature selection and clustering
* [**{ISEEu}**][ISEEu] - extensions for the [**{iSEE}**][iSEE] shiny app
* [**{mitch}**][mitch] - multi-contrast enrichment analysis
* [**{peco}**][peco] - predicting cell-cycle progression using scRNA-seq data
* [**{scClassify}**][scClassify] - multi-scale classification of scRNA-seq data
  using cell hierarchies
* [**{scHOT}**][scHOT] - testing changes in higher-order structure of gene
  expression such as across (pseudo) time or space
* [**{scry}**][scry] - count-based feature selection and dimensionality
  reduction for small count data
* [**{scTHI}**][scTHI] - identify active ligand-receptor pairs in scRNA-seq data
* [**{SingleCellSignalR}**][SingleCellSignalR] - clustering of scRNA-seq data
  and inference of cell-cell interactions
* [**{sparseMatrixStats}**][sparseMatrixStats] - high-performance functions for
  row and column operations on sparse matrices, inspired by **{matrixStats}**
* [**{tidybulk}**][tidybulk] - tidy wrappers for bulk RNA-seq analysis

# Updates

* [**{BASiCS}**][BASiCS] - many updates and release of version 2
* [**{batchelor}**][batchelor] - support of arbitrary design matrices and
  extension of MNN integration to cluster centroids
* [**{DropletUtils}**][DropletUtils] - down sampling of batches, writing to 10x
  format, removal of chimeric reads, demultiplexing of cell hashing experiments
* [**{edgeR}**][edgeR] - integration of the limma voom-lmFit pipeline, support
  for [**{SummarizedExperiment}**][SummarizedExperiment] objects
* [**{iSEE}**][iSEE] - support of extensions such as those in
  [**{ISEEu}**][ISEEu]
* [**{limma}**][limma] - `changeLog()` function can be used with any package,
  improved treatment of NA values
* [**{missMethyl}**][missMethyl] - bug fixes and `fract.counts` argument
* [**{PCAtools}**][PCAtools] - functions for choosing the ideal number of
  components to retain
* [**{scater}**][scater] - multi-feature set UMAP and various new arguments
* [**{scran}**][scran] - new functions for sub-clustering and cluster
  bootstrapping, wrappers for graph-based clustering, updates to marker
  identification functions
* [**{SummarizedExperiment}**][SummarizedExperiment] - support for assays with
  more than four dimensions, changes to assay getters and setters to check
  dimnames
* [**{tximeta}**][tximeta] - functions for splitting
  [**{SummarizedExperiment}**][SummarizedExperiment] objects and conversion to
  DGEList
* [**{tximport}**][tximport] - improved support for importing Alevin output

# Workflow packages

* [**{fluentGenomics}**][fluentGenomics] - extended workflow using the
  **{plyranges}** and [**{tximeta}**][tximeta] packages for fluent
  genomic analysis

[bioc-news]: https://bioconductor.org/news/bioc_3_11_release/ "Bioc 3.11 news"
[basilisk]: https://bioconductor.org/packages/release/bioc/html/basilisk.html "basilisk"
[BiocDockerManager]: https://bioconductor.org/packages/release/bioc/html/BiocDockerManager.html "BiocDockerManager"
[CiteFuse]: https://bioconductor.org/packages/release/bioc/html/CiteFuse.html "CiteFuse"
[clustifyr]: https://bioconductor.org/packages/release/bioc/html/clustifyr.html "clustifyr"
[cmapR]: https://bioconductor.org/packages/release/bioc/html/cmapR.html "cmapR"
[ctgGEM]: https://bioconductor.org/packages/release/bioc/html/ctgGEM.html "ctgGEM"
[distinct]: https://bioconductor.org/packages/release/bioc/html/distinct.html "distinct"
[dittoSeq]: https://bioconductor.org/packages/release/bioc/html/dittoSeq.html "dittoSeq"
[Dune]: https://bioconductor.org/packages/release/bioc/html/Dune.html "Dune"
[frenchFISH]: https://bioconductor.org/packages/release/bioc/html/frenchFISH.html "frenchFISH"
[GeneTonic]: https://bioconductor.org/packages/release/bioc/html/GeneTonic.html "GeneTonic"
[HIPPO]: https://bioconductor.org/packages/release/bioc/html/HIPPO.html "HIPPO"
[ISEEu]: https://bioconductor.org/packages/release/bioc/html/HIPPO.html "ISEEu"
[mitch]: https://bioconductor.org/packages/release/bioc/html/mitch.html "mitch"
[peco]: https://bioconductor.org/packages/release/bioc/html/peco.html "peco"
[scClassify]: https://bioconductor.org/packages/release/bioc/html/scClassify.html "scClassify"
[scHOT]: https://bioconductor.org/packages/release/bioc/html/scHOT.html "scHOT"
[scry]: https://bioconductor.org/packages/release/bioc/html/scry.html "scry"
[scTHI]: https://bioconductor.org/packages/release/bioc/html/scTHI.html "scTHI"
[SingleCellSignalR]: https://bioconductor.org/packages/release/bioc/html/SingleCellSignalR.html "SingleCellSignalR"
[sparseMatrixStats]: https://bioconductor.org/packages/release/bioc/html/sparseMatrixStats.html "sparseMatrixStats"
[tidybulk]: https://bioconductor.org/packages/release/bioc/html/tidybulk.html "tidybulk"
[fluentGenomics]: https://bioconductor.org/packages/release/bioc/html/scClassify.html "fluentGenomics"
[BASiCS]: https://bioconductor.org/packages/release/bioc/html/BASiCS.html "BASiCS"
[batchelor]: https://bioconductor.org/packages/release/bioc/html/batchelor.html "batchelor"
[DropletUtils]: https://bioconductor.org/packages/release/bioc/html/DropletUtils.html "DropletUtils"
[edgeR]: https://bioconductor.org/packages/release/bioc/html/edgeR.html "edgeR"
[iSEE]: https://bioconductor.org/packages/release/bioc/html/iSEE.html "iSEE"
[limma]: https://bioconductor.org/packages/release/bioc/html/limma.html "limma"
[missMethyl]: https://bioconductor.org/packages/release/bioc/html/missMethyl.html "missMethyl"
[PCAtools]: https://bioconductor.org/packages/release/bioc/html/pcaTools.html "PCAtools"
[scater]: https://bioconductor.org/packages/release/bioc/html/scater.html "scater"
[scran]: https://bioconductor.org/packages/release/bioc/html/scran.html "scran"
[SummarizedExperiment]: https://bioconductor.org/packages/release/bioc/html/SummarizedExperiment.html "SummarizedExperiment"
[tximeta]: https://bioconductor.org/packages/release/bioc/html/tximeta.html "tximeta"
[tximport]: https://bioconductor.org/packages/release/bioc/html/tximport.html "tximport"
