1+1 #cmd+return to run in the console
log(2)
x <- 1
x <- "string of words"
x <- c(3,5,7,20)
log(x)
my_name <- "Shaela"
my_name

#rm(object) to delete the object

ls()
rm(ls())
rm(ls(all))
?ls()
rm(ls(all.names = TRUE))
?rm()
rm(list=ls()) # ls generates a character vector of objects to be removed, satisfies the "list" argument

getwd()
list.files(path = "")
list.files(path = "/Users/shaelanoble/Desktop/R-DAVIS-2022/r-davis-in-class-project-smnoble-davis/data") #ABSOLUTE file path
list.files(path = "data") # RELATIVE file path

# adding a script folder
dir.create("scripts")
