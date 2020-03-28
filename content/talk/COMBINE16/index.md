---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Simplifying simulation of single-cell RNA-seq"
event: "COMBINE Symposium 2016"
event_url: https://combine.org.au/symposium-2016/
location: "Queensland University of Technology"
address:
  street: "2 George St"
  city: "Brisbane"
  region: "Queensland"
  postcode: "4000"
  country: "Australia"
summary: "Presentation at the 2016 COMBINE student symposium introducing the
Splatter package and the Splat scRNA-seq simulation model."
abstract: "Single-cell RNA sequencing (scRNA-seq) is rapidly becoming a tool of
choice for biologists who wish to investigate gene expression, particularly in
areas such as development and differentiation. In contrast to traditional bulk
RNA-seq experiments, which measure expression averaged across millions of cells,
single-cell experiments can be used to observe how genes are expressed in
individual cells. Along with the dramatic increase in resolution provided by
scRNA-seq comes an array of bioinformatics challenges. Single-cell data is
relatively sparse (for both biological and technical reasons), quality control
is difficult and it is unclear how to replicate measurements. The focus of
analysis is also different, with more emphasis on clustering cells to identify
cell types or ordering of cells to understand dynamic processes than traditional
tasks such as differential expression testing. Any new bioinformatics method for
scRNA-seq analysis should demonstrate two things: 1) it can do what it claims
and 2) it helps to produce biological insight. The first is hard to prove on
real data where there is often no known truth. Because of this,
bioinformaticians turn to simulations. Unfortunately current scRNA-seq
simulations are frequently poorly documented, not reproducible and do not
demonstrate similarity to real data or experimental designs. Here we discuss
some of the problems with simulating scRNA-seq data and provide a simulation
framework that addresses these concerns."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2016-10-31T11:20:00+10:00
date_end: 2016-10-31T11:40:00+10:00
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T17:01:05+01:00

authors: ["**Luke Zappia**", "Belinda Phipson", "Alicia Oshlack"]
tags: ["single-cell", "rna-seq", "simulation", "software", "splatter", "R"]

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
url_slides: "https://speakerdeck.com/lazappi/simplifying-simulation-of-single-cell-rna-seq"
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
