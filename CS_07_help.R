# Generate a dataset
# make a scatterplot
# summarize a linear model

# Short script to illustrate copilot in coding
library(tidyverse)

data=tibble(
  x=rnorm(10),
  y=3*x+15+rnorm(10))


ggplot(data,aes(x=x,y=y))+
  geom_point()+
  geom_smooth(method="lm")







