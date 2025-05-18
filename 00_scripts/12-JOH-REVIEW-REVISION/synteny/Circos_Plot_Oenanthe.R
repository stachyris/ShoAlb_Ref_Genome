## This script is adopted from Hruska and Manthey et al 2021
## Jack P Hruska, Joseph D Manthey, De novo assembly of a chromosome-scale reference genome for the northern flicker Colaptes auratus, G3 Genes|Genomes|Genetics, Volume 11, Issue 1, January 2021, jkaa026, https://doi.org/10.1093/g3journal/jkaa026

library(OmicCircos)
library(pals)
library(dplyr)
library(viridis)
options(stringsAsFactors=FALSE)


#setwd("/Users/vinaykl/Robin_Lab_stuff/bShoAlb1.1/post_review/JOH_Review/Synteny/")

x <- read.table("Oenanthe/Oenanthe-TG_filtered.coords", sep="\t", header=T, row.names = NULL, skip = 3)

names(x) <- c("X.S1.", "X.E1.", "X.S2.", "X.E2.", "X.LEN.1.", "X.LEN.2." , 
              "X...IDY.", "X.LEN.R.", "X.LEN.Q.", "X.TAGS.", "X")

# subset data frame so only the largest placed pseudomolucles are selected

x.1 <- filter(x, X %in% c("NC_079363.1_RagTag",
                          "NC_079355.1_RagTag",
                          "NW_026612650.1_RagTag",
                          "NC_079361.1_RagTag",
                          "NC_079360.1_RagTag",
                          "NC_079359.1_RagTag",
                          "NC_079357.1_RagTag",
                          "NC_079356.1_RagTag",
                          "NC_079354.1_RagTag",
                          "NC_079352.1_RagTag",
                          "NC_079350.1_RagTag",
                          "NC_079351.1_RagTag",
                          "NC_079349.1_RagTag",
                          "NC_079353.1_RagTag",
                          "NC_079348.1_RagTag",
                          "NC_079347.1_RagTag",
                          "NC_079344.1_RagTag",
                          "NC_079358.1_RagTag",
                          "NC_079346.1_RagTag",
                          "NC_079338.1_RagTag",
                          "NC_079345.1_RagTag",
                          "NC_079343.1_RagTag",
                          "NC_079342.1_RagTag",
                          "NC_079340.1_RagTag",
                          "NC_079341.1_RagTag",
                          "NC_079339.1_RagTag",
                          "NC_079334.1_RagTag",
                          "NC_079337.1_RagTag",
                          "NC_079362.1_RagTag",
                          "NC_079336.1_RagTag",
                          "NC_079333.1_RagTag",
                          "NC_079335.1_RagTag"))

# subset data frame so only chromosomes are selected from the ref genome
x.1 <- filter(x.1, X.TAGS. %in% c("NC_044213.2",
                                  "NC_044211.2",
                                  "NC_044214.2",
                                  "NC_044241.2",
                                  "NC_044212.2",
                                  "NC_044215.2",
                                  "NC_044217.2",
                                  "NC_044219.2",
                                  "NC_044218.2",
                                  "NC_044220.2",
                                  "NC_044221.2",
                                  "NC_044223.2",
                                  "NC_045028.1",
                                  "NC_044222.2",
                                  "NC_044224.2",
                                  "NC_044216.2",
                                  "NC_044225.2",
                                  "NC_044226.2",
                                  "NC_044232.2",
                                  "NC_044227.2",
                                  "NC_044229.2",
                                  "NC_044230.2",
                                  "NC_044231.2",
                                  "NC_044233.2",
                                  "NC_044236.2",
                                  "NC_044238.2",
                                  "NC_044235.2",
                                  "NC_044240.2",
                                  "NC_044239.2",
                                  "NC_044234.2",
                                  "NC_044237.2",
                                  "NC_044242.2",
                                  "NC_054767.1",
                                  "NC_044243.2",
                                  "NC_054764.1",
                                  "NC_054763.1",
                                  "NC_054769.1",
                                  "NC_054766.1",
                                  "NC_054765.1",
                                  "NC_044228.2",
                                  "NC_054768.1"))
# rearrange the input file to the following order
# target name, start, end, query name, start, end, identity, length target, length query
x.1 <- x.1[,c(10,1,2,11,3,4,7, 9,10)]

# subset scaffold names and start sites
x.2 <- x.1[,c(1,2,4,5)]


# bin the segments of the circos plot
segf_lengths <- c()
x3 <- c()
for(a in 1:length(unique(x.2[,1]))) {
  a_rep <- x.2[x.2[,1] == unique(x.2[,1])[a], ]
  test <- unique(sort(a_rep[,2]))
  a_rep[,2] <- match(a_rep[,2], test)
  x3 <- rbind(x3, a_rep)
  
  segf_lengths <- rbind(segf_lengths, c(unique(x.2[,1])[a], length(test)))
}


x4 <- c()
for(a in 1:length(unique(x.2[,3]))) {
  a_rep <- x3[x3[,3] == unique(x.2[,3])[a], ]
  test <- unique(sort(a_rep[,4]))
  a_rep[,4] <- match(a_rep[,4], test)
  x4 <- rbind(x4, a_rep)
  segf_lengths <- rbind(segf_lengths, c(unique(x.2[,3])[a], length(test)))
}
segf_lengths <- data.frame(chrom=as.character(segf_lengths[,1]), bins=as.numeric(segf_lengths[,2]))


