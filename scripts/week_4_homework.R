library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
surveys_filt <- surveys %>% 
  filter(weight>30 & weight<60) 
surveys_filt[1:6,]
biggest_critters <- surveys %>% 
  group_by(species_id, sex, .add=TRUE) %>% 
  summarize(weight_max = max(weight, na.rm = TRUE)) %>% 
  arrange(desc(weight_max))
biggest_critters
surveys_na <- surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally(sort=TRUE)
surveys_na
surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex, .add=TRUE) %>% 
  mutate(avg_weight = mean(weight)) %>% 
  select(species_id, sex, weight, avg_weight)
surveys_avg_weight
surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)
surveys_avg_weight
