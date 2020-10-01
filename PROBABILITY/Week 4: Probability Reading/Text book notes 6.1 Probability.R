###Solving the birthday problem
birthday <- function(k){
  logdenom <- k * log(365) + lfactorial(365 - k) # log denominator
  lognumer <- lfactorial(365) #log numerator
  pr <- 1 - exp(lognumer - logdenom)
  return(pr)
}
 
k <- 1:50
bday <- birthday(k)
names(bday) <- k
plot(k, bday, xlab = "Number of People", xlim = c(0, 50), ylim = c(0, 1), 
     ylab = "probability that at least two\n people have the same birthday")
abline(h = 0.5)
bday[20:25]

## Sampling with and without replacement
k <- 23
sims <- 1000000
event <- 0
for (i in 1:sims) {
  days <- sample(1:365, k, replace = TRUE)
  days.unique <- unique(days)
  if(length(days.unique) < k) {
    event <- event + 1
  }
}
  
answer <- event / sims
answer

#calculating combinations
choose(84, 6)

library(swirl)
swirl()

perms <- function(n, k){
  out <- factorial(n) / factorial(n - k)
  return(out)
}

perms(5, 1) / 
  swirl()







