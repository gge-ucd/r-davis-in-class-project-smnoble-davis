library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

gapminder_pop <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  filter(year == 2002 | year == 2007) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(change = `2007` - `2002`) %>% 
  arrange(change) %>% 
  filter(continent == "Africa" | continent == "Americas" | continent == "Asia" | continent == "Europe")

ggplot(gapminder_pop, aes(x= reorder(country, +change), y=change)) + geom_bar(stat="identity", aes(fill = continent)) + facet_wrap(~continent, scales = "free") + theme_bw() + scale_fill_brewer(palette="Dark2") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + theme(legend.position="none") + xlab("Country") + ylab("Change in population between 2002 and 2007")

