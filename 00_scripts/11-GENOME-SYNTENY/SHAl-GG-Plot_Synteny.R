## This script is adopted from Hruska and Manthey et al 2021
## Jack P Hruska, Joseph D Manthey, De novo assembly of a chromosome-scale reference genome for the northern flicker Colaptes auratus, G3 Genes|Genomes|Genetics, Volume 11, Issue 1, January 2021, jkaa026, https://doi.org/10.1093/g3journal/jkaa026

library(OmicCircos)
options(stringsAsFactors=FALSE)
library(pals)
library(dplyr)
library(viridis)


setwd("/Users/vinaykl/Robin_Lab_stuff/bShoAlb1.1/genome-synteny/11-GENOME-SYNTENY")

x <- read.table("SHAL-GG_filtered.coords", sep="\t", header=T, row.names = NULL, skip = 3)

names(x) <- c("X.S1.", "X.E1.", "X.S2.", "X.E2.", "X.LEN.1.", "X.LEN.2." , 
              "X...IDY.", "X.LEN.R.", "X.LEN.Q.", "X.TAGS.", "X")

# subset data frame so only the largest placed pseudomolucles are selected

x.1 <- filter(x, X %in% c("scaffold1",  "scaffold2",  "scaffold3",  "scaffold4" , "scaffold5" , "scaffold6",  "scaffold7",  "scaffold8" ,
                          "scaffold9",  "scaffold10", "scaffold11", "scaffold12", "scaffold13", "scaffold14", "scaffold15", "scaffold16",
                          "scaffold17", "scaffold18" ,"scaffold19" ,"scaffold20" ,"scaffold21" ,"scaffold22", "scaffold23", "scaffold24",
                          "scaffold25" ,"scaffold26", "scaffold27" ,"scaffold28", "scaffold29" ,"scaffold30", "scaffold31", "scaffold32",
                          "scaffold33", "scaffold34", "scaffold35" ,"scaffold36"))

# subset data frame so only chromosomes are selected from the ref genome
x.1 <- filter(x.1, X.TAGS. %in% c("CM028482.1", "CM028483.1", "CM028484.1", "CM028485.1",
                                  "CM028486.1", "CM028487.1", "CM028488.1", "CM028489.1",
                                  "CM028490.1", "CM028491.1", "	CM028492.1", "CM028493.1",
                                  "CM028494.1", "CM028495.1", "CM028496.1", "CM028497.1",
                                  "CM028498.1", "CM028499.1", "CM028500.1", "CM028501.1",
                                  "CM028502.1", "CM028503.1",  "CM028504.1","CM028505.1", 
                                  "CM028506.1", "CM028507.1", "CM028508.1","CM028509.1", 
                                  "CM028521.1", 
                                  "CM028522.1"))

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

seg_names <- c("scaffold1",  "scaffold2",  "scaffold3",  "scaffold4" , "scaffold5" , "scaffold6",  "scaffold7",  "scaffold8" ,
               "scaffold9",  "scaffold10", "scaffold11", "scaffold12", "scaffold13", "scaffold14", "scaffold15", "scaffold16",
               "scaffold17", "scaffold18" ,"scaffold19" ,"scaffold20" ,"scaffold21" ,"scaffold22", "scaffold23", "scaffold24",
               "scaffold25" ,"scaffold26", "scaffold27" ,"scaffold28", "scaffold29" ,"scaffold30", "scaffold31", "scaffold32",
               "scaffold33", "scaffold35" ,"scaffold36", "CM028522.1", "CM028521.1",
               "CM028509.1", "CM028508.1", "CM028507.1", "CM028506.1",
              "CM028505.1", "CM028504.1", "CM028503.1", "CM028502.1", "CM028501.1", "CM028500.1",
              "CM028499.1", "CM028498.1", "CM028497.1", "CM028496.1", "CM028495.1", "CM028494.1",
              "CM028493.1", "CM028491.1", "CM028490.1", "CM028489.1", "CM028488.1", "CM028487.1", 
              "CM028486.1", "CM028485.1", "CM028484.1", "CM028483.1", "CM028482.1")
    
# outer chrom colours
seg_colors <- c(rep("orange", 35), rep("cyan", 37))

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


par(mar=c(2,2,2,2)) 
plot(c(1,800),  c(1,800), type="n", axes=FALSE, xlab="XLAB", ylab="YLAB", main="", asp=1)
circos(R=360, cir=db, type="chr", col=seg_colors, print.chr.lab=TRUE, W=40, scale = F)
circos(R=350, cir=db, W=40, mapping=link_subset, type="link", lwd=3.75, col=plot_colors)

