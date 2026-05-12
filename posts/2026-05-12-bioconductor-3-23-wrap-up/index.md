---
title: "Bioconductor 3.23 wrap-up"
description: "My wrap-up of the Bioconductor 3.23 release"
authors: ["**Luke Zappia**"]
categories: ["bioconductor", "R"]
date: 2026-05-12
---

The Bioconductor 3.23 release was a couple of weeks ago.
Here is my wrap-up of new packages and updates.
This is only the things I found interesting based on the release notes and they don't come with any particular recommendations.
If there is something else you are interested in have a look at the full release notes [here][bioc-news].

# My packages

## [**{anndataR}**][anndataR]

* Add initial support for reading and writing Zarr stores.
  This was a major effort from members of the community.
* Improvements to chunking when writing H5AD files
* Improvements to performance when reading sparse matrices
* Improved warnings and error handling
* Improved tests, documentation and CI

## [**{splatter}**][splatter]

* Replace deprecated functions from [**{scuttle}**][scuttle] with equivalents in [**{scrapper}**][scrapper]
* Deprecate the MFA simulation functions now that the **{mfa}** package is deprecated
* Minor maintenance updates

## [**{zellkonverter}**][zellkonverter]

* Minor updates to tests and documentation

# New packages

* [**{BatChef}**][BatChef] - benchmark batch correction methods for scRNA-seq data and help pick an appropriate one
* [**{Battlefield}**][Battlefield] - low-level utilities for working with spatial transcriptomics regions, interfaces and layers
* [**{betterChromVAR}**][betterChromVAR] - faster chromVAR-style inference of TF activity for bulk and single-cell ATAC-seq
* [**{CellMentor}**][CellMentor] - supervised dimensionality reduction that tries to preserve known cell-type structure
* [**{DenoIST}**][DenoIST] - removes neighbourhood contamination from image-based spatial transcriptomics data
* [**{dominatR}**][dominatR] - visualises feature dominance using concepts from physics
* [**{GraphExperiment}**][GraphExperiment] - extends `SingleCellExperiment` with infrastructure for storing feature-level networks
* [**{hammers}**][hammers] - utilities package for scRNA-seq analysis using both `Seurat` and `SingleCellExperiment`
* [**{jvecfor}**][jvecfor] - faster nearest-neighbour search for large single-cell datasets with drop-in replacements for common Bioconductor workflows
* [**{RankMap}**][RankMap] - fast reference-based cell type annotation for single-cell and spatial transcriptomics data
* [**{scConform}**][scConform] - cell type annotation with conformal prediction intervals and uncertainty quantification
* [**{scECODA}**][scECODA] - workflow for analysing cell type proportions as compositional data
* [**{scLang}**][scLang] - developer-facing helpers for writing scRNA-seq packages that work with both Seurat and `SingleCellExperiment`
* [**{scPassport}**][scPassport] - stores a persistent metadata passport inside `Seurat` and `SingleCellExperiment` objects
* [**{scTypeEval}**][scTypeEval] - tools for evaluating cell type assignments with limited ground truth data
* [**{SpatialArtifacts}**][SpatialArtifacts] - quality control for identifying spatial artifacts in Visium and Visium HD data
* [**{SpNeigh}**][SpNeigh] - neighbourhood-aware spatial transcriptomics analysis including boundary detection and spatial differential expression
* [**{tidyprint}**][tidyprint] - tidier print methods for `SummarizedExperiment` objects
* [**{VISTA}**][VISTA] - wraps differential expression workflows and visualisation in a `SummarizedExperiment`-based container
* [**{ZarrArray}**][ZarrArray] - `DelayedArray`-backed infrastructure for working with Zarr datasets in R

# Updates

* [**{DropletUtils}**][DropletUtils] - `downsampleReads()` now uses the faster downsampling algorithm from [**{scuttle}**][scuttle]
* [**{edgeR}**][edgeR] - new `DGEListFromTximport()` and `DGEListFromTximeta()` helpers plus a `sampleWeights()` function
* [**{limma}**][limma] - `voom()` gains offset support and `topTableF()` is now finally removed
* [**{Rarr}**][Rarr] - major updates including moving the `DelayedArray` backend into the new [**{ZarrArray}**][ZarrArray] package and improved Zarr v3 support
* [**{Rhdf5lib}**][Rhdf5lib] - build updates and an update to HDF5 1.14.6
* [**{rhdf5}**][rhdf5] - updated to HDF5 1.14.6 and various fixes and improvements
* [**{scran}**][scran] - deprecates several functions in favour of [**{scrapper}**][scrapper] and fixes overflow bugs
* [**{scrapper}**][scrapper] - multiple updates to several functions, continues the migration of functionality out of [**{scran}**][scran] and [**{scuttle}**][scuttle]
* [**{scuttle}**][scuttle] - faster `downsampleMatrix()` and `summarizeAssayByGroup()`, more deprecations in favour of `scrapper`
* [**{SingleCellExperiment}**][SingleCellExperiment] - improved warnings for named assay getters and setters
* [**{tximeta}**][tximeta] - matching updates for [**{edgeR}**][edgeR]'s new `DGEListFromTximeta()` workflow
* [**{tximport}**][tximport] - vignette updates around the new [**{edgeR}**][edgeR] integration

