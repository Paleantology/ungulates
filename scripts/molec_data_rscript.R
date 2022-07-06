```{r}
install.packages("rentrez")
library("rentrez")
````

```{r}
#set the working directory to where we want the files saved
setwd("~/molecular_data/cytb")
```

```{r}
set_entrez_key("cae63cb06b8a6643e319eb4fc4931858dc08")
Sys.getenv("ENTREZ_KEY")
ENTREZ_KEY=("cae63cb06b8a6643e319eb4fc4931858dc08")
```

r_search <- entrez_search(db="gene", term="cytb[Gene] AND Addax[Orgn]") #OR Aepyceros[Orgn] OR Alcelaphus[Orgn] OR Alces[Orgn] OR Ammotragus[Orgn] OR Antidorcas[Orgn] OR Antilocapra[Orgn] OR Antilope[Orgn] OR Axis[Orgn] OR Ammodorcas[Orgn] OR Babyrousa[Orgn] OR Beatragus[Orgn] OR Bison[Orgn] OR Blastocerus[Orgn] OR Bos[Orgn] OR Boselaphus[Orgn] OR Bubalus[Orgn] OR Budorcas[Orgn] OR Camelus[Orgn] OR Capra[Orgn] OR Capreolus[Orgn] OR Capricornis[Orgn] OR Catagonus[Orgn] OR Cephalophus[Orgn] OR Ceratotherium[Orgn] OR Cervus[Orgn] OR Connochaetes[Orgn] OR Dama[Orgn] OR Damaliscus[Orgn] OR Dendrohyrax[Orgn] OR Dicerorhinus[Orgn] OR Diceros[Orgn] OR Dorcatragus[Orgn] OR Elaphodus[Orgn] OR Elaphurus[Orgn] OR Elephas[Orgn] OR Equus[Orgn] OR Eudorcas[Orgn] OR Giraffa[Orgn] OR Gazella[Orgn] OR Hadrohyus[Orgn] OR Hemitragus[Orgn] OR Heterohyrax[Orgn] OR Hexaprotodon[Orgn] OR Hippocamelus[Orgn] OR Hippopotamus[Orgn] OR Hippotigris[Orgn] OR Hippotragus[Orgn] OR Hydropotes[Orgn] OR Hyemoschus[Orgn] OR Hylochoerus[Orgn] OR Hyomoschus[Orgn] OR Kobus[Orgn] OR Lama[Orgn] OR Litocranius[Orgn] OR Loxodonta[Orgn] OR Madoqua[Orgn] OR Mazama[Orgn] OR Moschiola[Orgn] OR Moschus[Orgn] OR Muntiacus[Orgn] OR Myotragus[Orgn] OR Naemorhedus[Orgn] OR Nanger[Orgn] OR Neotragus[Orgn] OR Odocoileus[Orgn] OR Okapia[Orgn] OR Oreamnos[Orgn] OR Oreotragus[Orgn] OR Ourebia[Orgn] OR Ovibos[Orgn] OR Ovis[Orgn] OR Ozotoceros[Orgn] OR Pantholops[Orgn] OR Parachoerus[Orgn] OR Pecari[Orgn] OR Pelea[Orgn] OR Phacochoerus[Orgn] OR Philantomba[Orgn] OR Porcula[Orgn] OR Potamochoerus[Orgn] OR Procapra[Orgn] OR Procavia[Orgn] OR Pseudois[Orgn] OR Pseudoryx[Orgn] OR Pudu[Orgn] OR Rangifer[Orgn] OR Raphicerus[Orgn] OR Redunca[Orgn] OR Rhinoceros[Orgn] OR Rhynotragus[Orgn] OR Rupicapra[Orgn] OR Rusa[Orgn] OR Saiga[Orgn] OR Siamotragulus[Orgn] OR Stephanocemas[Orgn] OR Sus[Orgn] OR Sylvicapra[Orgn] OR Tapirella[Orgn] OR Tapirus[Orgn] OR Taurotragus[Orgn] OR Tayassu[Orgn] OR Tetracerus[Orgn] OR Tragelaphus[Orgn] OR Tragulus[Orgn] OR Vicugna[Orgn]")

r_search ##this prints how many search results we get. It is important to do because if we have no returns, we know we need to change our search term
r_search$ids #this prints a list of ids, set to a max of 20

#try with ids
cytb_seq_ids <- entrez_link(dbfrom="nuccore", id=c("r_search$ids"), db="nuccore") #save id links from gene that match up to nuucore to get fasta files
cytb_seq_ids

upload <- entrez_post(db="nucleotide", id=r_search$ids)
upload

linked_cytb <- cytb_seq_ids$links$gene_nuccore_refseqrna
head(linked_cytb)

sequences <-entrez_fetch(db="nuccore", id=c("r_search$ids"), rettype = "fasta")

#try with web history
cytb_search <- entrez_search(db="gene", term="cytb[Gene] AND Addax[Orgn] OR Aepyceros[Orgn] OR Alcelaphus[Orgn] OR Alces[Orgn] OR Ammotragus[Orgn] OR Antidorcas[Orgn] OR Antilocapra[Orgn] OR Antilope[Orgn] OR Axis[Orgn] OR Ammodorcas[Orgn] OR Babyrousa[Orgn] OR Beatragus[Orgn] OR Bison[Orgn] OR Blastocerus[Orgn] OR Bos[Orgn] OR Boselaphus[Orgn] OR Bubalus[Orgn] OR Budorcas[Orgn] OR Camelus[Orgn] OR Capra[Orgn] OR Capreolus[Orgn] OR Capricornis[Orgn] OR Catagonus[Orgn] OR Cephalophus[Orgn] OR Ceratotherium[Orgn] OR Cervus[Orgn] OR Connochaetes[Orgn] OR Dama[Orgn] OR Damaliscus[Orgn] OR Dendrohyrax[Orgn] OR Dicerorhinus[Orgn] OR Diceros[Orgn] OR Dorcatragus[Orgn] OR Elaphodus[Orgn] OR Elaphurus[Orgn] OR Elephas[Orgn] OR Equus[Orgn] OR Eudorcas[Orgn] OR Giraffa[Orgn] OR Gazella[Orgn] OR Hadrohyus[Orgn] OR Hemitragus[Orgn] OR Heterohyrax[Orgn] OR Hexaprotodon[Orgn] OR Hippocamelus[Orgn] OR Hippopotamus[Orgn] OR Hippotigris[Orgn] OR Hippotragus[Orgn] OR Hydropotes[Orgn] OR Hyemoschus[Orgn] OR Hylochoerus[Orgn] OR Hyomoschus[Orgn] OR Kobus[Orgn] OR Lama[Orgn] OR Litocranius[Orgn] OR Loxodonta[Orgn] OR Madoqua[Orgn] OR Mazama[Orgn] OR Moschiola[Orgn] OR Moschus[Orgn] OR Muntiacus[Orgn] OR Myotragus[Orgn] OR Naemorhedus[Orgn] OR Nanger[Orgn] OR Neotragus[Orgn] OR Odocoileus[Orgn] OR Okapia[Orgn] OR Oreamnos[Orgn] OR Oreotragus[Orgn] OR Ourebia[Orgn] OR Ovibos[Orgn] OR Ovis[Orgn] OR Ozotoceros[Orgn] OR Pantholops[Orgn] OR Parachoerus[Orgn] OR Pecari[Orgn] OR Pelea[Orgn] OR Phacochoerus[Orgn] OR Philantomba[Orgn] OR Porcula[Orgn] OR Potamochoerus[Orgn] OR Procapra[Orgn] OR Procavia[Orgn] OR Pseudois[Orgn] OR Pseudoryx[Orgn] OR Pudu[Orgn] OR Rangifer[Orgn] OR Raphicerus[Orgn] OR Redunca[Orgn] OR Rhinoceros[Orgn] OR Rhynotragus[Orgn] OR Rupicapra[Orgn] OR Rusa[Orgn] OR Saiga[Orgn] OR Siamotragulus[Orgn] OR Stephanocemas[Orgn] OR Sus[Orgn] OR Sylvicapra[Orgn] OR Tapirella[Orgn] OR Tapirus[Orgn] OR Taurotragus[Orgn] OR Tayassu[Orgn] OR Tetracerus[Orgn] OR Tragelaphus[Orgn] OR Tragulus[Orgn] OR Vicugna[Orgn]", use_history=TRUE)
cytb_search
cytb_search$web_history


for( seq_start in seq(1,94603,10)){
  recs <- entrez_fetch(db="nuccore", web_history=cytb_search$web_history,
                       rettype="fasta", retmax=94603, retstart=seq_start)
  cat(recs, file="ungulates_cytb.fasta", append=TRUE)
  cat(seq_start+9, "sequences downloaded\r")
}

#example from April's github
library(rentrez)
cytb_sequences<- entrez_search(db = "gene", term="cytb[Gene] AND Addax[Orgn]") #OR Aepyceros[Orgn] OR Alcelaphus[Orgn] OR Alces[Orgn] OR Ammotragus[Orgn] OR Antidorcas[Orgn] OR Antilocapra[Orgn] OR Antilope[Orgn] OR Axis[Orgn] OR Ammodorcas[Orgn] OR Babyrousa[Orgn] OR Beatragus[Orgn] OR Bison[Orgn] OR Blastocerus[Orgn] OR Bos[Orgn] OR Boselaphus[Orgn] OR Bubalus[Orgn] OR Budorcas[Orgn] OR Camelus[Orgn] OR Capra[Orgn] OR Capreolus[Orgn] OR Capricornis[Orgn] OR Catagonus[Orgn] OR Cephalophus[Orgn] OR Ceratotherium[Orgn] OR Cervus[Orgn] OR Connochaetes[Orgn] OR Dama[Orgn] OR Damaliscus[Orgn] OR Dendrohyrax[Orgn] OR Dicerorhinus[Orgn] OR Diceros[Orgn] OR Dorcatragus[Orgn] OR Elaphodus[Orgn] OR Elaphurus[Orgn] OR Elephas[Orgn] OR Equus[Orgn] OR Eudorcas[Orgn] OR Giraffa[Orgn] OR Gazella[Orgn] OR Hadrohyus[Orgn] OR Hemitragus[Orgn] OR Heterohyrax[Orgn] OR Hexaprotodon[Orgn] OR Hippocamelus[Orgn] OR Hippopotamus[Orgn] OR Hippotigris[Orgn] OR Hippotragus[Orgn] OR Hydropotes[Orgn] OR Hyemoschus[Orgn] OR Hylochoerus[Orgn] OR Hyomoschus[Orgn] OR Kobus[Orgn] OR Lama[Orgn] OR Litocranius[Orgn] OR Loxodonta[Orgn] OR Madoqua[Orgn] OR Mazama[Orgn] OR Moschiola[Orgn] OR Moschus[Orgn] OR Muntiacus[Orgn] OR Myotragus[Orgn] OR Naemorhedus[Orgn] OR Nanger[Orgn] OR Neotragus[Orgn] OR Odocoileus[Orgn] OR Okapia[Orgn] OR Oreamnos[Orgn] OR Oreotragus[Orgn] OR Ourebia[Orgn] OR Ovibos[Orgn] OR Ovis[Orgn] OR Ozotoceros[Orgn] OR Pantholops[Orgn] OR Parachoerus[Orgn] OR Pecari[Orgn] OR Pelea[Orgn] OR Phacochoerus[Orgn] OR Philantomba[Orgn] OR Porcula[Orgn] OR Potamochoerus[Orgn] OR Procapra[Orgn] OR Procavia[Orgn] OR Pseudois[Orgn] OR Pseudoryx[Orgn] OR Pudu[Orgn] OR Rangifer[Orgn] OR Raphicerus[Orgn] OR Redunca[Orgn] OR Rhinoceros[Orgn] OR Rhynotragus[Orgn] OR Rupicapra[Orgn] OR Rusa[Orgn] OR Saiga[Orgn] OR Siamotragulus[Orgn] OR Stephanocemas[Orgn] OR Sus[Orgn] OR Sylvicapra[Orgn] OR Tapirella[Orgn] OR Tapirus[Orgn] OR Taurotragus[Orgn] OR Tayassu[Orgn] OR Tetracerus[Orgn] OR Tragelaphus[Orgn] OR Tragulus[Orgn] OR Vicugna[Orgn]", api_key ="cae63cb06b8a6643e319eb4fc4931858dc08", use_history = TRUE)
cytb_sequences
cytb_sequences$web_history


data <- list()

species <- c("Aepyceros", "Alcelaphus", "Alces")

for (x in species){
  term<-paste(x,"[Organism] AND ((CYTB[Gene]) OR complete genome[All Fields])",sep='',collapse = NULL)  search<-entrez_search(db="nuccore",term=term,retmax=99999)
  data[x] <- tryCatch({entrez_fetch(db="nuccore",id=search$ids,rettype="fasta")},
                      error = function(e){NA})
}


links <- entrez_link(dbfrom='gene', db='nuccore', web_history=cytb_sequences$web_history)
links

linkout_urls(links)

for( seq_start in seq(1,50,120)){
  recs <- entrez_fetch(db="nuccore", web_history=cytb_sequences$web_history,
                       rettype="fasta", retmax=50)
  cat(recs, file="cytb.seqs.fasta", append=TRUE)
  cat(seq_start+49, "sequences downloaded\r")
}


