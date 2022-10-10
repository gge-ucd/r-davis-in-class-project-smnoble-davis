surveys <- read.csv("data/portal_data_joined.csv")
surveys_base <- surveys[c(1:60),c("species_id", "weight", "plot_type")]
surveys_base$species_id <- as.factor(surveys_base$species_id)
surveys_base$plot_type <- as.factor(surveys_base$plot_type)
# a factor is different than a character because factors have pre-defined levels. Their value can only be one of those levels or NA. For a character, the value can be anything.
surveys_base <- na.omit(surveys_base)
challenge_base <-surveys_base[surveys_base$weight>150,]
