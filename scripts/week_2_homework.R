set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

# Remove NAs
hw3 <- hw2[!is.na(hw2)]

#selecting numbers
prob1 <- hw3[hw3>=14 & hw3<=38]

#multiply by 3
times3 <- prob1*3

#add 10
plus10 <- times3+10

#selecting every other element
final <- plus10[c(TRUE, FALSE)]
