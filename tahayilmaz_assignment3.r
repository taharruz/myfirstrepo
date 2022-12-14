#Muhammed Taha Yilmaz - 2017556069
library(tidyverse)
set.seed(2017556069)

#Section 1
ty_func10<-function() {
  nums<-c(89,107,597,931,1083)
  i<-2
  prime<-c()
  non_prime<-c()
  
  for(x in nums) {
    if (x == 2) {
      prime<-c(prime,x)
    } else if (any(x %% 2:(x-1) == 0)) {
      non_prime<-c(non_prime,x)
      non_prime <- c(non_prime, paste0("["))
      while(x >= i){
        if(! x %% i) {
          non_prime <- c(non_prime, i)
          x <- x/i
          i <- i - 1
        }
        i <- i + 1
      }
      non_prime <- c(non_prime, paste0("]"))
      i<-2
    }
    else {
      prime<-c(prime,x)  }
  }
  
  cat("Prime numbers:", prime,"\n")
  cat("Non-prime numbers:", non_prime)
}
ty_func1()

#Section 2
ty_func2<-function(){
  words1 <- sample(sentences,6)
  words2 <-str_split(words1,boundary("word")) %>%
    simplify()
  words2<-tolower(words2)
  ty<-str_sort(words2)
  ty2<-ty[order(str_count(ty,"."))]
  ty3<-str_c(ty2, collapse =" ")
  ty3
}
ty_func2()
