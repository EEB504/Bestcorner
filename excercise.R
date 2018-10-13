library(ggplot2)


download.file(url="https://github.com/EEB504/EEB504/raw/master/GitR/dirtivore.rda", 
              destfile="dirtivore.rda") # you only have to do this once
load("dirtivore.rda"); ls() # load the dataset into the current R workspace and see what is in 


non_numeric_indices_kg <- which(is.na(as.numeric(dirtivore_df$MassKG)))

non_numeric_indices <- which(is.na(as.numeric(dirtivore_df$rMax)))

dirtivore_df$MassKG[non_numeric_indices_kg]<-
  gsub("pewpewpew","", dirtivore_df$MassKG[non_numeric_indices_kg])

dirtivore_df$MassKG[non_numeric_indices]<-
  gsub("rmaxmaxmax","", dirtivore_df$MassKG[non_numeric_indices])


dirtivore_df$rMax<-as.numeric(dirtivore_df$rMax)
dirtivore_df$MassKG<-as.numeric(dirtivore_df$MassKG)

rmax.lm<-lm(log10(dirtivore_df$rMax)~log10(dirtivore_df$MassKG))
plot(log10(dirtivore_df$MassKG), log10(dirtivore_df$rMax), 
     xlab="Body mass log10 Kg", ylab="rmax (log10 transformed)", ylim=c(-1, 1))
abline(rmax.lm)

