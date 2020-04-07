---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Bioconductor 3.3 packages"
subtitle: ""
summary: "Wrap up of new packages in the Bioconductor 3.3 release."
authors: ["**Luke Zappia**"]
tags: ["R", "Bioconductor"]
categories: ["migrated", "migrated2020"]
date: 2016-05-03
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

Bioconductor 3.3 has just been released. You can find the complete list of new
packages (and changes to existing packages)
[here](https://bioconductor.org/news/bioc_3_3_release/) but here are a few I
thought might be interesting based on the description. I might have more to say
once I've had time to try a few out.

* **debrowser** – Interactive plots and tables for differential expression
* **DEFormats** – convert between differential expression formats
* **EBSEA** – exon based differential expression
* **EmpiricalBrownsMethod** – combining dependent p-values
* **Linnorm** – normalisation for parametric tests, simulation of RNA-seq data
* **multiClust** – feature selection and clustering analysis for transcriptomic
  data
* **RGraph2js** – interactive network visualisations with D3
* **tximport** – import and summarise transcript-level estimates

## Single-cell

These packages are specific to single-cell RNA-seq analysis. A couple of them I
am already familiar with, particularly **scater**.

* **cellity** - identifying low-quality cells
* **celTree** - model the relationship between individual cells over time or
  space.
* **scater** - tools for analysis of single-cell RNA-seq data (particularly QC)
* **scde** - single-cell differential expression
* **scran** - normalisation, cell-cycle assignment, gene detection