# create segments object
seg_f <- c()
for(a in 1:nrow(segf_lengths)) {
  a_name <- segf_lengths[a,1]
  a_lengths <- 0:(segf_lengths[a,2] - 1)
  a_lengths2 <- a_lengths + 1
  a_name <- rep(a_name, length(a_lengths))
  a_v <- rep("NA", length(a_lengths))
  a_note <- rep("NA", length(a_lengths))
  a_output <- cbind(a_name, a_lengths, a_lengths2, a_v, a_note)
  seg_f <- rbind(seg_f, a_output)
}
seg_f <- data.frame(seg.name=as.character(seg_f[,1]), seg.Start=as.numeric(seg_f[,2]), seg.End=as.numeric(seg_f[,3]), the.v=as.character(seg_f[,4]), Note=as.character(seg_f[,5]))


# make the links object in the right format
link_names <- paste("n", seq(from=1, to=nrow(x4), by=1), sep="")
link_v <- data.frame(seg1=as.character(x4[,1]), po1=as.numeric(x4[,2]), name1=as.character(link_names), seg2=as.character(x4[,3]), po2=as.numeric(x4[,4]), name2=as.character(link_names))
# subset for easier plotting
link_subset <- link_v[sample(1:nrow(link_v), floor(nrow(link_v) / 100)), ]


# make the angular database
seg_names <- sort(unique(segf_lengths[,1]))

# modify for particular plot if necessary:
seg_names <- c("NC_079335.1_RagTag",
               "NC_079333.1_RagTag",
               "NC_079336.1_RagTag",
               "NC_079362.1_RagTag",
               "NC_079337.1_RagTag",
               "NC_079334.1_RagTag",
               "NC_079339.1_RagTag",
               "NC_079341.1_RagTag",
               "NC_079340.1_RagTag",
               "NC_079342.1_RagTag",
               "NC_079343.1_RagTag",
               "NC_079345.1_RagTag",
               "NC_079338.1_RagTag",
               "NC_079346.1_RagTag",
               "NC_079358.1_RagTag",
               "NC_079344.1_RagTag",
               "NC_079347.1_RagTag",
               "NC_079348.1_RagTag",
               "NC_079353.1_RagTag",
               "NC_079349.1_RagTag",
               "NC_079351.1_RagTag",
               "NC_079350.1_RagTag",
               "NC_079352.1_RagTag",
               "NC_079354.1_RagTag",
               "NC_079356.1_RagTag",
               "NC_079357.1_RagTag",
               "NC_079359.1_RagTag",
               "NC_079360.1_RagTag",
               "NC_079361.1_RagTag",
               "NW_026612650.1_RagTag",
               "NC_079355.1_RagTag",
               "NC_079363.1_RagTag",
               "NC_054768.1",
               "NC_044228.2",
               "NC_054765.1",
               "NC_054766.1",
               "NC_054769.1",
               "NC_054763.1",
               "NC_054764.1",
               "NC_044243.2",
               "NC_054767.1",
               "NC_044242.2",
               "NC_044237.2",
               "NC_044234.2",
               "NC_044239.2",
               "NC_044240.2",
               "NC_044235.2",
               "NC_044238.2",
               "NC_044236.2",
               "NC_044233.2",
               "NC_044231.2",
               "NC_044230.2",
               "NC_044229.2",
               "NC_044227.2",
               "NC_044232.2",
               "NC_044226.2",
               "NC_044225.2",
               "NC_044216.2",
               "NC_044224.2",
               "NC_044222.2",
               "NC_045028.1",
               "NC_044223.2",
               "NC_044221.2",
               "NC_044220.2",
               "NC_044218.2",
               "NC_044219.2",
               "NC_044217.2",
               "NC_044215.2",
               "NC_044212.2",
               "NC_044241.2",
               "NC_044214.2",
               "NC_044211.2",
               "NC_044213.2")

# outer chrom colours
seg_colors <- c(rep("cyan", 33), rep("orange", 41))

# final database
db <- segAnglePo(seg_f, seg=seg_names)


# colors for plotting
cols <- viridis(length(unique(link_subset[,4])))
cols_rgb <- col2rgb(cols)
new_cols <- c()
for(a in 1:ncol(cols_rgb)) {
  a_col <- rgb(cols_rgb[1,a], cols_rgb[2,a], cols_rgb[3,a], max=255, alpha=0.4*255)
  new_cols <- c(new_cols, a_col)
}
cols <- new_cols

plot_colors <- rep("un", nrow(link_subset))
for(a in 1:length(unique(link_subset[,4]))) {
  a_rep <- sort(unique(link_subset[,4]))[a]
  plot_colors[link_subset[,4] == a_rep] <- cols[a]
}


par(mar=c(2,2,2,2), cex=0.8, xpd=TRUE) 
plot(c(1,800),  c(1,800), type="n", axes=FALSE, xlab="XLAB", ylab="YLAB", main="", asp=1)
circos(R=360, cir=db, type="chr", col=seg_colors, print.chr.lab=TRUE, W=40, scale = F)
circos(R=350, cir=db, W=40, mapping=link_subset, type="link", lwd=6, col=plot_colors)

