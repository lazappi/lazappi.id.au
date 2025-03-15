---
title: "Benchmarking feature selection for integration"
description: 'A summary of our recently published paper "Feature selection methods affect the performance of scRNA-seq data integration and querying"'
authors: ["**Luke Zappia**"]
categories: ["scrna-seq", "benchmarking", "feature selection", "integration", "publication"]
bibliography: references.bib
csl: ../../nature-no-et-al.csl
date: 2025-03-15
image: thumbnail.png
image-alt: Flowchart diagram showing an overview of the study design for the feature selection for integration benchmark project
image-caption: Overview of the feature selection for integration benchmark project
---

Our paper ["Feature selection methods affect the performance of scRNA-seq data integration and querying"](https://doi.org/10.1038/s41592-025-02624-3)[@Zappia2025-dq] was recently published.
As the title suggests, this study looked at different methods of selecting features from scRNA-seq data and how those features affected integrated datasets and using an integrated reference.
In this post I wanted to give a summary of what we found and provide some more insights into the process of developing the benchmark.

# Motivation

Like for many steps in scRNA-seq analysis, integration methods typically recommend selecting a subset of genes to combine datasets.
In a [previous benchmark](https://doi.org/10.1038/s41592-021-01336-8)[@Luecken2021-jo] we found that using highly variable genes did in fact improve integration performance compared to using all features but there remained some open questions:

1. What feature selection method to use? In the scIB benchmark we used 2000 batch-aware highly variable genes but there are many other feature selection methods, some of which have been shown to perform better in benchmarks of other tasks.
2. What effect does feature selection on using an integrated reference? The scIB benchmark looked at how well datasets were integrated but didn't consider mapping new datasets to that reference.

The second question was of particular interest to me.
We had already shown that feature selection improves integration but what about using that integrated dataset as a reference?
Whenever I had see an example of mapping data to a reference I add also wondered about what happens to any variation in the features not included in the model.
For example, can we reliably identify new populations in a mapped query dataset if the variation that separates them is in genes that the model knows nothing about?

As always, the scope of the benchmark grew a bit beyond this but this was the starting point for the study.

# Study design

We followed the standard benchmarking setup of selecting some test datasets, finding methods to compare and using a set of metrics to evaluate them.
The datasets were split into query and reference sets.
Features were then selected on the reference and used to integrate it, before mapping the query and classifying the query cells.
We selected some cell populations to be only present in the query which we tried to identify after mapping.

There are few things about how we did the study that I think are interesting.

## Paper format

From early on in the study, we decided to submit it as a [registered report](https://www.nature.com/nmeth/submission-guidelines/registered-reports).
This format is designed for benchmarking studies and changes the review process.
Instead of reviewing the completed study, a detailed plan for the benchmark is reviewed with a guarantee that if the accepted plan is followed the paper will be published regardless of the results.
This removes some pressure from the authors, allowing you to present the results you found without needing to find an angle to interest reviewers and editors.
However, having to follow a pre-approved plan presents some challenges.

For a computational benchmark, it means you have to do significant engineering work in advance to be confident that you can scale to the full benchmark.
It also (by design) removes a lot of the flexibility to adjust things as you go, which is challenging as you never really know how computational tools are going to behave in advance.
This is part of the reason that we included the metric selection step as part of the study, as we couldn't do it before the proposal without effectively running the whole benchmark.
However that ended up being one of the most interesting parts for me and something I think every benchmarking study should show.

## Benchmarking pipeline

To implement the benchmark we built a pipeline using [Nextflow](https://www.nextflow.io/).
For any project, being able to reliably re-run things as needed is useful but for a large benchmarking project where you know things will need to be run multiple times this is especially important.
Using Nextflow allowed us to have one workflow which could adapt different parameter sets and could be run locally for testing or on different HPC clusters (as ended up being necessary after an IT incident 😅).
Each step in the workflow was implemented as a separate R or Python script which could be run separately or using a Nextflow process in the workflow.
We also created a conda environment file for each tool or package, which could be used for multiple processes.^[I would probably use Docker containers or [Viash](https://viash.io/) components for this now, but this worked well enough]
Nextflow automatically handles creating the environments when they are needed or updated.

The structure of the pipeline and some example scripts were written and tested before a hackathon that we used to kick off the project.
This allowed everyone to start contributing straight away.
By using separate scripts for each step everyone could work on separate components in their preferred language without conflicting with what other people were doing.

# Metric selection

The first results section in the paper doesn't involve feature selection methods at all, instead it focuses on comparing and selecting the metrics to use.
As mentioned above, this was somewhat forced upon us by the paper format but I think it was a worthwhile exercise that should receive more attention.
In most benchmarks this would probably be done informally (if at all) but because we had to include it in the project proposal we had to formalise the process.

In the development phase of the project we had collected as many metrics as possible that had been used in previous benchmarks or method comparisons.^[We wanted to avoid developing new metrics but there were some that we significantly modified]
We divided these into five categories: removal of batch effects during integration (Integration (Batch)), conservation of biological variance during integration (Integration (Bio)), mapping of a query to the reference (Mapping), label projection to cells in the query (Classification) and detection of new populations in the query (Unseen).
There were some that we excluded straight away (because they didn't have a useable implementation or didn't fit into our framework) but we tried to implement as many as possible.
In the metric selection step, we then wanted to decide which metrics to consider.
There were a few criteria we considered:

- Does the metric have a useable dynamic range (i.e. does it actually measure something in our scenario)?
- Is the metric correlated with technical factors like the number of selected features?
- Is the metric redundant (i.e. is it overly correlated with other metrics in the same category)?
- Is the metric correctly categorised (i.e. is it correlated with metrics in the same category and anti-correlated with metrics in other categories)?

We did this by running the benchmark using sets of randomly selected features of different sizes which allowed us to investigate metric behaviour without biasing towards any particular method.
We also used a highly variable gene method to check correlation with the number of selected features as random sets do not have any inherent ordering.
This worked well in our benchmark but could be more challenging in other scenarios where it is not as easy to simulate the methods you are trying to evaluate.

The metric selection step allowed us to choose a set of metrics that we were confident reliably measured what were were interested in evaluating.^[See the paper for exactly which metrics we selected and why]

## Baselines and scaling

Combining scores from multiple metrics is inevitably challenging because they have different effective ranges.
Even though we had implemented each metric so that the theoretical worst score was 0 and the theoretical best score was 1 we knew they would have different ranges in practice.
In the scIB study[@Luecken2021-jo] we had min-max scaled each metric before combining them but this made the analysing them difficult as adding, removing or modifying any method changed the results.
For this study, we instead used a process more similar to what has been implemented in [Open Problems](https://openproblems.bio/)[@Luecken2024-ur].

This involved a set of baseline methods that we expected to perform well or poorly (depending on the metric).
These were used to establish an effective range for each metric (for a dataset) and other methods were scaled to this range.
As well as making the metrics comparable, this also provides context to the metric scores.
We can easily see that any score above 1 performs better than all the baseline methods and any score less than 0 performs worse than all the baselines.

Once the metrics scores were on the same scale we could combine them to create category and overall scores that we used for most of the evaluation.

# Results

Now that I have explained how we did the study, let's talk about the results!
I'm going to mention some of the key points but you should really read the paper for the details.

## How many features to use?

Most of the methods we evaluated require the user to set how many features to select.
Using a subset of methods from commonly used packages^[It was computationally infeasible to do this for all methods, given the computation required for each integration run] we selected different numbers of features and evaluated the performance.
We saw different patterns for different datasets and for each metric category.
Integration was slightly better with fewer features and the query categories scored higher with more features.

In the end, we chose to use 2000 features for comparing methods.
It was reassuring to see that the number we found was consistent with common practice but there was enough variation here that were recommend to tune the number of features for your dataset and use case.

## Which method to use?

Finally, we have reached the actual comparison between methods 🎉!

The results here are reassuring but maybe not surprising.
We found that the standard highly variable feature selection methods were the best performers, particularly the variance stabilising transformation approach in the [Seurat](https://satijalab.org/seurat/)[@Satija2015-or] and [scanpy](https://scanpy.readthedocs.io/en/stable/)[@Wolf2018-na] packages.
There is maybe some bias here as the reference labels we used for evaluation were likely to have come from one of these methods but I don't think it is a significant issue given all the other analysis steps that go into annotating cells.
More likely, it is just that this approach intuitively makes sense and works pretty well most of the time.

As a comparison we included one supervised method using the cell labels based on a filtered set of Wilcoxon marker genes.
This also performed very well which is probably unexpected given we use the same labels for evaluation.
However, in most cases cell labels are not available before integration and we saw more variation across datasets (possibly depending on the quality and resolution of the labels).
I wouldn't rule out using supervised features, but I think you need to have confidence in the labels and some motivation for why it would be better than an unsupervised approach.
Possibly, using marker genes to augment highly variable features would be a good combined approach.

The other top performer was [triku](https://triku.readthedocs.io/en/latest/)[@M_Ascension2022-yp] which operates on a neighbourhood graph and is worth considering if you are looking for an alternative approach.

## Do I need to use batch-aware features?

Some packages implement batch-aware variants of their features selection methods where they are applied to each batch separately and the results combined in some way (usually by choosing the most commonly selected features).
This is the approach we considered in the scIB paper[@Luecken2021-jo] and has since become recommended practice.
The intuition is that by selecting features within each batch you avoid choosing those that are different between batches, conserving more biology.
We compared batch-aware variants of methods in scanpy but didn't see any consistent differences that let us say what the effect is.

Personally, I probably wouldn't bother with batch-aware features, unless it was for computational reasons (because you can process each batch separately and combine the results).

## Should I integrate lineages separately?

This question moves a bit beyond the original scope of the paper and comes out of reviewer comments to look more into the interaction between feature selection and biological factors.
Here, we compared performance on the full [Human Lung Cell Atlas](https://doi.org/10.1038/s41591-023-02327-2)[@Sikkema2023-ia] (HLCA) dataset to the immune and epithelial subsets.
This section was to test the idea that restricting the biology in the dataset could improve feature selection (by selecting more specific biological features) and integration.

A full benchmark study is needed to properly answer this question but our results don't support that idea.
We saw better performance on the full HLCA, particularly when identifying previously unseen populations using the [Milo](https://doi.org/10.1038/s41587-021-01033-z)[@Dann2022-nz] metric.
My explanation is that by showing the integration model a wider variety of biology it learns more about the possible cell space and therefore better separate new types of cells.
But like I said, you could do a full study just to answer this question and we didn't consider selecting features on each lineage but then integrating the full dataset.

## How do selected features interact with the integration method?

In the last section of the results we look at interactions with different integration models.
Comparing integration methods has been done previously and was specifically outside the scope of this study but we included a small comparison at the prompting of the reviewers and to investigate some specific questions.
We used [scVI](https://doi.org/10.1038/s41592-018-0229-2)[@Lopez2018-au] as the integration and mapping method for most of the study but here we compared to [scANVI](https://doi.org/10.15252/msb.20209620)[@Xu2021-dh] and [Harmony](https://doi.org/10.1038/s41592-019-0619-0)[@Korsunsky2019-ex] followed by [Symphony](https://doi.org/10.1038/s41467-021-25957-x)[@Kang2021-ac] mapping.

Overall, scANVI performed slightly better than scVI, particularly in the biological categories.
This is probably because the model knowing something about cell labels allowed it to overcome deficiencies in the selected features.
In contrast, Symphony performed worse in general but particularly in unseen population detection.
A proper evaluation would be needed to work out why this is^[Our workflow was designed around scVI but Symphony is a completely different class of integration model and there may be some bias there] but I would be cautions of using this integration approach of a reference mapping application.

# Summary

Ok, so after all that, what did we learn?

- The registered report is an interesting format but it requires you to do a lot of work in advance and doesn't necessarily make things quicker
- Setting up a proper workflow takes some effort but is invaluable when you need to re-run things, especially in a large, computationally-intense project
- Choosing the metrics to use is vital and something that more time should be spent on in benchmarking papers
- Think carefully about how to scale and combine metric scores, use baseline methods if you can
- Around 2000 features generally works well but you should tune this for you dataset and application
- Using batch-aware features doesn't add much
- Integrating lineages separately results in worse detection of unseen populations
- scANVI generally improves performance over scVI regardless of the feature selection method but Symphony struggled with detecting new populations

Thanks for reading! You can find more about this study here:

- [Publication](https://doi.org/10.1038/s41592-025-02624-3)
- [GitHub repository](https://github.com/theislab/atlas-feature-selection-benchmark)
- [figshare collection](https://figshare.com/projects/Benchmarking_feature_selection_for_scRNA-seq_integration/214819)
