---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Phd Commits"
summary: "Functions for scraping git commits from repositories associated with a PhD (or anything else) and plotting them."
authors: ["**Luke Zappia**"]
tags: ["visualisation", "R"]
categories: []
date: 2019-08-08T17:45:06+01:00

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false
  alt_text: Plot showing git commits over time divided by category

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/lazappi/phd-commits"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

R scripts that can be used to scrape the git commit history of a project. The
commits can then be categorised and used to produce a animated plot of the
project over time as shown below. This was originally created as a way of
displaying activity of my PhD but could be used for any project.

![](https://raw.githubusercontent.com/lazappi/phd-commits/master/phd_commits.gif)
