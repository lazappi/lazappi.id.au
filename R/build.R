# Based on blogdown::build_site() and blogdown:::build_rmds()
# with help from https://github.com/rbind/yutani/blob/master/R/build.R

# Catch "local" argument passed from blogdown::build_site()
local <- commandArgs(TRUE)[1] == "TRUE"

render_rmd <- function(rmd, base) {
    dir_name <- dirname(rmd)
    to_md <- blogdown:::is_rmarkdown(rmd)
    out <- blogdown:::output_file(rmd, to_md)
    copy_output_yml(dir_name)

    # From blogdown:::render_page(rmd)
    args <- c("--slave", "R/render_page.R", rmd, getwd())
    if (xfun::Rscript(shQuote(args)) != 0) {
        stop("Failed to render '", rmd, "'")
    }

    x <- xfun::read_utf8(out)
    x <- blogdown:::encode_paths(x, blogdown:::by_products(rmd, "_files"),
                                 dir_name, base, to_md)
    if (to_md) {
        xfun::write_utf8(x, out)
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

render_md <- function(md, base) {
    dir_name <- dirname(md)
    out <- sub("\\.md\\.cached$", ".html", md)
    copy_output_yml(dir_name)

    rmarkdown::render(
        md,
        "blogdown::html_page",
        basename(out),
        envir    = globalenv(),
        quiet    = TRUE,
        encoding = "UTF-8"
    )

    x <- xfun::read_utf8(out)
    x <- blogdown:::encode_paths(x, blogdown:::by_products(md, "_files"),
                                 dir_name, base, FALSE)

    if (getOption("blogdown.widgetsID", TRUE)) {
        x <- blogdown:::clean_widget_html(x)
    }
    blogdown:::prepend_yaml(md, out, x, callback = function(s) {
        if (!getOption("blogdown.draft.output", FALSE)) {
            return(s)
        }
        if (length(s) < 2 || length(grep("^draft: ", s)) > 0) {
            return(s)
        }
        append(s, "draft: yes", 1)
    })
}

# Copy shared _output.yml file to build directory if it exists
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

# Get base paths
root <- getwd()
base <- blogdown:::site_base_dir()
shared_yml <- file.path(root, "_output.yml")

rmd_files <- blogdown:::list_rmds("content", TRUE)
message("Found ", length(rmd_files), " R Markdown files")
md_files <- sub("\\.Rmd$", ".md.cached", rmd_files)

# Only knit Rmd files if...
to_render <- !file.exists(md_files) |             # md file does not exist OR
    utils::file_test("-ot", md_files, rmd_files)  # it is older than the Rmd

# Copy by-products {/content/.../foo_(files|cache) dirs and foo.html} from
# /blogdown/ or /static/ to /content/
message("Copying by-products to build directories...")
lib1 <- blogdown:::by_products(rmd_files, c("_files", "_cache"))
# /blogdown/.../foo_(files|cache)
lib2 <- gsub("^content", "blogdown", lib1)
# _files are copied to /static
files_idx <- grep("_files$", lib2)
lib2[files_idx] <- gsub("^blogdown", "static", lib2[files_idx])
# Move by-products of a previous run to content/
blogdown:::dirs_rename(lib2, lib1)

message("Rendering ", sum(to_render), " R Markdown files...")
for (rmd in rmd_files[to_render]) {
    message("Rendering ", rmd, "...")
    render_rmd(rmd, base)
}

message("Rendering ", sum(!to_render), " cached Markdown files...")
for (md in md_files[!to_render]) {
    message("Rendering ", md, "...")
    render_md(md, base)
}

# move (new) by-products from content/ to blogdown/ or static/ to make the
# source directory clean
message("Copying by-products to final directories...")
blogdown:::dirs_rename(lib1, lib2)

message("Removing copied _output.yml files..")
unlink(copied_yaml)

# Build website
message("Building site...")
blogdown::hugo_build(local = local)
message("Done!")
