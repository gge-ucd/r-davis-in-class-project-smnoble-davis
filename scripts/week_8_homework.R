##load in data
load(file='data/mauna_loa_met_2001_minute.rda')

##time zone = UTC
##missing values 
## wind direction = -999 
## wind speed = -999.9 
#wind steadiness = -9
##barometric pressure = -999.90
##temperature = -999.9
##humidity = -99
##precipitation = -99

mloa_2001 <- mloa_2001 %>% 
  filter(rel_humid != -99) %>% 
  filter(temp_C_2m != -999.9) %>% 
  filter(windSpeed_m_s != -999.9) %>% 
  mutate(datetime = paste(year, "-", month, "-", day, "-", hour24, "-", min)) %>% 
  mutate(datetime = ymd_hm(datetime)) %>% 
  mutate(datetimeLocal = with_tz(datetime, tzone = "Pacific/Honolulu")) %>% 
  month(datetimeLocal)

col_date 
test <- mloa_2001 %>% 
  mutate(month_loc = month(datetimeLocal), hour_loc = hour(datetimeLocal)) %>% 
  group_by(month_loc, hour_loc) %>% 
  summarize(temp_mean = mean(temp_C_2m)) %>% 
  ggplot(test, mapping = aes(x=month_loc, y=temp_mean)) + geom_point(aes(color = hour_loc))

## can't get my plot to show up, not sure why
                                                           