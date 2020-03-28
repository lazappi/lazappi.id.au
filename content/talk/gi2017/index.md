---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Simulation and analysis tools for single-cell RNA sequencing data"
event: "Genome Informatics 2017"
event_url: "https://meetings.cshl.edu/meetings.aspx?meet=INFO&year=17"
location: "Cold Spring Harbor Labs"
address:
  street: "1 Bungtown Rd"
  city: "Cold Spring Harbor"
  region: "New York"
  postcode: "11724"
  country: "USA"
summary: "Selected talk at the Genome Informatics 2017 conference describing
Splatter and the scRNA-tools database."
abstract: "Single-cell RNA sequencing (scRNA-seq) is rapidly becoming a tool of
choice for biologists who wish to investigate gene expression. In contrast to
traditional bulk RNA-seq experiments, which measure expression averaged across
millions of cells, single-cell experiments can be used to observe how genes are
expressed in individual cells. Along with the dramatic increase in resolution
provided by scRNA-seq comes an array of bioinformatics challenges. Single-cell
data is relatively sparse (for both biological and technical reasons), quality
control is difficult and it is unclear how to replicate measurements.
Researchers have risen to address these challenges and there are currently more
than 125 software tools available for analysing scRNA-seq data. We have
catalogued these software tools in the scRNA-tools database
(www.scRNA-tools.org). Analysis of this database shows that there are now
methods available for a wide range of tasks, from pre-processing unique
molecular identifiers to detecting allele-specific expression. However, the
biggest areas of development have been in clustering cells to identify cell
types and ordering of cells to understand dynamic processes. We also find that
the R statistical programming language is the most popular platform for
scRNA-seq analysis tools, followed by Python, and that the majority of tools
have been described in peer-reviewed papers or preprints and are available under
open-source software licenses.


With the ever increasing number of analysis methods available it is important to
be able to assess and compare the performance, quality and limitations of an
analysis tool. This is often done, at least in part, by testing methods on
simulated datasets where the true answers are known. Unfortunately, current
scRNA-seq simulations are frequently poorly documented, not reproducible and do
not demonstrate similarity to real data or experimental designs. To address
these concerns we have developed Splatter, a Bioconductor R package for
reproducible simulation of scRNA-seq datasets. Splatter is a simulation
framework that currently includes four previously published simulation models,
allowing users to estimate parameters from real data in order to easily generate
realistic synthetic scRNA-seq datasets. Here we discuss some of the challenges
of simulating scRNA-seq data and present a comparison of the simulation methods
available in Splatter (bioconductor.org/packages/splatter). As part of Splatter
we also introduce our own simulation model, Splat, capable of reproducing
scRNA-seq datasets with multiple groups of cells, differentiation paths or batch
effects."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2017-11-01
# date_end: 2020-03-28T17:53:32+01:00
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T17:53:32+01:00

authors: ["**Luke Zappia**", "Belinda Phipson", "Alicia Oshlack"]
tags: ["single-cell", "rna-seq", "simulation", "database", "splatter",
"scRNA-tools", "software"]

# Is this a featured talk? (true/false)
featured: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

# Optional filename of your slides within your talk's folder or a URL.
url_slides: https://speakerdeck.com/lazappi/gi2017-simulation-and-analysis-tools-for-single-cell-rna-sequencing-data

url_code:
url_pdf:
url_video:

# Markdown Slides (optional).
#   Associate this talk with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: ["splatter", "scRNA-tools"]
---
