#' ---
#' title: "Introduction to R"
#' ---
#' 

#' 
#' # Logistics
#' [<i class="fas fa-desktop fa-3x" aria-hidden="true"></i> Presentation](presentations/PS_01_intro.html){target="_blank"}  
#' 
#' [<i class="fa fa-file-code-o fa-3x" aria-hidden="true"></i> R Script](`r output`){target="_blank"}  Download this file and open it (or copy-paste into a new script) with RStudio so you can follow along.  
#' 
#' # First Steps
#' 
#' ## Variables
## -----------------------------------------------------------------------------
x=1
x

#' 
#' We can also assign a vector to a variable:
#' 
## -----------------------------------------------------------------------------
x=c(5,8,14,91,3,36,14,30)
x

#' 
#' And do simple arithmetic:
## -----------------------------------------------------------------------------
x+2

#' 
#' <div class="well">
#' Create a new variable called `y` and set it to `15`
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo1">Show Solution</button>
#' <div id="demo1" class="collapse">
#' 

#' </div>
#' </div>
#' 
#' 
#' Note that `R` is case sensitive, if you ask for `X` instead of `x`, you will get an error
## ----eval=FALSE---------------------------------------------------------------
## X
## Error: object 'X' not found

#' 
#' 
#' ### Variable naming conventions
#' 
#' Naming your variables is your business, but there are [5 conventions](http://www.r-bloggers.com/consistent-naming-conventions-in-r/) to be aware of:
#' 
#' * **alllowercase**: _e.g._ `adjustcolor`
#' * **period.separated**: _e.g._ `plot.new`
#' * **underscore_separated**: _e.g._ `numeric_version`
#' * **lowerCamelCase**: _e.g._ `addTaskCallback`
#' * **UpperCamelCase**: _e.g._ `SignatureMethod`
#' 
#' 
#' # Subsetting
## -----------------------------------------------------------------------------
x

#' 
#' Subset the vector using `x[ ]` notation
## -----------------------------------------------------------------------------
x[5]

#' You can use a `:` to quickly generate a sequence:
## -----------------------------------------------------------------------------
1:5

#' and use that to subset as well:
## -----------------------------------------------------------------------------
x[1:5]

#' 
#' # Using Functions
#' 
#' To calculate the mean, you could do it _manually_ like this
#' 
## -----------------------------------------------------------------------------
(5+8+14+91+3+36+14+30)/8

#' 
#' Or use a function:
## -----------------------------------------------------------------------------
mean(x)

#' 
#' Type `?functionname` to get the documentation (`?mean`) or `??"search parameters` (??"standard deviation") to search the documentation.  In RStudio, you can also search in the help panel.  `mean` has other arguments too: 
#' 
#' `mean(x, trim = 0, na.rm = FALSE, ...)`
#' 
#' In RStudio, if you press `TAB` after a function name (such as `mean( `), it will show function arguments.
#' 
#' ![Autocomplete screenshot][pic1]
#' 
#' [pic1]: img/autocomplete.png "Autocomplete Screenshot"
#' 
#' 
#' <div class="well">
#' Calculate the standard deviation of `c(3,6,12,89)`.    
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo2">Show Solution</button>
#' <div id="demo2" class="collapse">
#' 

#' </div>
#' </div>
#' 
#' 
#' Writing functions in R is pretty easy.  Let's create one to calculate the mean of a vector by getting the sum and length.  First think about how to break it down into parts:
## -----------------------------------------------------------------------------
x1= sum(x)
x2=length(x)
x1/x2

#' 
#' Then put it all back together and create a new function called `mymean`:
## -----------------------------------------------------------------------------
mymean=function(f){
  sum(f)/length(f)
}

mymean(f=x)

#' 
#' Confirm it works:
## -----------------------------------------------------------------------------
mean(x)

#' 
#' <div class="well"> Any potential problems with the `mymean` function? </div>
#' 
#' # Missing data:  dealing with `NA` values
## -----------------------------------------------------------------------------
x3=c(5,8,NA,91,3,NA,14,30,100)

#' 
#' <div class="well">" What do you think `mymean(x3)` will return? </div>
#' 
#' Calculate the mean using the new function
## -----------------------------------------------------------------------------
mymean(x3)

