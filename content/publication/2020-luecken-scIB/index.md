---
title: "Benchmarking atlas-level data integration in single-cell genomics"
date: 2020-05-23
publishDate: 2020-05-23T16:02:00
authors: ["Malte D Luecken", "Maren Buttner", "Kridsadakorn Chaichoompu", "Anna Danese", "Marta Interlandi", "Michaela F Mueller", "Daniel C Strobl", "**Luke Zappia**", "Martin Dugas", "Maria Colome-Tatche", "Fabian J Theis"]
publication_types: ["3"]
abstract: "Cell atlases often include samples that span locations, labs, and conditions, leading to complex, nested batch effects in data. Thus, joint analysis of atlas datasets requires reliable data integration. Choosing a data integration method is a challenge due to the difficulty of defining integration success. Here, we benchmark 38 method and preprocessing combinations on 77 batches of gene expression, chromatin accessibility, and simulation data from 23 publications, altogether representing >1.2 million cells distributed in nine atlas-level integration tasks. Our integration tasks span several common sources of variation such as individuals, species, and experimental labs. We evaluate methods according to scalability, usability, and their ability to remove batch effects while retaining biological variation. Using 14 evaluation metrics, we find that highly variable gene selection improves the performance of data integration methods, whereas scaling pushes methods to prioritize batch removal over conservation of biological variation. Overall, BBKNN, Scanorama, and scVI perform well, particularly on complex integration tasks; Seurat v3 performs well on simpler tasks with distinct biological signals; and methods that prioritize batch removal perform best for ATAC-seq data integration. Our freely available reproducible python module can be used to identify optimal data integration methods for new data, benchmark new methods, and improve method development."
featured: true
publication: "*bioRxiv*"
tags: ["single-cell", "rna-seq", "integration", "benchmarking"]
doi: "10.1101/2020.05.22.111161"
url_pdf: "https://www.biorxiv.org/content/10.1101/2020.05.22.111161v1.full.pdf"
url_code: "https://github.com/theislab/scib"
---
