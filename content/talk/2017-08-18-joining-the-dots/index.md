---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Building a clustering tree"
event: "Joining the Dots Visualisation Symposium"
event_url: "https://joiningthedots.github.io/"
location: "Walter and Eliza Hall Institute"
address:
  street: "1G Royal Parade"
  city: "Parkville"
  region: "Victoria"
  postcode: "3052"
  country: "Australia"
summary: "Joining the Dots Visualisation Symposium talk describing the
clustering tree visualisation algorithm."
abstract: "A common task in many fields is to group objects or samples based on
their characteristics such that objects in one group are more similar to each
other than to objects in other groups. This unsupervised process is known as
clustering. Many clustering algorithms exist but all of them require some sort
of user input to decide how many groups to produce. For example k-means
clustering requires a value for k, the number of clusters, and graph-based
clustering methods can include a resolution parameter. How do we know what the
correct number of clusters is and what are the relationships between clusters at
different resolutions? I will show how to construct a clustering tree to help
answer these questions. While I will use a single-cell RNA sequencing dataset as
an example this approach could be used for any discipline or clustering method.
A clustering tree combines information from multiple clusterings with different
resolutions and shows the relationships between them. This visualisation can be
used to see which clusters are distinct, where new clusters come from and how
many samples change clusters as the number of clusters increases. Building a
clustering tree provides an alternative way of looking at clusterings, giving
extra insight into the clustering process and helping to determine the correct
number of clusters to use in further analysis."

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: 2017-08-18T09:55:00+10:00
date_end: 2017-08-18T10:15:00+10:00
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: 2020-03-28T17:29:04+01:00

authors: ["**Luke Zappia**"]
tags: ["visualisation", "clustering"]

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
url_slides: "https://speakerdeck.com/lazappi/building-a-clustering-tree"

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
projects: []
---