#' Use the built-in function (with and without na.rm=T)
## -----------------------------------------------------------------------------
mean(x3)
mean(x3,na.rm=T)

#' Writing simple functions is easy, writing robust, reliable functions can be hard...
#' 
#' 
#' ## Logical values
#' 
#' R also has standard conditional tests to generate `TRUE` or `FALSE` values (which also behave as `0`s and `1`s.  These are often useful for filtering data (e.g. identify all values greater than 5).  The logical operators are `<`, `<=`, `>`, `>=`, `==` for exact equality and `!=` for inequality.
#' 
## -----------------------------------------------------------------------------
  x

  x3 > 75
 
  x3 == 40
 
  x3 >   15

#' 
#' 
#' And you can perform operations on those results:
## -----------------------------------------------------------------------------
sum(x3>15,na.rm=T)

#' 
#' or save the results as variables:
## -----------------------------------------------------------------------------
result =  x3 >  3
result

#' 
#' <div class="well">
#' Define a function that counts how many values in a vector are less than or equal (`<=`) to 12.  
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo3">Show Solution</button>
#' <div id="demo3" class="collapse">
#' 

#' Try it:
## -----------------------------------------------------------------------------
x3
mycount(x3)

#' oops!
#' 

#' Try it:
## -----------------------------------------------------------------------------
x3
mycount(x3)

#' 
#' Nice!
#' </div>
#' </div>
#' 
#' 
#' # Generating Data
#' 
#' There are many ways to generate data in R such as sequences:
## -----------------------------------------------------------------------------
seq(from=0, to=1, by=0.25)

#' and random numbers that follow a statistical distribution (such as the normal):
#' 
## -----------------------------------------------------------------------------
a=rnorm(100,mean=0,sd=10)

#' 
#' 
#' Let's visualize those values in a histogram:
## ----fig.height=3-------------------------------------------------------------
hist(a)

#' 
#' We'll cover much more sophisticated graphics later...
#' 
#' # Data Types
#' 
#' ## Matrices
#' You can also use matrices (2-dimensional arrays of numbers):
## -----------------------------------------------------------------------------
y=matrix(1:9,ncol=3)
y

#' 
#' 
#' Matrices behave much like vectors:
## -----------------------------------------------------------------------------
y+2

#' 
#' 
#' and have 2-dimensional indexing:
## -----------------------------------------------------------------------------
y[2,3]

#' 
#' <div class="well">
#' Create a 3x3 matrix full of random numbers.  Hint: `rnorm(5)` will generate 5 random numbers
#' 
#' <button data-toggle="collapse" class="btn btn-primary btn-sm round" data-target="#demo4">Show Solution</button>
#' <div id="demo4" class="collapse">
#' 

#' </div>
#' </div>
#' 
#' ## Data Frames
#' Data frames are similar to matrices, but more flexible.  Matrices must be all the same type (e.g. all numbers), while a data frame can include multiple data types (e.g. text, factors, numbers). Dataframes are commonly used when doing statistical modeling in R.  
#' 
## -----------------------------------------------------------------------------
data = data.frame( x = c(11,12,14),
                   y = c("a","b","b"),
                   z = c(T,F,T))
data

#' 
#' 
#' You can subset in several ways
## -----------------------------------------------------------------------------
mean(data$x)

mean(data[["x"]])

mean(data[,1])

#' 
#' # Loading Packages
#' 
#' For installed packages:  `library(packagename)`.
#' 
#' New packages: `install.packages()` or use the package manager. 
#' 
## ----message=F,warning=FALSE--------------------------------------------------
library(ggplot2)

#' 
#' > R may ask you to choose a CRAN mirror. CRAN is the distributed network of servers that provides access to R's software.  It doesn't really matter which you chose, but closer ones are likely to be faster.  From RStudio, you can select the mirror under Tools→Options or just wait until it asks you.
#' 
#' 
#' If you don't have the packages above, install them in the package manager or by running `install.packages("raster")`.
#' 
#' 
#' # Today's task
#' 
#' Now [complete the first task here](CS_01.html) by yourself or in small groups.
