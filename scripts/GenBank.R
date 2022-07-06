species <- c("Aepyceros", "Alcelaphus", "Alces")
for (x in species){
  term<-paste(x,"[Organism] AND ((CYTB[Gene]) AND complete cds[All Fields])",sep='',collapse = NULL)
  search<-entrez_search(db="nuccore",term=term,retmax=1)
  data[x] <- tryCatch({entrez_fetch(db="nuccore",id=search$ids,rettype="fasta")},
                      error = function(e){NA})
}
