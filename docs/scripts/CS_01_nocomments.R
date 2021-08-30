md_bullet(rmarkdown::metadata$reading)

data(iris)
kable(iris) %>%
  kable_styling() %>%
  scroll_box(width = "100%", height = "200px")

md_bullet(rmarkdown::metadata$tasks)