::: {.callout-note title="AI Disclaimer"}
AI was used to research and draft this post.
It did a reasonable job on matching the style of previous posts but it missed several packages I had to tell it to add later.
Overall, it was moderately successful.
:::

[bioc-news]: https://bioconductor.org/news/bioc_3_23_release/ "Bioconductor 3.23 release notes"
[splatter]: https://bioconductor.org/packages/release/bioc/html/splatter.html "splatter"
[zellkonverter]: https://bioconductor.org/packages/release/bioc/html/zellkonverter.html "zellkonverter"
[BatChef]: https://bioconductor.org/packages/release/bioc/html/BatChef.html "BatChef"
[Battlefield]: https://bioconductor.org/packages/release/bioc/html/Battlefield.html "Battlefield"
[betterChromVAR]: https://bioconductor.org/packages/release/bioc/html/betterChromVAR.html "betterChromVAR"
[CellMentor]: https://bioconductor.org/packages/release/bioc/html/CellMentor.html "CellMentor"
[DenoIST]: https://bioconductor.org/packages/release/bioc/html/DenoIST.html "DenoIST"
[dominatR]: https://bioconductor.org/packages/release/bioc/html/dominatR.html "dominatR"
[GraphExperiment]: https://bioconductor.org/packages/release/bioc/html/GraphExperiment.html "GraphExperiment"
[hammers]: https://bioconductor.org/packages/release/bioc/html/hammers.html "hammers"
[SingleCellExperiment]: https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html "SingleCellExperiment"
[jvecfor]: https://bioconductor.org/packages/release/bioc/html/jvecfor.html "jvecfor"
[RankMap]: https://bioconductor.org/packages/release/bioc/html/RankMap.html "RankMap"
[scConform]: https://bioconductor.org/packages/release/bioc/html/scConform.html "scConform"
[scECODA]: https://bioconductor.org/packages/release/bioc/html/scECODA.html "scECODA"
[scLang]: https://bioconductor.org/packages/release/bioc/html/scLang.html "scLang"
[scPassport]: https://bioconductor.org/packages/release/bioc/html/scPassport.html "scPassport"
[scTypeEval]: https://bioconductor.org/packages/release/bioc/html/scTypeEval.html "scTypeEval"
[Seqtometry]: https://bioconductor.org/packages/release/bioc/html/Seqtometry.html "Seqtometry"
[SpatialArtifacts]: https://bioconductor.org/packages/release/bioc/html/SpatialArtifacts.html "SpatialArtifacts"
[SpNeigh]: https://bioconductor.org/packages/release/bioc/html/SpNeigh.html "SpNeigh"
[tidyprint]: https://bioconductor.org/packages/release/bioc/html/tidyprint.html "tidyprint"
[VISTA]: https://bioconductor.org/packages/release/bioc/html/VISTA.html "VISTA"
[ZarrArray]: https://bioconductor.org/packages/release/bioc/html/ZarrArray.html "ZarrArray"
[anndataR]: https://bioconductor.org/packages/release/bioc/html/anndataR.html "anndataR"
[DropletUtils]: https://bioconductor.org/packages/release/bioc/html/DropletUtils.html "DropletUtils"
[edgeR]: https://bioconductor.org/packages/release/bioc/html/edgeR.html "edgeR"
[escape]: https://bioconductor.org/packages/release/bioc/html/escape.html "escape"
[limma]: https://bioconductor.org/packages/release/bioc/html/limma.html "limma"
[Rarr]: https://bioconductor.org/packages/release/bioc/html/Rarr.html "Rarr"
[Rhdf5lib]: https://bioconductor.org/packages/release/bioc/html/Rhdf5lib.html "Rhdf5lib"
[rhdf5]: https://bioconductor.org/packages/release/bioc/html/rhdf5.html "rhdf5"
[scran]: https://bioconductor.org/packages/release/bioc/html/scran.html "scran"
[scrapper]: https://bioconductor.org/packages/release/bioc/html/scrapper.html "scrapper"
[scuttle]: https://bioconductor.org/packages/release/bioc/html/scuttle.html "scuttle"
[tximeta]: https://bioconductor.org/packages/release/bioc/html/tximeta.html "tximeta"
[tximport]: https://bioconductor.org/packages/release/bioc/html/tximport.html "tximport"
