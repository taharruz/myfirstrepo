#Muhammed Taha Yilmaz - 2017556069
library(tidyverse)
set.seed(2017556069)

mydata <- read_csv2("C:/Users/mtaha/desktop/covid-data-20200.csv")
my_data<-mydata[sample(nrow(mydata), 1000),]
my_data

<<<<<<< HEAD
#Deneme 1
=======
#Deneme 2
>>>>>>> 21edbef98449765dc17f6cc4cff169b8f7e49e71

#Answer 1
answer1 <- my_data %>% group_by(location, month) %>% 
  summarize(
    min = min(new_cases,na.rm = TRUE),
    Q1 = quantile(new_cases, 0.25,na.rm = TRUE),
    Q2 = quantile(new_cases, 0.50,na.rm = TRUE),
    Q3 = quantile(new_cases, 0.75,na.rm = TRUE),
    max = max(new_cases,na.rm = TRUE)
    )
answer1


#Answer 2
answer2 <- my_data %>% group_by(location) %>%
  summarize(
    max_case = max(new_cases), 
    max_death = max(new_deaths, na.rm = TRUE)
    )
answer2 <- arrange(answer2,desc(max_case))
answer2


#Answer 3
answer3 <- my_data %>% group_by(location,month) %>%
  summarize(
    Mean_of_dailycases = mean(new_cases, na.rm=TRUE)
  )
answer3 <-filter(answer3, Mean_of_dailycases == max(Mean_of_dailycases))
answer3


#Answer 4
ggplot(data=filter(my_data, location %in% c("United Kingdom","Italy","Switzerland"))) +
  geom_boxplot(mapping=aes(x=as.factor(month), y=new_cases, color=location))

