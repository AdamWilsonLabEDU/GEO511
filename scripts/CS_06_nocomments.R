library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

library(ncdf4)
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")
tmean=raster("crudata.nc")
