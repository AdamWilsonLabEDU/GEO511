#' ---
#' title: "Getting Help!"
#' week: 7
#' type: Case Study
#' subtitle: Learning more about finding help
#' reading:
#'    - How to [write a reproducible example](http://adv-r.had.co.nz/Reproducibility.html)
#'    - Using [Reprex package](https://reprex.tidyverse.org/)
#' tasks:
#'    - Learn how to read R help files effectively
#'    - Learn how to search for help
#'    - Learn how to create a Minimum Working Example (MWE)
#'    - Debug existing code
#'    - Post your reprex as an ‘issue’ in github
#'    - Post your repex to slack
#' ---
#' 

#' 
#' # Reading
#' 

#' 
#' # Tasks
#' 

#' 
#' ## Libraries
#' 

#' 
#' ## Your problem
#' 
#' You want to make a figure illustrating the distribution of GDP per capita for all countries within each continent using the `world` data in the `spData` package.  
#' 
#' ### Your goal
#' Your desired figure looks something like the following:

#' 
#' ### Current Version of your code
#' You have started working on the figure but can't seem to make it work like you want.   Here is your current version of the code (and the resulting figure):
#' 
## ----warning=F, fig.width=15--------------------------------------------------
ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
   geom_density(alpha=0.5,color=F)

#' 
#' The second figure is quite different from the one you want.  You want to ask for help and so you know that you need to make a reproducible example.  Starting with the code above, make the required edits so you can use `reprex()` to generate a nicely formatted example that you could post as a github 'issue,' send as an email or post to a forum to ask for help.  See the [reading](https://reprex.tidyverse.org/) for more help. Note: you do _not_ need to recreate the first figure above, only to use `reprex()` to illustrate your question and problematic code.
#' 
#' <div class="well">
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo1">Show Hints</button>
#' <div id="demo1" class="collapse">
#' 
#' ## Steps
#' 1. Download the [<i class="fa fa-file-code-o fa-1x" aria-hidden="true"></i> starter R script (if desired)](`r output_nocomment`){target="_blank"}.  Save this directly to your course folder (repository) so you don't lose track of it!
#' 2. Add code (only 3 lines) needed to produce the second plot (hint: make sure the data are available)
#' 2. Copy the code to your clipboard
#' 3. Post as an 'issue' in github
#'       1. run `reprex(venue="gh")` to generate the reproducible example and put the content on your clipboard
#'       2. go to _your_ repository on github
#'       3. click on the "issues" tab (to the right of the 'code' tab)
#'       4. click the green 'New issue' button
#'       5. paste the reprex in the "leave a comment" box
#'       6. Add an informative title ("Example repex"?) 
#' 4. Post to the slack #reprex channel
#'       1. run `reprex(venue="gh")` to generate the reproducible example
#'       2. paste in the [reprex](https://2021spatialda-dba8777.slack.com/archives/C02HHC8GDFG) channel.
#' 
#' 
#' It should look something like this:
#' 
#' ![](assets/reprex.png)
#' 
#' </div>
#' </div>
#' 
#' 
#' <div class="extraswell">
#' <button data-toggle="collapse" class="btn btn-link" data-target="#extras">
#' Extra time? Try this...
#' </button>
#' <div id="extras" class="collapse">
#' Fix the code above to recreate the first figure.
#' </div>
#' </div>
