---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "prettytc"
summary: "A Python script for pretty printing of TeXcount output"
authors: ["**Luke Zappia**"]
tags: ["software", "python"]
categories: ["software"]
date: 2016-03-30T18:22:07+01:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false
  alt_tex: Image showing the output of prettytc

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/lazappi/prettytc"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

TeXcount is excellent and by far the best way to produce wordcounts of LaTeX
documents but I found the output became hard to read for large documents.

prettytc is a Python script that runs TeXcount and parses the output in a way
that shows more of the document structure and provides totals at each level. It
can be run from the command line and any options are passed to TeXcount.

Available from my GitHub https://github.com/lazappi/prettytc.
