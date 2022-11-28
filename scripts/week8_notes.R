library(lubridate)

test_date <- as.Date('2020-01-01')
test_date
class(test_date)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")
#notice we have dates across two years here

as.Date(sample_dates_1)

sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", "01-01-2019", "02-18-2019")

sample_dates_3 <- as.Date(sample_dates_2, format = "%m-%d-%Y")
sample_dates_3

tm1 <- as.POSIXct("2016-07-24 23:55:26")
tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")

tm3 <- as.POSIXct("2016-07-24 23:55:26", tz = 'GMT')
tm3
class(tm3)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")
ymd()
dmy('23-02-2020')
mdy()
ydm()

sample_dates_lub <- ymd(sample_dates_1)
day(sample_dates_lub)
month(sample_dates_lub)

sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", "01-01-2019", "02-18-2019")
samples_dates_lub2 <- mdy(sample_dates_2)

library(lubridate)
library(dplyr)
library(readr)

# read in some data and skip header lines
nfy1 <- read_csv("data/2015_NFY_solinst.csv", skip = 12)
head(nfy1) #R tried to guess for you that the first column was a date and the second a time




#Function writing
##Temperature conversion: F to Kelvin

((75-32)* (5/9))+273.15
((46-32)* (5/9))+273.15
((49-32)* (5/9))+273.15

#function 'function()' for function writing
#what do we change everytime? The farenheit number
#step 1: identify what changes - this is your argument
#step 2: remove it from the cody body, and place it in the function function

((tempF-32)* (5/9))+273.15
F_to_K <- function(tempF){
  K<- ((tempF-32)* (5/9))+273.15
  return(K)
  }
F_to_K(75)
F_to_K(46)
F_to_K(49)

##pass by value = where is K? is it like a "ghost" object, does not save into the environment. This is why you need to use the return() function

##plotting example
surveys <- read_csv("data/portal_data_joined.csv")
table(surveys$species_id)
surveys %>% 
  filter(species_id == "PE" & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y =hindfoot_length)) +
  geom_jitter(alpha=0.5) +
  labs(x="Weight", y = "Hindfoot Length", title = "PE weight x hindfoot") +
  theme_bw()


surveys %>% 
  filter(species_id == "PL" & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y =hindfoot_length)) +
  geom_jitter(alpha=0.5) +
  labs(x="Weight", y = "Hindfoot Length", title = "PL weight x hindfoot") +
  theme_bw()

surveys %>% 
  filter(species_id == "SH" & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y =hindfoot_length)) +
  geom_jitter(alpha=0.5) +
  labs(x="Weight", y = "Hindfoot Length", title = "SH weight x hindfoot") +
  theme_bw()



plot_fx <- function(SPECIES, PLOTTITLE){
  plot <- surveys %>% 
    filter(species_id == SPECIES & !is.na(weight) & !is.na(hindfoot_length)) %>% 
    ggplot(aes(x = weight, y =hindfoot_length)) +
    geom_jitter(alpha=0.5) +
    labs(x="Weight", y = "Hindfoot Length", title = PLOTTITLE) +
    theme_bw()
  print(plot)
}

plot_fx("PL", "PL weightxhindfoot")

surveys %>% 
  filter(species_id == SPECIES & !is.na(weight) & !is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y =hindfoot_length)) +
  geom_jitter(alpha=0.5) +
  labs(x="Weight", y = "Hindfoot Length", title = PLOTTITLE) +
  theme_bw()


