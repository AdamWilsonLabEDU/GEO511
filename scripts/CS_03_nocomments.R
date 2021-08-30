md_bullet(rmarkdown::metadata$reading)

md_bullet(rmarkdown::metadata$tasks)

library(gapminder)
library(dplyr)
library(ggplot2)
library(scales)

gapminder <- gapminder %>% filter(country != "Kuwait")
gapminder_continent <- gapminder %>% 
                          group_by(continent, year) %>% 
                          summarise(gdpPercap = weighted.mean(x = gdpPercap, w = pop), 
                                    pop = sum(as.numeric(pop)))

p1=ggplot(data = gapminder, aes(color = continent, x = lifeExp, y = gdpPercap, size = pop/100000)) + 
  geom_point() + 
  facet_wrap(~year, nrow = 1) + 
  scale_y_continuous(trans = "sqrt") +
  theme_bw() + 
  labs(x = "Life Expectancy", y = "GDP per capita", size = "Population (100k)", color = "continent")

p2=ggplot(data = gapminder, aes(color = continent, x = year, y = gdpPercap)) + 
  geom_point(aes(size = pop/100000)) + 
  geom_line(aes(group = country)) +
  geom_point(data = gapminder_continent, color = "black", aes(size = pop/100000)) +
  geom_line(data = gapminder_continent, color = "black") +
  facet_wrap(~continent, nrow = 1) +
  theme_bw() + 
  labs(x = "Year", y = "GDP per capita", color = "Continent", size = "Population (100k)")
p1
p2
# ggsave(file="week_04/case_study/plot1.png",plot=p1,width = 15,height=8)
# ggsave(file="week_04/case_study/plot2.png",plot=p2,width = 15,height=8)
