## Going over the homework

library(tidyverse)
surveys <- read_csv('data/portal_data_joined.csv')
surveys <- surveys %>% filter(weight>30 & weight<60)
surveys %>% print(n=6)
surveys %>% 
  group_by(species_id, sex) %>% 
  summarize(max(weight, na.rm=TRUE))


biggest_critters <- surveys %>% 
  group_by(species_id, sex)

surveys %>% filter(weight>30&weight<60)

surveys %>%
  group_by(species_id,sex) %>%
  summarize(max(weight,na.rm = T))

surveys %>%
  group_by(species_id,sex) %>%
  filter(!is.na(weight)) %>%
  summarize(max(weight))

rowSums(is.na(surveys))
colSums(is.na(surveys))

?tally
surveys %>% group_by(species_id) %>% filter(is.na(weight))

surveys %>% filter(is.na(weight)) %>% group_by(species)

surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally(sort=TRUE)

##Conditional statements (if,else)
#case,when function
#both the same thing... if this thing is observed, do this thing

ifelse(surveys$year == 1980, "year is 1980!", "year is not 1980")
table(ifelse(surveys$year == 1980, "year is 1980!", "year is not 1980"))

#the difference between case,when and if,else is you can assign multiple condition in case,when

#Join functions --
## join_function(x=data1(left), y=data2(right), by = join column)
tail <- read_csv("data/tail_length.csv")
surveysNL <- surveys %>% 
  filter(species_id=="NL")
surveysNL_tail_left <- surveysNL %>% 
  left_join(surveysNL, tail, by = "record_id")
nrow(surveysNL_tail_left) #has the length of surveys data
# why? tails is appended to "master", which we said is left

surveysNL_tail_right <- right_join(surveysNL, tail, by = "record_id")
nrow(surveysNL_tail_right)

data %>% 
  filter %>% 
  select %>% 
  mutate %>% 
  left_join(newdat) #baseline in left
  right_join(newdat) #bring in new data baseline all in a pipe and baseline is right




  # Pivot functions ----
  ## pivot_wider(data, names_from = the column that has what will become the new column name,
  ##                   values_from = the column that has the values to fill out the cells)
  ## pivot_longer(data, cols = columns to lengthen (i.e. take all these and stack them),
  ##                    names_to = create a new column name to call the column
  ##                                 names from the columns in the cols argument,
  ##                    values_to = create a new column name to call the values in
  ##                                the columns from the columns in the cols argument
  
  
  surveys2 <- surveys %>% 
    group_by(plot_id, year) %>% 
    summarize(genus_count = n_distinct(genus)) %>% 
    pivot_wider(names_from = year, values_from = genus_count)
  surveys2
    
    
  mutate(gen_per = n_distinct())
  new_surveys <- pivot_wider(surveys, names_from = "year", values_from = )
  
  
