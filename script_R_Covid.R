rm(list=ls())

install.packages("survival")
install.packages("lattice")
install.packages("ggplot2")
installed.packages("Formula")
install.packages("Hmisc")

library(Hmisc)

data <- read.csv("C:/Users/Kseni/OneDrive/Рабочий стол/R_COVID/COVID19_line_list_data.csv")
describe(data)
str(data)

#I tried to clean up the death column
data$death_dummy <- as.integer(data$death !=0)


#calc death rate
sum(data$death_dummy) / nrow(data)

#age btw the dead and alive
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
#calc the average age, ignore the NA 
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE) 

t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.95)


#GENDER
men = subset(data, gender == "male")
women = subset(data, gender == "female")
#calc the average gender of death=====, ignore the NA 
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE) 

t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.95)


