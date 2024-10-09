#' ---
#' title: Find hottest country on each continent
#' week: 6
#' type: Case Study
#' subtitle: Use sf and terra to process raster data to quantify mean annual temperature for each country and then identify the hottest one on each continent.
#' reading:
#'    - Raster Vector Interactions [GCR](https://r.geocompx.org/raster-vector){target='blank'}
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
#' ![](https://r.geocompx.org/figures/pointextr-1.png)
#' 
#' You could also be interested in some summary of the raster data across multiple pixels (such as the buffered points above, a transect, or within a polygon).  For example, you might be interested in the mean elevation within the entire polygon in the above figure.
#' 
#' In this case study we'll work with a [HadCRUT temperature data](https://crudata.uea.ac.uk/cru/data/temperature/) from the [Climatic Research Unit at the University of East Anglia](https://www.uea.ac.uk/groups-and-centres/climatic-research-unit).  These are near-global rasters of surface temperature on a five degree grid.    
#' 
#' # Objective
#' > Identify the hottest country on each continent by intersecting a set of polygons with a raster image and calculating the maximum raster value in each polygon.
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
library(terra)
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

# read in the data using the rast() function from the terra package
tmean=rast("crudata.nc")

#' Note:  If the above code returns an error about `nc_open()`, try adding `method="curl"` at the end of the `download.file()` command.
#' 
#' ## Steps
#' 1. Prepare Climate Data 
#'     1. Download and load the CRU data using the code above (`tmean=rast("crudata.nc")`).
#'     2. Inspect the new `tmean` object (you can start by just typing it's name `tmean`, then perhaps making a `plot()`).  How many layers does it have?  What do these represent?  You can read more about the data [here](https://crudata.uea.ac.uk/cru/data/temperature/)
#'     3. The CRU data are stored as degrees C.  
#' 2. Calculate the maximum temperature observed in each country.
#'     1. use `max()` to calculate the maximum value observed in each pixel across all months.  You may want to `plot()` the output of this and compare the plot of the original (full) raster. How many layers does it have now?
#'     2. use `terra::extract()` to identify the maximum temperature observed in each country (`fun=max`). Also set `na.rm=T, small=T` to 1) handle missing data along coastlines and 2) account for small countries that may not have a pixel centroid in them.
#'     2. use `bind_cols()` to bind the original `world` dataset with the new summary of the temperature data to create a new object called `world_clim` with the outputs from the `extract()` function above. 
#' 3. Communicate your results
#'     1. use `ggplot()` and `geom_sf()` to plot the maximum temperature in each country polygon (not the original raster layer).  To recreate the image below, you will also need `+scale_fill_viridis_c(name="Maximum\nTemperature (C)")`.  Note the use of `\n` to insert a line break in the text string. You can move the legend around with `+theme(legend.position = 'bottom')`.
#'     2. use `dplyr` tools to find the hottest country in each continent. You may need `group_by()` and `slice_max`.  To create a nice looking table, you may also want to use `select()` to keep only the desired columns, `arrange()` to sort them, `st_set_geometry(NULL)` to drop the geometry column (if desired).  Save this table as `hottest_continents`.
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
