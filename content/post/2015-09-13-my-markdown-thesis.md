---
title: My Markdown thesis
author: Luke Zappia
date: '2015-09-13'
slug: my-markdown-thesis
categories:
  - migrated
tags:
  - writing
  - markdown
  - thesis
  - latex
---

It's come to the stage in my Master's where I have to start thinking about
writing my thesis. Apart from all the analysis I have to do before I can do that
there is also the question of what I am going to use to construct the document
itself.

For the last year or so I have been writing using Markdown which is converted to
Tex using [Pandoc](pandoc.org) then used to produce a PDF. I have found this a
really good way to work combining the speed and clarity of Markdown with the
ability to include LaTeX directly when I need extra flexibility. I have been
using the [Uberdoc](https://sbrosinski.github.io/uberdoc/) tool to set up
projects and combine multiple Markdown files but unfortunately it's not quite
flexible enough for a complex document like a thesis.

I wanted to be able to be able to incorporate my Tex, particularly so I could
use John Papandriopoulos' [thesis template](http://jpap.org/projects.html).
Ideally I wanted to build my own tool (probably in Python or Perl) that would
manage projects, including git commits, as well as produce statistics but time
doesn't permit so I have ended up with a Make based solution.

The setup allows me to be flexible with how I set up my directory as the whole
project is searched for Markdown files which are converted to LaTeX in a build
directory. The directory structure is flattened at this stage which means I
don't have to write the full path when including files. Figures are treated
similarly and there are folders for additional LaTeX files (such as styles and
templates) and bibliography files. I also have a core Tex file which is used to
tie everything together. The PDF is constructed using 
[latexmk](https://www.ctan.org/pkg/latexmk/?lang=en) and I can use 
[texcount](http://app.uio.no/ifi/texcount/) for keeping track of my word count.
So when I run `make` for the first time the following steps occur:

1. The build directory is created with the necessary subdirectories.
2. The project directory is searched for Markdown files which are converted
   to TeX files in the build directory.
3. TeX files are copied from the template directory to the build directory.
4. All files are copied from the style directory to a style subdirectory
   inside the build directory.
5. All files are copied from the bibliography directory to a bibliography
   subdirectory inside the build directory.
6. The figures directory is searched for image files which are copied to a
   figures subdirectory inside the build directory.
7. `latexmk` is used to build the output file in the build directory.
8. The output PDF is copied to the main directory.

It's not perfect, for example there is a bug that means `make` needs to be run
more than once when you add a new file which isn't ideal, but it mostly does
what I want and hopefully it will get me through. If you want to check it out
the code is available on [Github](https://github.com/lazappi/thesis-template).
