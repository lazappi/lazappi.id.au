---
title: "Gantt charts in R"
abstract: "Steps for creating Gantt charts in R"
authors: ["**Luke Zappia**"]
categories: ["R", "project management", "gantt chart", "Excel"]
date: 2016-06-13
---

Gantt charts are a project management tool designed to visualise the tasks in a
project, how long they will take and what order they must be completed. If you
haven't seen one before essentially they look like a modified horizontal bar
chart. Along the horizontal axis is time with tasks along the vertical. Each
task consists of a bar where the ends are the start and end times. Often there
are also arrows indicating dependencies and a line showing the current date.

As part of the proposal for my PhD project I wanted to include a Gantt chart,
both as a way of showing what I planned to do and as a way of keeping track of
my progress. I expected there to be a simple template for Excel or Google Sheets
but there wasn't much and they didn't quite fit what I wanted. Looking elsewhere
didn't turn up much either. What I wanted was a tool where I could enter tasks
and dates in text format and produce a relatively attractive chart that I could
easily update. In the end I turned to faithful old R, which had the added
advantage that I could easily incorporate the chart into
[R Markdown](http://rmarkdown.rstudio.com/) documents.

There are a couple of packages that can make Gantt charts in R including
[plotrix](https://cran.r-project.org/web/packages/plotrix/index.html) and
[plan](https://cran.r-project.org/web/packages/plan/index.html) but in the end
I went with [DiagrammeR](https://rich-iannone.github.io/DiagrammeR/). The Gantt
functionality of DiagrammeR depends on
[Mermaid](https://knsv.github.io/mermaid/) which has a simple, almost
markdown-like syntax.

```
gantt
dateFormat  YYYY-MM-DD
title My Gantt chart

section First section
Task 1            :done,    des1, 2014-01-06, 2014-01-08
Task 2            :active,  des2, 2014-01-09, 3d
Task 3            :         des3, after des2, 5d
Task 4            :         des4, after des3, 5d
```

Basically each task is written as:

```
Task name         :status, label, start_date, end_date
```

Where the start and end dates can also include durations or references to other
tasks.

While this format is easy to use I prefer to use a standard delimited format
which is easier to edit and read into R. To this end I created some functions
which will take a CSV or XLSX file and produce a Gantt chart.

```r
library("magrittr")

# Take a data.frame containing tasks and build a Mermaid string
tasks2string <- function(tasks) {

    tasks.list <- split(tasks,
                        factor(tasks$Section, levels = unique(tasks$Section)))

    strings <- sapply(names(tasks.list),
                      function(section) {
                          tasks.list[[section]] %>%
                              dplyr::select(-Section) %>%
                              tidyr::unite(Part1, Task, Priority,
                                           sep = ": ") %>%
                              tidyr::unite(String, Part1, Status, Name, Start,
                                           End, sep = ", ") %>%
                              magrittr::use_series("String") %>%
                              paste(collapse = "\n") %>%
                              gsub(" ,", "", .) # Remove empty columns
                          }
                      )

    string <- ""

    for(section in names(strings)) {
        string <- paste0(string, "\n",
                         "section ", section, "\n",
                         strings[section],
                         "\n")
    }

    return(string)
}

# Produce a Gantt chart from data.frame of tasks
# Adds the Mermaid header to the tasks string
buildGantt <- function(tasks) {

    gantt.string <- paste0("gantt", "\n",
                           "dateformat YYYY-MM-DD", "\n",
                           "title My Gantt Chart",
                           "\n")

    gantt.string <- paste0(gantt.string, tasks2string(tasks))

    gantt <- DiagrammeR::mermaid(gantt.string)

    gantt$x$config = list(ganttConfig = list(
        # Make sure the axis labels are formatted correctly
        axisFormatter = list(list(
            "%m-%y", # New data format
            htmlwidgets::JS('function(d){ return d}') # Select dates to format
        ))
    ))

    return(gantt)
}

# Read a file and return a Gantt chart
buildGanttFromFile <- function(tasks.file, format = c("csv", "xlsx")) {

    format <- match.arg(format)

    switch(format,
           csv = {
               tasks <- read.csv(tasks.file, stringsAsFactors = FALSE)
           },
           xlsx = {
               tasks <- gdata::read.xls(tasks.file)
           })

    return(buildGantt(tasks))
}
```

I can now construct my tasks by editing a CSV file and produce a Gantt chart
directly from that by calling a single function. You may wonder why I have
included XLSX as an input option? Surely using Excel is against the principles
of data science? Firstly I'm not that opposed to Excel (when it is used
correctly) but the reason in this case it is to get around one of the
limitations of DiagrammeR. The Mermaid syntax allows you to define a task as
starting after another task but you can't say that a task ends before another.
There are often situations where you have a hard end deadline (such as a PhD
committee meeting) and you need to work backwards from that. By using Excel I
can use simple formulas to calculate the dates which are then passed to R. I
could do this programmatically in R (and I might at some stage) but Excel was a
quicker solution that let me get on to writing.
