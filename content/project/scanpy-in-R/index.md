---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Scanpy in R"
summary: "Tutorial describing how to interact with the Scanpy Python package from R."
authors: ["**Luke Zappia**"]
tags: ["single-cell", "rna-seq", "interoperability", "python", "scanpy", "R", "tutorial"]
categories: []
date: 2020-04-17T13:31:20+02:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false
  alt_text: Scanpy in R logo

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/theislab/scanpy-in-R/"
url_project: "https://theislab.github.io/scanpy-in-R/"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

This tutorial covers how to set up a environment that lets you interact with
[Scanpy](https://scanpy.readthedocs.io/en/stable/) from R. This includes
converting Python [AnnData objects](https://anndata.readthedocs.io/en/latest/index.html)
to R [SingleCellExperiment](https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html)
and [Seurat](https://satijalab.org/seurat/) objects as well as interacting with
a Python environment directly in an [R Markdown](https://rmarkdown.rstudio.com/)
document. It demonstrates some of the functions in Scanpy but doesn't cover
everything the package can do or how best to use Scanpy for your analysis.
