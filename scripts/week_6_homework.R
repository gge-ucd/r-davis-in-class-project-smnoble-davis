library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

gapminder_lifeexp <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_lifeexp = mean(lifeExp))

ggplot(gapminder_lifeexp, aes(x=year, y=mean_lifeexp, color=continent)) + geom_point() + geom_path() +theme_bw()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

##the scale_x_log10() line of code makes the x-axis logarithmic
##the geom_smooth() line of code adds a liner trend line on top of the data

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

gapminder %>% 
  filter(country == "Brazil" | country =="China", "El Salvador", "Niger", "United States") %>% 
ggplot(gapminder, aes(x=country, y = lifeExp )) +
  geom_boxplot()

select_countries <- gapminder %>% 
  filter(country == "Brazil" | country =="China"| country =="El Salvador"| country =="Niger"| country =="United States")
  ggplot(select_countries, aes(x=country, y = lifeExp )) +
  geom_boxplot() +
    geom_jitter() +
    theme_bw() +
    xlab("Country")+
    ylab("Life Expectancy") +
    ggtitle("Life Expectancy of Five Countries")
