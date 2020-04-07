---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Clustering trees for visualising scRNA-seq data"
event: "Oz Single Cells 2018"
event_url:
location: "Garvan Institute of Medical Research"
address:
  street: "384 Victoria St"
  city: "Darlinghurst"
  region: "New South Wales"
  postcode: "2010"
  country: "Australia"
summary: "Selected talk at the Oz Single Cells 2018 conference where I presented
clustering trees and the clustree package."
abstract: "Single-cell RNA-sequencing is commonly used to interrogate complex
tissues in order to identify and compare the cell types present. This type of
experiment is particularly prevalent in the developmental setting. A key step in
this approach is assigning cells to different clusters that are assumed to be
distinct cell types. Although this can be done by comparison with reference
datasets, cells are more routinely grouped using unsupervised clustering and we
have catalogued more than 60 scRNA-seq clustering methods. Most clustering
methods have parameters which affect the number of clusters produced, either
through specifying an exact number, a parameter which controls the clustering
resolution or indirectly through other parameters. The resolution that is chosen
can have a profound effect on further analysis but it is unclear how to make
this choice. Existing clustering metrics often score only single clusters or
resolutions, or require datasets to be perturbed and clustered multiple times
which can be infeasible for large datasets. Here we present clustering trees as
an alternative visualisation that shows the relationship between clusters as the
clustering resolution increases. These trees can highlight instability that may
indicate overclustering and help choose which resolution to use, particularly
when combined with existing domain knowledge such as the expression of marker
genes. More generally, clustering trees are a compact, information dense
visualisation that can serve as an alternative to plotting cells in reduced
dimensions such as t-SNE. Here we explain how clustering trees are produced
using the clustree R package (http://cran.r-project.org/package=clustree) and
illustrate how they can be used with a examples of scRNA-seq data from kidney
organoids."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2018-07-16
# date_end: 2020-03-28T18:18:05+01:00
all_day: true

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T18:18:05+01:00

authors: ["**Luke Zappia**", "Alicia Oshlack"]
tags: ["visualisation", "clustering", "software", "clustree", "R", "CRAN"]

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
url_slides: "https://speakerdeck.com/lazappi/clustering-trees-for-visualising-scrna-seq-data"

url_code: "https://github.com/lazappi/clustree"
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
projects: ["clustree"]
---
