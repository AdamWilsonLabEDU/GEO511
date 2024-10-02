library(terra)
library(spData)
library(tidyverse)
library(sf)

library(ncdf4)
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")

# read in the data using the rast() function from the terra package
tmean=rast("crudata.nc")
