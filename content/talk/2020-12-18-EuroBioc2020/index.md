---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Interoperability between Bioconductor and Python for scRNA-seq analysis"
event: "European Bioconductor Meeting 2020"
event_url: https://eurobioc2020.bioconductor.org/
location: "Virtual conference"
summary: "Invited keynote at the European Bioconductor meeting 2020"
abstract: "Unlike traditional bulk RNA-seq analysis which is dominated by
Bioconductor, packages for analysing single-cell RNA sequencing data are more
fragmented. Currently, there are three key ecosystems, the
[Seurat](https://satijalab.org/seurat/) package (available from CRAN),
Bioconductor's [SingleCellExperiment](https://bioconductor.org/packages/SingleCellExperiment/)
object and the [AnnData](https://anndata.readthedocs.io/en/latest/index.html)
Python object used by the [Scanpy](https://scanpy.readthedocs.io/en/stable/)
package. While these platforms each have strengths and weaknesses most analysts
are likely to only use one of them. In this talk, I discuss how interoperability
between R and Python can allow us to take advantage of these platforms strengths
and avoid unnecessary reimplementation of methods. I highlight the [reticulate](https://rstudio.github.io/reticulate/) R package for interacting with Python, the
[basilisk](https://bioconductor.org/packages/basilisk/) package for
encapsulating Python environments, my
[zellkonverter](https://bioconductor.org/packages/zellkonverter/) package for
converting between AnnData and SingleCellExperiment objects and the
[velociraptor](https://bioconductor.org/packages/velociraptor/) package as an
example of wrapping a Python package. The methods in the
[scVelo](http://scvelo.org/) (package wrapped by velociraptor) for calculating
RNA velocity and the [CellRank](http://cellrank.org/) package for estimating
state transitions will also be briefly described."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2020-12-18T14:00:00+01:00
date_end: 2020-12-18T14:45:00+01:00
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: 2020-12-11T12:00:00+02:00

authors: ["**Luke Zappia**"]
tags: ["single-cell", "rna-seq", "software", "interoperability", "R", "python",
"Bioconductor"]

# Is this a featured talk? (true/false)
featured: true

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
url_slides: "https://speakerdeck.com/lazappi/interoperability-between-bioconductor-and-python-for-scrna-seq-analysis"

url_code: "https://github.com/theislab/zellkonverter"
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
projects: ["zellkonverter"]
---
