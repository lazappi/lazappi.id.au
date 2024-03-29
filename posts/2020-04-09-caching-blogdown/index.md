---
title: "Caching blogdown posts"
description: "Description of how I cache blogdown Markdown files"
authors: ["Luke Zappia"]
categories: ["blogdown", "R"]
date: 2020-04-09T13:41:09+02:00
---

This website is built using [**blogdown**][blogdown] which is a great package
that let's you easily turn [R Markdown][rmarkdown] documents into a
[**Hugo**][hugo] blog. While a normal Markdown blog can include code a
**blogdown** blog runs that code and includes the output. One thing that
**blogdown** does which isn't necessarily desirable is re-knit every R Markdown
document whenever the site is built.^[I'm not entirely sure this is correct and
based on some comments from Yihui it might be possible to avoid this happening
in a standard way but I have seen enough similar questions that it seems other
people have run into the same problem.] This can slow down the build process but
it can also result in changes to the content of a post. For example imagine a
post that scraps some data from the internet. If that code is run a month or a
year from now that data could have changed in a way that affects the meaning of
the post. Perhaps a more likely scenario is changes to package functionality
which change results or stop code working altogether. This post describes the
build process I have come up with to try and avoid this happening.

# **blogdown** file formats

I mentioned that **blogdown** works with R Markdown files but it actually
handles three different file types which are treated in different ways (see
[here][formats] for more details):

1. `.Rmd` - R Markdown files that are rendered directly to `.html` by
   **blogdown** and friends (including [**Pandoc**][pandoc])
1. `.rmarkdown` - R Markdown files that are knitted to `.markdown` files by
   **blogdown** and then rendered to `.html` by **Hugo**.
1. `.md` - Standard Markdown files which are ignored by **blogdown** and
   rendered by **Hugo**.

The `.Rmd` workflow is usually recommended and because it makes use of
**Pandoc** it enables several features including citations which are useful for
an academic blog. However it also comes with the (potential) problem with
re-running code mentioned above. What I would like to have is something like the
`.rmarkdown` workflow but where the intermediate Markdown file is still rendered
to `.html` using **Pandoc** instead of **Hugo**.

# The **blogdown** build process

Before we try and modify it let's have a look at how the standard **blogdown**
build process works. To build the website we use the
[`blogdown::build_site()`][build_site] function. This takes a `local` argument
which sets whether the site is being viewed locally or not as well as a `method`
argument (which we will get to later). This is (briefly) what happens when you
call `build_site()`:

1. Checks arguments and gets a list of files to build
1. Calls the [`blogdown:::build_rmds()`][build_rmds] function
    1. This function copies by-product files (such as plot output) from where
       they have been stored to the build directory
    1. Each file is passed to the [`blogdown:::render_page()`][render_page]
       function
        1. This function is a wrapper which calls the
           [`render_page.R`][render_page_script] script
        1. The script creates a new local environment (I assume there is a good
           reason to do this)
        1. The file is rendered in the new environment (with some
           post-processing if the output is Markdown)
    1. After rendering (if the output is Markdown) the YAML frontmatter is
       copied to the output file
1. By-products are moved back to their storage locations
1. **Hugo** is called to build the website

# My modifications

I mentioned earlier that `blogdown::build_site()` has a `method` argument. This
can take values of `"html"` which is the default process I have just described
or `"custom"` which replaces this process by running a `R/build.R` script which
can do whatever you like.^[It is acutally slightly more complicated than that.
When `method = "html"` the `R/build.R` script is actually run after the normal
process (if it exists) and can be used to do various things.] I have created a
custom build script which is very similar to the **blogdown** functions with a
few modifications. It is also inspired by [this post][yutani_post] but this
method caches `.md` files which are rendered by **Hugo** rather than **Pandoc**.
I'll include some snippets below but the full script is [here][custom_build] if
you are interested.

## Only render some `.Rmd` files

When finding files to render the script also checks to see if there is a
`.md.cached` file in the same directory and that it is newer than the `.Rmd`
file.

