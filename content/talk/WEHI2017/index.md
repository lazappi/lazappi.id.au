---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Single-cells, simulation and kidneys in a dish"
event: "WEHI Bioinformatics Seminar"
event_url: 
location: "Walter and Eliza Hall Institute"
address:
  street: "1G Royal Parade"
  city: "Parkville"
  region: "Victoria"
  postcode: "3052"
  country: "Australia"
summary: "WEHI Bioinformatics seminar series presenting my PhD projects."
abstract: "Single-cell RNA sequencing (scRNA-seq) is rapidly becoming a tool of
choice for biologists wishing to investigate gene expression at greater
resolution, particularly in areas such as development and differentiation.
Single-cell data presents an array of bioinformatics challenges, data is sparse
(for both biological and technical reasons), quality control is difficult and it
is unclear how to replicate measurements. As scRNA-seq datasets have become
available so have a plethora of analysis methods. Evaluation of these methods
relies on having a truth to test against or a deep biological knowledge to
interpret the results. Unfortunately current scRNA-seq simulations are
frequently poorly documented, not reproducible and do not demonstrate similarity
to real data or experimental designs. In this talk I will present Splatter, a
Bioconductor package for simulating scRNA-seq data that is designed to address
these issues. Splatter provides a consistent, easy to use interface to several
previously published simulations allowing researchers to estimate parameters,
produce synthetic datasets and compare how well they replicate real data.
Splatter also includes Splat, our own simulation model. Based on a gamma-Poisson
hierarchical model, Splat includes additional features often seen in scRNA-Seq
data, such as dropout, and can be used to simulate complex experiments including
multiple cell types, differentiation lineages and multiple batches. I will also
discuss an analysis of a complex kidney organoid dataset, showing how more cells
and different levels of clustering help to reveal greater biological insight."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2017-07-17T10:45:00+10:00
date_end: 2017-07-17T11:45:00+10:00
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T17:19:59+01:00

authors: ["**Luke Zappia**"]
tags: ["single-cell", "rna-seq", "simulation", "visualisation", "database",
"organoids", "kidney", "software", "splatter", "scRNA-tools", "R", "PhD"]

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
url_slides: "https://speakerdeck.com/lazappi/wehi-bioinformatics-seminar"

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
