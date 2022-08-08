#Muhammed Taha Yilmaz - 2017556069
library(tidyverse)
set.seed(2017556069)

#Answer 1
words1 <- sample(sentences,100)
words2 <-str_split(words1,boundary("word")) %>%
  simplify()
words2 <- unique(words2)
words2


#Answer 2
words2[str_detect(words2,"^a.+e$")]


#Answer 3
sum(str_count(words2,"[aeiou]")>3)
words2[str_count(words2,"[aeiou]")>3]

#Answer 4
new_data <- tibble(words2, longest=(str_length(words2)))
long <- arrange(new_data,desc(longest))
head(long,5)


#Answer 5
find_words<-c("age","any","day","exp","her","pro","the")
find_words2<-str_c(find_words, collapse = "|")
str_subset(words2,find_words2)