```r
rmd_files <- blogdown:::list_rmds("content", TRUE)
message("Found ", length(rmd_files), " R Markdown files")
md_files <- sub("\\.Rmd$", ".md.cached", rmd_files)

# Only knit Rmd files if...
to_render <- !file.exists(md_files) |             # md file does not exist OR
    utils::file_test("-ot", md_files, rmd_files)  # it is older than the Rmd
```

If the `.md.cached` file exists (and is newer) it is rendered instead of the
`.Rmd` file.

```r
message("Rendering ", sum(!to_render), " cached Markdown files...")
for (md in md_files[!to_render]) {
    message("Rendering ", md, "...")
    render_md(md, base)
}
```

Otherwise the `.Rmd` file is rendered when required.

```r
message("Rendering ", sum(to_render), " R Markdown files...")
for (rmd in rmd_files[to_render]) {
    message("Rendering ", rmd, "...")
    render_rmd(rmd, base)
}
```

One thing I found is important during the rendering process is that the YAML
frontmatter is preprended to the output HTML file. I'm not entirely sure why
but if you don't do this the files aren't included in the website properly by
**Hugo**.

```r
blogdown:::prepend_yaml(md, out, x, callback = function(s) {
    if (!getOption("blogdown.draft.output", FALSE)) {
        return(s)
    }
    if (length(s) < 2 || length(grep("^draft: ", s)) > 0) {
        return(s)
    }
    append(s, "draft: yes", 1)
})
```

## Keeping intermediate Markdown files

In theory it should be possible to keep the intermediate Markdown file simply
by setting `keep_md: true` in the document YAML frontmatter (or a central
`_output.yml` file). Unfortunately that argument currently isn't passed on in a
way that works (see issue [here][keep_md_issue]). This means that we also need
to create a [custom `render_page.R`][custom_render_page] script. This script
makes sure that the `keep_md` option is set when rendering `.Rmd` files.

```r
output_format <- rmarkdown::resolve_output_format(input)
output_format$keep_md <- TRUE
```

The other thing we do is rename the kept intermediate Markdown files. If we Left
them with the `.md` extension they would be rendered by **Hugo** after running
the build script. I chose to name them `.md.cached` but they could have any
extension.

# Wrapping up

These scripts are now being used to build this blog. They seem to work 🤞 but I
haven't tested them extensively and I expect there will be some issues if I try
some posts with more complex code in them (for example I'm not sure what will
happen if I try and include a HTML widget). I'm still not certain this is the
best approach but I have learnt a lot about how **blogdown** work (although
there is still a lot I don't understand 😸).

[blogdown]: https://bookdown.org/yihui/blogdown/ "blogdown website"
[rmarkdown]: https://rmarkdown.rstudio.com/ "R Markdown website"
[hugo]: https://gohugo.io/ "Hugo website"
[pandoc]: https://pandoc.org/ "Pandoc website"
[formats]: https://bookdown.org/yihui/blogdown/output-format.html "blogdown file formats"
[build_site]: https://github.com/rstudio/blogdown/blob/86ea620d6dfbe0f745ad89dc131b0dc6662e572c/R/render.R#L36 "blogdown::build_site() function"
[build_rmds]: https://github.com/rstudio/blogdown/blob/86ea620d6dfbe0f745ad89dc131b0dc6662e572c/R/render.R#L68 "blogdown:::build_rmds() function"
[render_page]: https://github.com/rstudio/blogdown/blob/86ea620d6dfbe0f745ad89dc131b0dc6662e572c/R/render.R#L115 "blogdown:::render_page() function"
[render_page_script]: https://github.com/rstudio/blogdown/blob/86ea620d6dfbe0f745ad89dc131b0dc6662e572c/inst/scripts/render_page.R "render_page.R script"
[yutani_post]: https://yutani.rbind.io/post/2017-10-25-blogdown-custom/ "How Not To Knit All Rmd Files With Blogdown"
[custom_build]: https://github.com/lazappi/lazappi_blog/blob/0efce159942167b35649c4dfb0f7b832fab9a137/R/build.R "Custom build.R script"
[keep_md_issue]: https://github.com/rstudio/blogdown/issues/445 "keep_md GitHub issue"
[custom_render_page]: https://github.com/lazappi/lazappi_blog/blob/0efce159942167b35649c4dfb0f7b832fab9a137/R/render_page.R "Custom render_page.R script"
