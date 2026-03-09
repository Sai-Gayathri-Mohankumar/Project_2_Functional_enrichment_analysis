Project 2: Functional Enrichment Analysis of RNA-seq Differentially Expressed Genes
Overview

This project performs functional enrichment analysis on differentially expressed genes (DEGs) obtained from RNA-seq analysis of SARS-CoV-2 infected human cornea tissue.

The purpose of this project is to identify biological processes and cellular pathways that are significantly enriched among the differentially expressed genes.

This project represents the downstream analysis of Project 1, where differential gene expression analysis was performed using the DESeq2 package in R.

Dataset

The RNA-seq dataset used in this analysis was obtained from the Gene Expression Omnibus (GEO).

Dataset accession:
GSE164073

The dataset contains RNA sequencing data from human cornea tissues under two conditions.

Control samples

MW1_cornea_mock_1

MW2_cornea_mock_2

MW3_cornea_mock_3

Infected samples

MW4_cornea_CoV2_1

MW5_cornea_CoV2_2

MW6_cornea_CoV2_3

Differential expression analysis was previously performed using DESeq2, and significant genes (adjusted p-value < 0.05) were used for enrichment analysis.

Analysis Workflow

The functional enrichment analysis was performed using the following workflow:

Import differential gene expression results from Project 1

Filter statistically significant genes (adjusted p-value < 0.05)

Extract gene symbols from the filtered dataset

Convert gene symbols to Entrez gene identifiers

Perform Gene Ontology (GO) enrichment analysis

Perform KEGG pathway enrichment analysis

Visualise enriched biological processes

Export enrichment results and plots

Tools and R Packages Used

This project was implemented in R using the following packages:

clusterProfiler

org.Hs.eg.db

enrichplot

ggplot2

dplyr

These packages are widely used in bioinformatics for functional annotation and pathway analysis of gene expression data.

Gene Ontology (GO) Enrichment Results

Gene Ontology enrichment analysis identifies biological processes that are significantly overrepresented among the differentially expressed genes.

The analysis revealed strong enrichment in biological processes related to:

chromosome segregation

nuclear division

mitotic cell cycle

DNA replication

regulation of cell cycle phase transition

These results suggest that viral infection influences host cell cycle regulation and chromosome organization.

GO Enrichment Visualisation

The dot plot below shows the most significantly enriched biological processes.

Dot size represents the number of genes associated with each biological process.
Dot colour represents the adjusted p-value indicating statistical significance.

Interpretation

The x-axis shows the GeneRatio (proportion of genes involved in the pathway).

Larger circles indicate more genes contributing to the enrichment.

Darker colours represent more statistically significant pathways.

KEGG Pathway Enrichment

KEGG pathway analysis identifies cellular signalling and metabolic pathways associated with the differentially expressed genes.

This analysis helps reveal broader molecular pathways affected by viral infection.

Typical pathways identified in similar analyses include:

Cell cycle regulation

DNA replication

p53 signalling pathway

Apoptosis

The KEGG enrichment results are stored as a table in the repository.

Repository Structure
bioinformatics-project2-functional-enrichment

scripts
│   Project 2.R

results
│   GO_dotplot_project2.png
│   GO_enrichment_results_project2.csv
│   KEGG_enrichment_results_project2.csv

README.md
Example Code Used

Gene Ontology enrichment analysis was performed using the following R code:

go_results <- enrichGO(
gene = gene_ids$ENTREZID,
OrgDb = org.Hs.eg.db,
ont = "BP",
pAdjustMethod = "BH",
pvalueCutoff = 0.05,
readable = TRUE
)

dotplot(go_results, showCategory = 20)
Key Findings

Functional enrichment analysis revealed strong enrichment of biological processes related to cell division and chromosome segregation.

These results indicate that viral infection may influence host cell cycle mechanisms and DNA replication pathways.

Understanding these enriched pathways helps reveal how host cellular processes respond to viral infection.

Author

Sai Gayathri Mohankumar

Bioinformatics Portfolio Projects

Project 1: RNA-seq Differential Expression Analysis

Project 2: Functional Enrichment Analysis using clusterProfiler
