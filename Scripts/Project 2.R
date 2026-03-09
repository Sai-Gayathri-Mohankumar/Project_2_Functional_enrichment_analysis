#Loading the required lbraries
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(ggplot2)
library(dplyr)
#Loading my DEG_results from my earlier project 
deg <- read.csv(
  "F:/R-4.5.2/My Projects/Project 1/Results/DEG_results.csv"
)
#Checking the data
head(deg)
#Filtering significant genes
sig_genes <- deg %>%
  filter(padj < 0.05)
#Checking the number of genes
nrow(sig_genes)
#Extracting the gene symbols
gene_list <- sig_genes$X
#Check
head(gene_list)
#Convert Gene Symbols to EntrezIDs
gene_ids <- bitr(
  gene_list,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)
#Check
head(gene_ids)
#Gene Ontology (GO) Enrichment
go_results <- enrichGO(
  gene = gene_ids$ENTREZID,
  OrgDb = org.Hs.eg.db,
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  readable = TRUE
)
#Check
head(go_results)
#Plot GO enrichment
dotplot(go_results, showCategory = 20)
#KEGG Pathway Enrichment
kegg_results <- enrichKEGG(
  gene = gene_ids$ENTREZID,
  organism = "hsa",
  pvalueCutoff = 0.05
)
#Plot KEGG pathways
dotplot(kegg_results)
#Save enrichment results
write.csv(as.data.frame(go_results),
          "GO_enrichment_results_project2.csv")

write.csv(as.data.frame(kegg_results),
          "KEGG_enrichment_results_project2.csv")
#Save plots
png("GO_dotplot_project2.png", width=900, height=700)

dotplot(go_results, showCategory = 20)

dev.off()
