---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Splatter, a package for simulating single-cell RNA sequencing data"
event: "Bioconductor Asia Meeting 2017"
event_url:
location: "South Australian Health and Medical Research Institute"
address:
  street: "North Terrace"
  city: "Adelaide"
  region: "South Australia"
  postcode: "5000"
  country: "Australia"
summary: "Selected talk at the 2017 Bioconductor Asia Meeting where I presented
technical details of the Splatter package."
abstract: "Single-cell RNA sequencing (scRNA-seq) has opened up a range of
opportunities for investigating the transcriptome, but with the dramatic
increase in resolution comes an array of bioinformatics challenges. Single-cell
data is relatively sparse (for both biological and technical reasons), quality
control is difficult and it is unclear if methods designed for bulk RNA-seq are
appropriate for scRNA-seq data. Researchers have risen to address these
challenges and there are now more than 140 scRNA-seq analysis tools available.
However, with so many tools available researchers are faced with the difficult
task of choosing which to use, making it important to be able to assess and
compare the performance, quality and limitations of each tool. One common
approach is to test methods on simulated datasets where the true answers are
known. To aid this process we have developed Splatter, a Bioconductor R package
for reproducible simulation of scRNA-seq datasets
(bioconductor.org/packages/splatter).


Splatter is a simulation framework that provides access to a variety of
simulation models, allowing users to estimate parameters from real data in order
to easily generate realistic synthetic scRNA-seq datasets. As part of Splatter
we also introduce our own simulation model, Splat, capable of reproducing
scRNA-seq datasets with multiple groups of cells, differentiation paths or batch
effects. Here we will discuss some how Splatter can be used to develop and
compare analysis tools. We will also touch on our experience developing
Splatter, some of the design choices we made and how we have integrated other
Bioconductor packages such as the SingleCellExperiment class."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2017-11-17
# date_end: 2020-03-28T18:05:45+01:00
all_day: true

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T18:05:45+01:00

authors: ["**Luke Zappia**", "Belinda Phipson", "Alicia Oshlack"]
tags: ["single-cell", "RNA-seq", "simulation", "software", "splatter", "R",
"bioconductor"]

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
url_slides: "https://speakerdeck.com/lazappi/biocasia-2017"

url_code: "https://github.com/Oshlack/splatter"
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
projects: ["splatter"]
---
