#' ---
#' title: "Parallel Computing with R"
#' subtitle: Write a parallel for loop
#' week: 11
#' type: Case Study
#' reading:
#'    - Parallel [Computing with the R Language in a Supercomputing Environment](https://link.springer.com/chapter/10.1007/978-3-642-13872-0_64)
#'    - CRAN Task View [High Performance and Parallel Computing with R](http://cran.r-project.org/web/views/HighPerformanceComputing.html)
#' tasks:
#'    - Download spatial data from the U.S. Census 
#'    - Write a parallel `foreach()` loop to generate a point representing each person in each census polygon (block/tract)
#'    - Set the output of the `foreach()` funtion to return a spatial (`sf`) object 
#'    - Make a 'dot map' of the racial distribution in Buffalo, NY.
#' ---
#' 

#' 
#' # Reading
#' 

#' 
#' 
#' # Tasks
#' 

#' 
#' ## Background
#' 
#' The census data do not include specific addresses (the finest spatial information is the census block), so it's common to see chloropleths representing the aggregate statistics of the underlying polygon.  This is accurate, but not so personal.  Folks at the University of Virginia developed a simple yet effective visualization approach, called the ['Racial Dot Map'](https://demographics.virginia.edu/DotMap/index.html) which conveys a simple idea - one dot equals one person.  Here's how it looks for Buffalo, NY.
#' 
#' ![](https://www.buffalorising.com/wp-content/uploads/2015/06/2010-census-Buffalo-NY-1110x738.jpg)
#' 
#' 
#' The idea is really simple.  One just randomly generates a point for each person of each racial identity within each polygon.   
#' 
#' Can you do it?  Can you do it using multiple cores on your computer?
#' 
## ----cache=F, message=F,warning=FALSE, results='hide'-------------------------
library(tidyverse)
library(spData)
library(sf)

## New Packages
library(mapview) # new package that makes easy leaflet maps
library(foreach)
library(doParallel)
registerDoParallel(4)
getDoParWorkers() # check registered cores

#' 
#' To use the tidycensus package, you will need to load the package and set your Census API key. A key can be obtained from http://api.census.gov/data/key_signup.html. You will only need to do that once (unless you delete your .Renviron file or move to a different computer).
#' 
## ----eval=F-------------------------------------------------------------------
## # go to  http://api.census.gov/data/key_signup.html and get a key, then run the line below with your key.  Don't push your key to github!
## library(tidycensus)
## census_api_key("YOUR API KEY GOES HERE")

#' 
#' <div class="well">
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo1">Show Hints</button>
#' <div id="demo1" class="collapse">
#' 
#' ## Steps
#' 
#' Write an Rmd script that:
#' 
#' * Downloads block-level data on population by race in each census block in Buffalo using `get_dicennial()` function of the `tidycensus` package.  You can use the following code:
## ----message=F----------------------------------------------------------------
library(tidycensus)
racevars <- c(White = "P005003", 
              Black = "P005004", 
              Asian = "P005006", 
              Hispanic = "P004003")

options(tigris_use_cache = TRUE)
erie <- get_decennial(geography = "block", variables = racevars, 
                  state = "NY", county = "Erie County", geometry = TRUE,
                  summary_var = "P001001", cache_table=T) 

#' * Crop the county-level data to `c(xmin=-78.9,xmax=-78.85,ymin=42.888,ymax=42.92)` to reduce the computational burdern. Feel free to enlarge this area if your computer is fast (or you are patient).
#' * Write a foreach loop that does the following steps _for each racial group_ in the `variable` column of the `erie` dataset and `rbind`s the results (e.g. `.combine=rbind`) into a single `sf` object.  You may want to convert the variable column into a factor and use `levels()` or use `unique()`.
#'    * filter the the data to include only one race at time
#'    * use `st_sample()` to generate random points for each person that resided within each polygon.  If you use a pipe (`%>%`), you will have to set `size=.$value`.  The `.` indicates that the column comes from the dataset that was passed to the function. See [here](https://magrittr.tidyverse.org/reference/pipe.html) for details on how to use the `.` in a pipe.
#'    * convert the points from `st_sample()` to spatial features with `st_as_sf()`
#'    * `mutate` to add a column named `variable` that is set to the current racial group (from the foreach loop)
#' * Use the `mapview()` function in the `mapview` package to make a leaflet map of the dataset and set the `zcol` to the racial identity of each point. You can adjust any of the visualization parameters (such as `cex` for size).  [Read more about mapview here](https://r-spatial.github.io/mapview/).  It's a new and really easy way to make leaflet maps from many types of spatial data.
#'    
#' </div>
#' </div>
#' 
#' 

#' 
#' 

#' 
#' Your final result should look something like this:

#' 
#' <div class="extraswell">
#' <button data-toggle="collapse" class="btn btn-link" data-target="#extras">
#' Extra time? Try this...
#' </button>
#' <div id="extras" class="collapse">
#' 
#' Update the map to include:
#' 
#' * Other racial groups
#' * Adjust colors to match the original
#' * Summarize the data in different ways (e.g. plot the polygon data, calculate indices, etc.)
#' 

#' 
#' </div>
#' </div>
