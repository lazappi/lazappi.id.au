---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "clustree: producing clustering trees using ggraph"
event: "useR! 2018"
event_url: "https://www.r-project.org/conferences/useR-2018/"
location: "Brisbane Convention and Exhibition Centre"
address:
  street: "Cnr Merivale and Glenelg Streets"
  city: "Brisbane"
  region: "Queensland"
  postcode: "4101"
  country: "Australia"
summary: "Presentation at the userR! 2018 conference introducing the clustree
package and demonstrating how it makes use of the ggraph package."
abstract: "Clustering analysis is commonly used in many fields to group together
similar samples. Many clustering algorithms exist, but all of them require some
sort of user input to set parameters that affect the number of clusters
produced. Deciding on the correct number of clusters for a given dataset is a
difficult problem that can be tackled by looking at the relationships between
samples at different resolutions. Here I will present clustree, an R package for
producing clustering tree visualisations. These visualisations combine
information from multiple clusterings with different resolutions, showing where
new clusters come from and how samples change clusters as the number of clusters
increases. Summarised information describing the samples in each cluster can be
overlaid on the tree to give additional insight. I will also describe my
experience developing clustree, particularly how I have made use of the ggraph
package. The clustree package is available at
https://github.com/lazappi/clustree and a preprint describing clustering trees
can be read at https://www.biorxiv.org/content/early/2018/03/02/274035."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2018-07-21T16:30:00+10:00
date_end: 2018-07-21T16:50:00+10:00
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T16:45:38+01:00

authors: ["**Luke Zappia**"]
tags: ["visualisation", "software", "R"]

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
url_slides: https://speakerdeck.com/lazappi/clustree-a-package-for-producing-clustering-trees-using-ggraph
url_code: https://github.com/lazappi/clustree
url_video: https://youtu.be/FQVq8k-w828

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
