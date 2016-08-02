 # Auswertung von Allbus 2014

library(rio)
library(tidyr)
library(dplyr)

 # Konvertieren von .dta zu .csv
setwd("~/Allbus2014")
rio::convert("ZA5240_v2-1-0.dta", "Allbus2014.csv")
Allbus2014 <- read.csv("Allbus2014.csv")

Allbus2014 <- dplyr::select(Allbus2014, V2, V639:V669, V673, V680, V683:V699)
 # Allbus2014 <- dplyr::select(Allbus2014, V641:V651 < 5)
 # str(Allbus2014)

 # Alle NA entfernen 
cleanup <- tidyr::gather(Allbus2014, "variable", "value", V639:V699)
cleanup <- dplyr::filter(cleanup, value < 6)
cleanup <- tidyr::spread(cleanup, variable, value)
Allbus2014 <- na.omit(cleanup)
