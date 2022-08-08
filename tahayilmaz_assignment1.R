#Muhammed Taha Y�lmaz - 2017556069
<<<<<<< .merge_file_a00772
#222
=======

>>>>>>> .merge_file_a10480

install.packages("tidyverse")


library("tidyverse")


starwars


#Answer 1
select(starwars, name, starships)
characterNames<-filter(starwars,starships !="character(0)")
select(characterNames, name)



#Answer 2
rankColor<-starwars %>%
  group_by(eye_color) %>%
  summarize(count=n())
arrange(rankColor,desc(count))



#Answer 3
notNA_age<-starwars %>%
  filter(!is.na(birth_year))
average_age<-notNA_age %>%
  group_by(species) %>%
  summarize(
    mean_birth=mean(birth_year))
age<-arrange(average_age,desc(mean_birth))
head(age,3)
age



#Answer 4
myCharacter<-rbind(starwars,c(name="Taha Yilmaz",height=178,mass=95.0,hair_color="black",
                              skin_color="white",eye_color="blue",birth_year=22.0,sex="male",
                              gender="masculine",homeworld="Tatooine",
                              species="Human", films="Return of the Jedi",
                              vehicles="character(0)", starships="character(1)"))
myCharacter$height<-as.integer(myCharacter$height)
myCharacter$mass<-as.double(myCharacter$mass)
myCharacter$birth_year<-as.double(myCharacter$birth_year)
tail(myCharacter, 1)



#Answer 5
myCharacter<-myCharacter %>%
  mutate(name,BMI=mass/((height/100)^2))

myCharacter<-myCharacter %>%
  mutate(name,BMI_categories = if_else(BMI>30, "obese",if_else(BMI>25,"overweight",if_else(BMI>18.5,"healthy","underweight"))))
select(myCharacter, name, BMI, BMI_categories)



#Answer 6
myCharacter<-na.omit(myCharacter)
ggplot(data=myCharacter, mapping = aes(y=birth_year, x=BMI_categories)) +
  geom_boxplot(data=filter(myCharacter, birth_year<100.0))



#Answer 7
ggplot(data=myCharacter, mapping=aes(x=birth_year,y=BMI))+
  geom_point()+
  geom_smooth()

ggplot(data=filter(myCharacter,birth_year<100 & BMI<100),
       mapping=aes(x=birth_year,y=BMI))+
  geom_point()+
  geom_smooth()

