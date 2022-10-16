#what does set.seed do? It makes it so the randomly generated numbers are the same every time
#run if is short for random uniform
#other ways of removing all NAs
na.omit(hw2)
hw2[complete.cases(hw2)]

surveys <- read.csv("data/portal_data_joined.csv")
View(surveys)
str(surveys)
unique(surveys$species)
length(unique(surveys$species))
table(surveys$species) #how many counts of each species there are
surveys[5,7] #5th row, 7th column
surveys[1:10, 1:10] #rows 1-10 and column 1-10
surveys[,"species_id"]
surveys$species
surveys$record_id #this is a vector
surveys$record_id[5] #get the 5th value in a vector
surveys_200 <- surveys[200,]
nrow(surveys)
surveys_last <- surveys[34786,]
34786/2
surveys_middle <- surveys[17393,]
repro_head <- surveys[c(1:6),]
repro_head
head(surveys)
