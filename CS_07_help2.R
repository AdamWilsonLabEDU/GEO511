# Create a robust function to calculate the standard error of a vector
# The function name will be calc_se with an argument x for the vector, with 
# an argument to remove missing values called na.rm, and a default value of TRUE
# The function should have type checking to only allow numeric vectors

# ```{r}
# calc_se=function(x,na.rm=T){
#   if(!is.numeric(x)){
#     stop("Input must be a numeric vector")
#   }

#   if(na.rm){
#     x=na.omit(x)
#   }
#   sqrt(var(x)/length(x))
# }


# # Test the function
 x=c(3,6,12,89)
 calc_se(x)


