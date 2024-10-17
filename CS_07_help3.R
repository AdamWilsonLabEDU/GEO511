

library(dplyr)

mtcars

mtcars |> 
  group_by(cyl) |> 
  summarize(
    mean = mean(mpg),
    # add the standard error for mpg
    se = sd(mpg) / sqrt(n())
    
  )
