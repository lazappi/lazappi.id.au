# Based on blogdown::build_site() and blogdown:::build_rmds()

# Catch "local" argument passed from blogdown::build_site()
local <- commandArgs(TRUE)[1] == "TRUE"

rmd_files <- blogdown:::list_rmds("content", TRUE)

# copy by-products {/content/.../foo_(files|cache) dirs and foo.html} from
# /blogdown/ or /static/ to /content/
lib1 <- blogdown:::by_products(rmd_files, c("_files", "_cache"))
lib2 <- gsub("^content", "blogdown", lib1)  # /blogdown/.../foo_(files|cache)
i <- grep("_files$", lib2)
lib2[i] <- gsub("^blogdown", "static", lib2[i])  # _files are copied to /static
# move by-products of a previous run to content/
blogdown:::dirs_rename(lib2, lib1)

root <- getwd()
base <- blogdown:::site_base_dir()
shared_yml <- file.path(root, "_output.yml")
copied_yaml <- character()

copy_output_yml <- function(to) {

    if (!file.exists(shared_yml)) {
        return()
    }

    copy <- file.path(to, "_output.yml")
    if (file.exists(copy)) {
        return()
    }

    if (file.copy(shared_yml, copy)) {
        copied_yaml <<- c(copied_yaml, copy)
    }
}

for (rmd in rmd_files) {

    dir_name <- dirname(rmd)
    to_md <- blogdown:::is_rmarkdown(rmd)
    out <- blogdown:::output_file(rmd, to_md)
    copy_output_yml(dir_name)
    message("Rendering ", rmd)
    blogdown:::render_page(rmd)
    x <- xfun::read_utf8(out)
    x <- blogdown:::encode_paths(x, blogdown:::by_products(rmd, "_files"),
                                dir_name, base, to_md)
    if (to_md) {
        write_utf8(x, out)
    } else {
        if (getOption("blogdown.widgetsID", TRUE)) {
            x <- blogdown:::clean_widget_html(x)
        }
        blogdown:::prepend_yaml(rmd, out, x, callback = function(s) {
            if (!getOption("blogdown.draft.output", FALSE)) {
                return(s)
            }
            if (length(s) < 2 || length(grep("^draft: ", s)) > 0) {
                return(s)
            }
            append(s, "draft: yes", 1)
        })
    }
}

# move (new) by-products from content/ to blogdown/ or static/ to make the
# source directory clean
blogdown:::dirs_rename(lib1, lib2)

unlink(copied_yaml)

# Build website
message("Building site...")
blogdown::hugo_build(local = local)
message("Done!")

# # Set default knitr options
# knitr::opts_knit$set(
#     base.dir = normalizePath("static/", mustWork = TRUE),
#     base.url = "/"
# )

# # Create cache directory
# dir.create("cache/", showWarnings = FALSE)

# # Set default chunk options
# knitr::opts_chunk$set(
#     cache.path = normalizePath("cache/", mustWork = TRUE),
#     collapse   = TRUE,
#     comment    = "#>",
#     fig.height = 6,
#     fig.width  = 8,
#     dpi        = 100
# )

# # Get Rmd files
# rmd_files <- list.files("content", "\\.Rmd$", recursive = TRUE,
#                         full.names = TRUE)

# # Get md files
# md_files  <- sub("\\.Rmd$", ".md", rmd_files)
# names(md_files) <- rmd_files

# # Get HTML files

# message("Found ", length(md_files), " Markdown files")
# message("Found ", length(rmd_files), " R Markdown files")
# message()

# # Knit an Rmd file when:
# #   1) the correspondent md file does not exist yet
# #   2) the Rmd file was modified after the md file ('-ot' means older than)
# to_knit <- !file.exists(md_files) | utils::file_test("-ot", md_files, rmd_files)

# message("Skipping ", sum(!to_knit), " R Markdown files...")
# message(glue::glue("Skipping {rmd_files[!to_knit]}"))
# message()

# message("Rendering ", sum(to_knit), " R Markdown files...")

# # Knit required Rmd files
# for (rmd in rmd_files[to_knit]) {

#     message("Rendering ", rmd)
#     post_path <- fs::path_split(rmd)[[1]]
#     post_name <- post_path[length(post_path) - 1]
#     base_name <- tools::file_path_sans_ext(basename(rmd))
#     fig_path  <- fs::path("post", post_name, glue::glue("{base_name}_files"),
#                           "figure-html")

#     knitr::opts_chunk$set(
#         fig.path = paste0(fig_path, "/")
#     )

#     set.seed(1)
#     knitr::knit(input = rmd, output = md_files[rmd], encoding = "UTF-8")

# }
# message()
