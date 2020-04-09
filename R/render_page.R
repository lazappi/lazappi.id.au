# This file contains code borrowed from the blogdown package
# (https://github.com/rstudio/blogdown) and is therefore covered by a GPL-3
# license (https://choosealicense.com/licenses/gpl-3.0/) NOT the MIT license
# which covers code in blog posts

# Based on https://github.com/rstudio/blogdown/blob/master/inst/scripts/render_page.R

local({
    options(htmltools.dir.version = FALSE)
    library(methods)

    args <- commandArgs(TRUE)
    if (length(args) > 1) {
        setwd(args[2])
    }

    input <- args[1]
    setwd(dirname(input))
    input <- basename(input)

    to_md <- blogdown:::is_rmarkdown(input)
    if (to_md) {
        options(
            bookdown.output.markdown = TRUE,
            knitr.table.format       = "markdown"
        )
    }

    output_format <- rmarkdown::resolve_output_format(input)
    output_format$keep_md <- TRUE

    out <- rmarkdown::render(
        input,
        output_format,
        envir      = globalenv(),
        quiet      = TRUE,
        encoding   = "UTF-8",
        run_pandoc = !to_md,
        clean      = !to_md
    )

    if (to_md) {
        out2 <- blogdown:::output_file(input, to_md)
        file.rename(out, out2)
        unlink(xfun::attr(out, "intermediates"))
        if (length(xfun::attr(out, "knit_meta"))) {
            warning(
                "Objects that have dependencies (e.g. HTML widgets) do not ",
                "work when the output format is Markdown instead of HTML."
            )
            # resolve bookdown references (figures, tables, sections, ...)
            bookdown:::process_markdown(out2, "markdown", NULL, TRUE, to_md)

            # protect math expressions in backticks
            blogdown:::process_file(out2, xfun::protect_math)
        }
    } else {
        md <- sub("\\.html$", ".md", out)
        md_cached <- sub("\\.html$", ".md.cached", out)
        file.rename(md, md_cached)
    }
})
