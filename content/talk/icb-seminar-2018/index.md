---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Tools, simulations and trees for scRNA-seq"
event: "Institute of Computational Biology"
event_url:
location: "Institute of Computational Biology, Helmholtz Zentrum München"
address:
  street: "Ingolstädter Landstrasse 1"
  city: "Neuherberg"
  region: "Bayern"
  postcode: "85764"
  country: "Germany"
summary: "Presentation at the Institute of Computational Biology where I
described my PhD projects."
abstract: "The past few years have seen an explosion in the development of
single-cell RNA-sequencing technology and it has quickly become a commonly used
tool for interrogating complex tissues. Access to this new type of data has lead
to a corresponding surge in the production of statistical and computational
tools to analyse it. We are cataloguing in the scRNA-tools database
(www.scRNA-tools.org). Deciding which of these tools to use for a specific task
is difficult and comprehensive evaluations and comparisons are required. One way
to demonstrate how well tools perform at their selected task is by testing them
on simulated data. To make this easier we developed Splatter, a Bioconductor R
package that provides a consistent, easy-to-use interface for multiple models
for simulating scRNA-seq data (https://bioconductor.org/packages/splatter).
Providing independent simulation software avoids relying on simulations that are
not reproducible, match the tools assumptions and do not demonstrate similarity
to real datasets.


Even the most effective methods usually have parameters that affect how they
perform. For scRNA-seq data one of the analysis tasks that has received the most
attention is defining groups of similar cells, usually through unsupervised
clustering. Most clustering methods have parameters which, directly or
indirectly, affect the number of clusters produced. The clustering resolution
that is chosen can have a profound effect on further analysis and interpretation
but it is unclear how to make this choice. To aid analysts in deciding which
clustering resolution to use we have developed clustering trees, a visualisation
that shows how clusters form and change as the resolution increases. These trees
can be produced using the clustree R package
(http://cran.r-project.org/package=clustree) and are applicable to any
clustering method. Clustering trees highlight instability that may indicate over
clustering and help choose which resolution to use, particularly when combined
with existing domain knowledge such as the expression of marker genes. This
presentation will demonstrate our methods and tools using an scRNA-seq dataset
we have generated to explore the cell type composition of kidney organoids."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2018-09-27
# date_end: 2020-03-28T18:35:19+01:00
all_day: true

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T18:35:19+01:00

authors: ["**Luke Zappia**"]
tags: ["single-cell", "rna-seq", "simulation", "database", "visualisation",
"splatter", "clustree", "scrna-tools", "software", "kidney", "organoids",
"analysis", "PhD"]

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
url_slides: "https://speakerdeck.com/lazappi/phd-europe-2018"

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
projects: ["splatter", "clustree", "scRNA-tools"]
---
