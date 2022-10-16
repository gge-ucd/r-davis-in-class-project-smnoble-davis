library(tidyverse)
hw_example <- select(surveys[1:5000,],species_id, weight, plot_type)
factor(surveys_base, levels = c("species_id", "plot_type")) #doesn't work

surveys_t <- read_csv("data/portal_data_joined.csv")
head(surveys_t)
class(surveys_t)
# select
surveys_t[, c("plot_id", "species_id", "weight")]
select(surveys_t, plot_id, species_id, weight)
# filter
surveys_1 <- surveys_t[surveys_t$year == 1995,]
surveys_t <- filter(surveys_t, year == 1995)
# not identical because different class
# asks if the two objects saved in memory are the same objects
# using the filter function maintains all special features w.i the tidyverse

# combine select and filter
surveys_2 <- surveys_t %>% 
  filter(year == 1995) %>% 
  select(plot_id, species_id, year)
surveys_2

# mutate = create new columns, many at a time, seperate by commas
colnames(surveys_t)
surveys_t <- surveys_t %>% 
  mutate(weight_length_ratio = weight/hindfoot_length,
         weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)
surveys_t
#group by
## group by signals our categories to summarize by
## summarize: what to do with those groupings

surveys_summary <- surveys_t %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length))
surveys_summary

# two ways to remove NAs
surveys_summary <- surveys_t %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length, na.rm = TRUE))
surveys_summary
# hindfoot length is all NAs so after it removes them, there is nothing left
surveys_summary <- surveys_t %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length)) %>% 
  na.omit()
surveys_summary
## do not put na.omit at the end, this removes the NAs from the final product
surveys_summary <- surveys_t %>% 
  na.omit() %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length))
surveys_summary
# this omits them at the beginning. Using na.omit can be bad sometimes. na.omit removes any row where there is an NA for any column. Use na.rm = TRUE

# summary functions: mean, median, min, max
## will not remove the NAs for you

surveys_challenge <- surveys_t %>% 
  group_by(year) %>% 
  summarize(max_weight = max(weight, na.rm=TRUE)) %>% 
  mutate(weight_kg = max_weight/1000) %>% 
  arrange(desc(weight_kg))
surveys_challenge
