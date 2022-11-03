#homework review
summary_table <- surveys %>% 
  group_by(genus, plot_type) %>% 
  summarize(mean_hfl = mean(hindfoot_length, na.rm = TRUE))
summary_table
#no values exist at all for that combination of groups = NaN

surveys_wider <- summary_table %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hfl) %>% 
  arrange(Control)
surveys_wider

#ifelse and case_when
summary(surveys$weight)
surveys_cw <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20 ~ "small",
    weight>20 & weight<48 ~ "medium",
    T ~ "large"
  ))

surveys_cw %>% 
  group_by(weight_cat) %>% 
  summarize(min = min(weight, na.rm=TRUE),
            max = max(weight, na.rm=TRUE))

surveys_cw %>%
  filter(is.na(weight)) %>%
  select(weight, weight_cat) %>%
  head()

##ggplot stuff
# 3 parts of ggplot
#(1) ggplot(data = <DATA>, (2) mapping = aes (<Mappings>)) + (3) geom function

ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_boxplot()
#x = categorical, y = continuous
# you can layers geoms

ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_boxplot() +
  geom_point()

ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_boxplot() +
  geom_jitter()

#layer order matters
ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_jitter() +
  geom_boxplot()

#aesthetics are mobile!
ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length,
                       color=plot_type)) + 
  geom_jitter() +
  geom_boxplot()


ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_jitter() +
  geom_boxplot(aes(color=plot_type))

## Features that relate directly to the data go in the aes() function, all else are their own arguments within the geoms

ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_jitter() +
  geom_boxplot(aes(color="red"))

ggplot(surveys_cw, aes(x = weight_cat, y = 
                         hindfoot_length)) + 
  geom_jitter() +
  geom_boxplot(color="red")

surveys_box <- surveys %>% 
  filter(species_id == "NL" | species_id == "PF")

ggplot(surveys_box, aes(x = species_id, y = 
                         hindfoot_length)) + 
  geom_jitter(aes(color = as.factor(plot_id))) +
  geom_boxplot()

##below is not good, code doesn't work 
surveys %>% 
  filter(species_id == c("NL", "PF")) %>% 
  ggplot(aes(x=species_id,
             y = hindfoot_length)) +
  geom_jitter(aes(color = plot_type)) +
  geom_boxplot()

#this will work
surveys %>% 
  filter(species_id %in% c("NL", "PF")) %>% 
  ggplot(aes(x=species_id,
             y = hindfoot_length)) +
  geom_jitter(aes(color = plot_type)) +
  geom_boxplot()



library(tidyverse)
surveys_complete <- read_csv("data/portal_data_joined.csv") %>%
  filter(complete.cases(.))


yearly_counts <- surveys_complete %>%
  count(year, species_id)

head(yearly_counts)

g = ggplot(data = yearly_counts)
g + geom_point(aes(year, y =n)) +
  geom_path(aes(x=year, y=n, color = species_id))


geom_path(mapping = aes(x = year,y = n))
#grouped by species
ggplot(data = yearly_counts) +
  geom_path(mapping = aes(x = year,y = n,group = species_id))
# add color
ggplot(data = yearly_counts,mapping = aes(x = year,colour = species_id,
                                          y = n,group = species_id)) +
  geom_path() + geom_point()

# facetting
ggplot(data = yearly_counts) +
  geom_path(mapping = aes(x = year,y = n,group = species_id)) +
  facet_wrap(~species_id,scales = "free_y")

# facetting
ggplot(data = yearly_counts) +
  geom_path(mapping = aes(x = year,y = n,group = species_id)) +
  facet_wrap(~species_id,scales = "free_y")

ggplot(data = yearly_counts) +
  geom_path(aes(x = year,y = n,colour = species_id)) +
  facet_wrap(~species_id,ncol = 3)

ggplot(data = yearly_counts2) +
  geom_path(aes(x = year,y = n,colour = species_id)) +
  facet_wrap(sex~species_id,nrow = 2)