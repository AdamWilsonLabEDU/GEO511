#' ---
#' title: Dynamic HTML graph of Daily Temperatures
#' subtitle: Using DyGraph library.
#' week: 12
#' type: Case Study
#' reading:
#'    - Browse the [HTML Widgets page](http://gallery.htmlwidgets.org/) for many more examples. Take notes in your readme.md about potential uses in your project.
#'    - Explore the [DyGraphs webpage](http://rstudio.github.io/dygraphs/)
#' tasks:
#'    - Download daily weather data for Buffalo, NY using an API
#'    - Generate a dynamic html visualization of the timeseries. 
#'    - Save the graph to your project folder using Export->Save as Webpage
#' ---
#' 
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
#' In this session you will explore several ways to generate dynamic and interactive data displays.  These include making maps and graphs that you can pan/zoom, select features for more information, and interact with in other ways.  The most common output format is HTML, which can easily be embedded in a website (such as your final project!).
#' 
## ----cache=F, message=F,warning=FALSE-----------------------------------------
library(tidyverse)
library(htmlwidgets)
library(widgetframe)

#' 
#' If you don't have the packages above, install them in the package manager or by running `install.packages("widgetframe")`, etc. 
#' 
#' # Objective
#' > Make a dygraph of recent daily temperature data from Buffalo, NY.
#' 
#' ## Detailed Steps
#' 
#' First use the following code to download recent daily weather data for UB.
#' 
## ----messages=F, warning=F----------------------------------------------------
library(xts)
library(dygraphs)
library(openmeteo)


d<- weather_history(c(43.00923265935055, -78.78494250958327),start = "2023-01-01",end=today(),
                  daily=list("temperature_2m_max","temperature_2m_min","precipitation_sum")) %>% 
  mutate(daily_temperature_2m_mean=(daily_temperature_2m_max+daily_temperature_2m_min)/2)


#' 
#' Remaining steps:
#' 
#' 1. Convert `d`. into an `xts` time series object using `xts()`.  By default, dygraph will plot all non-date columns in the table so you may need to use `select()` first to subset only the columns you need. You will need to specify which columns have the data you want (e.g. `d$daily_temperature_2m_max`) and which column has the date with `order.by=d$date`.   See `?xts` for help. 
#' 2. Set the title of the dygraph to be `main="Daily Maximum Temperature in Buffalo, NY"`
#' 3. Use `dygraph()` to draw the plot. If you want to do the ribbon plot below (showing min, max, and mean temps), you will need to use `dySeries()` as well.  Check out the help and examples to see how that's used.
#' 4. Add a `dyRangeSelector()` with a `dateWindow` of `c("2023-01-01", "2024-10-31")`
#' 5. Explore other options.  You could download another variable (precipitation?) and add it to the plot. Or imagine another way to visualize the data using one of the other interactive libraries.  In the version below, the two graphs are linked so they pan/zoom together.  Can you figure that out?
#' 
#' ## Output
#' 
#' At a minimum, your final graph should look something like this:
#' 

#' 

#' 
#' What other visualizations can you make with these data?
#' 
#' 
## -----------------------------------------------------------------------------



