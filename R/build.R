# Based on https://github.com/rbind/yutani/blob/2b235c9b00192fed7b1f930e3891747d69ba7de1/R/build.R

# Catch "local" argument passed from blogdown::build_site()
local <- commandArgs(TRUE)[1] == "TRUE"

# Set default knitr options
knitr::opts_knit$set(
    base.dir = normalizePath("static/", mustWork = TRUE),
    base.url = "/"
)

# Create cache directory
dir.create("cache/", showWarnings = FALSE)

# Set default chunk options
knitr::opts_chunk$set(
    cache.path = normalizePath("cache/", mustWork = TRUE),
    collapse   = TRUE,
    comment    = "#>",
    fig.height = 6,
    fig.width  = 8,
    dpi        = 100
)

# Get Rmd files
Rmd_files <- list.files("content", "\\.Rmd$", recursive = TRUE,
                        full.names = TRUE)

# Get md files
md_files  <- sub("\\.Rmd$", ".md", Rmd_files)
names(md_files) <- Rmd_files

# Knit an Rmd file when:
#   1) the correspondent md file does not exist yet
#   2) the Rmd file was modified after the md file ('-ot' means older than)
to_knit <- !file.exists(md_files) | utils::file_test("-ot", md_files, Rmd_files)

message("Skip: \n    ", paste(Rmd_files[!to_knit], collapse = "\n    "))

# Knit required Rmd files
for (rmd in Rmd_files[to_knit]) {

    post_path <- fs::path_split(rmd)[[1]]
    post_name <- post_path[length(post_path) - 1]
    base_name <- tools::file_path_sans_ext(basename(rmd))
    fig_path  <- fs::path("post", post_name, glue::glue("{base_name}_files"),
                          "figure-html")

    knitr::opts_chunk$set(
        fig.path = normalizePath(paste0(fig_path, "/"))
    )

    set.seed(1)
    knitr::knit(input = rmd, output = md_files[rmd], encoding = "UTF-8")

}

# Build website
blogdown::hugo_build(local = local)
