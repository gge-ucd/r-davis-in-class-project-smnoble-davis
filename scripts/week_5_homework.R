#Question 1
##Create a tibble named surveys from the portal_data_joined.csv file. 
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
## how many plot types are there?
plot_types <- unique(surveys$plot_type)
plot_types

##pivot wider with plot_type values as a columns, each row a genus, and values as mean hindfoot length for that genus and plot type
surveys_wide <- surveys %>% 
  group_by(plot_type, genus) %>% 
  filter(!is.na(hindfoot_length)) %>% 
  summarize(mean_h_length = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_h_length) %>% 
  arrange(desc(Control))

surveys_wide <- surveys %>% 
  group_by(plot_type, genus) %>% 
  summarize(mean_h_length = mean(hindfoot_length, na.rm = TRUE)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_h_length) %>% 
  arrange(desc(Control))

##not sure why the two above give me different results...

#Question 2
## new column and weight category variable
## finding first and third quartile
summary(surveys$weight)

#1st quartile = 20
#3rd quartile = 48

surveys_new <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_cat = ifelse(weight<=20, "small", ifelse(weight>=48, "large", ifelse(weight<48 & weight>20, "medium", "NA"))))

surveys_new2 <- surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_cat = case_when(weight<=20 ~ "small",
                                weight>=48 ~ "large",
                                weight<48 & weight>20 ~ "medium"))

#changing the arguments to see something happen with the NAs? idk not sure what is being asked here
surveys_new <- surveys %>% 
  mutate(weight_cat = ifelse(weight<=20, "small", ifelse(weight>=48, "large", ifelse(weight<48 & weight>20, "medium", "NA"))))
         