---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "zellkonverter"
summary: "Bioconductor R package converting between scRNA-seq objects."
authors: ["**Luke Zappia**", "Aaron Lun"]
tags: ["single-cell", "rna-seq", "interoperability", "software", "R", "Bioconductor"]
categories: ["software"]
date: 2020-07-12T15:17:55+02:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false
  alt_text: zellkonverter logo

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/theislab/zellkonverter"
url_project: "https://bioconductor.org/packages/zellkonverter/"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

zellkonverter is a Bioconductor R package that provides methods to convert
between Python [AnnData](https://anndata.readthedocs.io/en/latest/index.html)
objects and [SingleCellExperiment](https://bioconductor.org/packages/SingleCellExperiment/)
objects (https://bioconductor.org/packages/zellkonveter/). These are primarily
intended for use by downstream Bioconductor packages that wrap Python methods
for single-cell data analysis. It also includes functions to read and write H5AD
files used for saving AnnData objects to disk.
