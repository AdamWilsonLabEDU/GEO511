#' ---
#' title: Find hottest country on each continent
#' week: 6
#' type: Case Study
#' subtitle: Use sf and raster to quantify mean annual temperature for each country and then identify the hottest one on each continent.
#' reading:
#'    - Raster Vector Interactions [GCR](https://geocompr.robinlovelace.net/geometric-operations.html#raster-vector){target='blank'}
#' tasks:
#'    - Calculate annual mean temperatures from a monthly spatio-temporal dataset
#'    - Remove Antarctica from the `world` dataset
#'    - Summarize raster values within polygons
#'    - Generate a summary figure and table.
#'    - Save your script as a .R or .Rmd in your course repository
#' ---
#' 
#' 

#' 
#' # Reading
#' 

#' 
#' # Background
#' The raster data format is commonly used for environmental datasets such as elevation, climate, soil, and land cover. We commonly need to `extract` the data from raster objects using simple features (vector objects).  For example if you had a set of points you collected using a GPS and wanted to know the mean annual temperature at each point, you might `extract` the data from each location in a raster-based map of temperature.
#' 
#' ![](https://geocompr.robinlovelace.net/06-raster-vector_files/figure-html/pointextr-1.png)
#' 
#' You could also be interested in some summary of the raster data across multiple pixels (such as the buffered points above, a transect, or within a polygon).  For example, you might be interested in the mean elevation within the entire polygon in the above figure.
#' 
#' In this case study we'll work with a [HadCRUT temperature data](https://crudata.uea.ac.uk/cru/data/temperature/) from the [Climatic Research Unit at the University of East Anglia](https://www.uea.ac.uk/groups-and-centres/climatic-research-unit).  These are near-global rasters of surface temperature on a five degree grid.    
#' 
#' # Objective
#' > Identify the hottest country on each continent (not counting Antarctica) by intersecting a set of polygons with a raster image and calculating the maximum raster value in each polygon.
#' 
#' # Tasks
#' 

#' 
#' [<i class="fa fa-file-code-o fa-1x" aria-hidden="true"></i> Download starter R script (if desired)](`r output_nocomment`){target="_blank"}.  Save this directly to your course folder (repository) so you don't lose track of it!
#' 
#' <div class="well">
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo1">Show Hints</button>
#' <div id="demo1" class="collapse">
#' The details below describe one possible approach.
#' 
#' ## Libraries
#' You will need to load the following packages
## ----warning=FALSE, message=FALSE---------------------------------------------
library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

#' 
#' Loading the `spData()` package may return a warning: `To access larger datasets...install spDataLarge...`.  This is not required - you can use the standard lower resolution files and safely ignore this message.
#' 
#' ## Data
#' Download the mean annual temperatures over the reference period 1961-1990 [Climatic Research Unit data (CRU) here](https://crudata.uea.ac.uk/cru/data/temperature/).  Absolute temperatures for the base period 1961-90 on a 5° by 5° grid. Download these data in netcdf format using the code below: 
## -----------------------------------------------------------------------------
library(ncdf4)
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")
tmean=raster("crudata.nc")

#' Note:  If the above code returns an error about `nc_open()`, try adding `method="curl"` at the end of the `download.file()` command.
#' 
#' ## Steps
#' 1. Prepare country polygon data (the `world` object).
#'     1. Remove "Antarctica" with `filter()` because WorldClim does not have data there.
#'     2. Convert the `world` object to `sp` format (the 'old' format) because the `raster` package doesn't accept `sf` objects.  you can do this with `as(world,"Spatial")`.
#' 2. Prepare Climate Data 
#'     1. Download and load the CRU data using the code above (`tmean=raster("crudata.nc")`).
#'     2. Inspect the new `tmean` object (you can start by just typing it's name `tmean`, then perhaps making a `plot()`).  How many layers does it have?  What do these represent?  You can read more about the data [here](https://www.worldclim.org/data/worldclim21.html)
#'     3. The CRU data are stored as degrees C.  
#'     4. Use `names(tmean) <- "tmean"` to change the name of the layer in the new `tmean` object to `tmax`. This makes the later code more intuitive than keeping the default name `layer`.
#' 2. Calculate the maximum temperature observed in each country.
#'     1. use `raster::extract()` to identify the maximum temperature observed in each country (`fun=max`). Also set `na.rm=T, small=T, sp=T` to 1) handle missing data along coastlines, 2) account for small countries that may not have a full 0.5 degree pixel in them, and 3) return a spatial polygon object instead of just a vector of values.
#'     2. convert the results of the previous step to `sf` format with `st_as_sf()`.  Now you have an updated polygon object with a new column of maximium temperature.  Cool!
#'     3. save this spatial feature as `tmax_country`.
#' 3. Communicate your results
#'     1. use `ggplot()` and `geom_sf()` to plot the maximum temperature in each country polygon (not the original raster layer).  To recreate the image below, you will also need `+scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")`.  Note the use of `\n` to insert a line break in the text string. You can move the legend around with `+theme(legend.position = 'bottom')`.
#'     2. use `dplyr` tools to find the hottest country in each continent. You may need `group_by()` and `top_n`.  To create a nice looking table, you may also want to use `select()` to keep only the desired columns, `arrange()` to sort them, `st_set_geometry(NULL)` to drop the geometry column (if desired).  Save this table as `hottest_continents`.
#' </div>
#' </div>
#' 
#' Your final result should look something like this:
#' 

#' 
#' And the summary table will look like this:

#' 
#' Note that these data are based on 0.5 degree resolution data and thus will miss small hot places and cannot be directly compared with station-based data.  
#' 
#' <div class="extraswell">
#' <button data-toggle="collapse" class="btn btn-link" data-target="#extras">
#' Extra time? Try this...
#' </button>
#' <div id="extras" class="collapse">
#' 
#' Build a [leaflet map](https://rstudio.github.io/leaflet/) of the same dataset.
#' 

#' 
#' <iframe id="test"  style=" height:400px; width:100%;" scrolling="no"  frameborder="0" src="CS06_leaflet.html"></iframe>
#' 
#' 
#' </div>
#' </div>
