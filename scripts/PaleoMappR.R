#devtools::install_github("macroecology/paleoMap")
​
library(tidyverse)
library(mapast)
​
#get data from pbdb. Options specifies extra data to download into the dataframe.
#options should contain the string "paleoloc" if paleolat and longitude are desired.
#Some other options are "genus", "class", "env", or "coords"
get_pbdb_data <- function(names=c("Microhyrax", "Ursus"), ages=c(min=0, max=0.1), options=c()){

  ages=as.list(ages)

  link=paste0("https://paleobiodb.org/data1.2/occs/list.csv?datainfo&rowcount&base_name=",
              paste0(names, collapse = ","),
              paste0("&max_ma=", ages$max, "&min_ma=", ages$min),
              "&show=",
              paste0(options, collapse = ",")
  )

  data = unlist(strsplit(readLines(link), split = "\n"))

  begin_data = grep("Records:", data) + 1

  data = data[begin_data:length(data)]

  data <- read.csv(text=data)

  if(data[1, 1] == "THIS REQUEST RETURNED NO RECORDS")
    message("THIS REQUEST RETURNED NO RECORDS")
  else{
    return(data)
  }
}
​
#creates a map of Earth at a given time period with geom_polygon()
#The idea is to create this map, and then use the paleocoordinates from get_pbdb_data() to plot points at that time
get_paleomap <- function(data, timemap){
  map <- mapast::getmap(timemap, do.plot = FALSE)
  map <- fortify(map)
  return(ggplot(data, aes(x=lng, y=lat, group = identified_name)) + coord_equal() + geom_point() + geom_polygon() + ggtitle(paste("Time:", timemap, "mya")) + theme(plot.title = element_text(hjust = 0.5)) + labs(y="Paleolatitude", x="Paleolongitude"))
}
​
