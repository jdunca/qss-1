library(tidyverse)
pres08 <- read.csv("pres08.csv")

dunif(0.5, min = 0, max = 1)
punif(1, min = -2, max = 2)

###p282 
sims <- 1000
p <- 0.5
x <- runif(sims, min = 0, max = 1)
head(x)

y <- as.integer(x <= p)
head(y)

mean(y)


###p 283
dbinom(2, size = 3, prob = 0.5)
pbinom(1, size = 3, prob = 0.5)

###p289
pnorm(1) - pnorm(-1) # plus minus 1 standard devaition from mean (0 by default).

pnorm(2) - pnorm(-2) # plus minus 2 standard deviations from mean 

mu <- 5
sigma <- 2
pnorm(mu + sigma, mean = mu, sd = sigma)- pnorm(mu - sigma, mean = mu, sd = sigma)

pnorm(mu +2*sigma, mean = mu, sd = sigma) - pnorm(mu - 2*sigma, mean = mu, sd = sigma)

### calculating probability for Obama win and making a histogram
pres08$p <- pres08$Obama / (pres08$Obama + pres08$McCain)
nstates <- nrow(pres08)
n <- 1000
sims <- 10000
Obama.ev <- rep(NA, sims)
for (i in 1:sims) {
  draws <- rbinom(nstates, size = n, prob = pres08$p)
  Obama.ev[i]<-  sum(pres08$EV[draws > n / 2])
}

hist(Obama.ev, freq = F, main = "Prediction of election outcome",
     xlab = "Obama's Electoral College votes")
abline(v = 364, col = "blue")

#### doing it analytically
mean(Obama.ev)
##probability of a binomial random variable taking more than n/2 votes
sum (pres08$EV * pbinom(n/2, size = n, prob = pres08$p, lower.tail = F))

#approximate variance using MC draws
var(Obama.ev)

#theoretical variance
pres08$pb <- pbinom(n/2, size = n, prob = pres08$p, lower.tail = F)
V <- sum (pres08$pb * (1- pres08$pb) * pres08$EV^2)
V

#MC standard dev
sd(Obama.ev)

#theoretical SD
sqrt(V)


##law of large numbers
sims <- 1000
x.binom <- rbinom(sims, p = 0.2, size = 10)
mean.binom <- cumsum(x.binom) / 1:sims
x.unif <- runif(sims)
mean.unif <- cumsum(x.unif) / 1:sims

plot(1:sims, mean.binom, type = "l", ylim = c(1, 3),
     xlab = "Sample size", ylab = "sample mean", main = "Binomial(10, 0.2)")
abline(h = 2, lty = "dashed")

plot(1:sims, mean.unif, type = "l", ylim = c(0, 1), 
     xlab = "Sample size", ylab = "Sample mean", main = "Uniform(0, 1)")
abline(h = 0.5, lty = "dashed")



#### TUTORIAL

data("USGini", package = "qss")
data("turnout", package = "qss")
combined.data <- merge(USGini, turnout, by="year")
head(combined.data)

combined.data2 <- dplyr::left_join(USGini, turnout, by="year")
head

qnorm(0.95, mean=60, sd=20)

pnorm(40, mean = 60, sd = 20)


nd <- rnorm(10000, mean = 60, sd = 20)
hist(nd, breaks = 100)

ud <- sample(c("A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D"), 1000, replace=TRUE)
barplot(table(ud), main = "Uniform Distribution", xlab = "")

nd <- rnorm(1000)
cut.values <- c(-Inf, seq(-2, 2, by=0.5), Inf)
nd.final <- cut(nd, breaks = cut.values)
barplot(table(as.numeric(nd.final)), main = "Normal Distribution", names.arg=c("A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D"))

qqplot(as.numeric(nd.final), as.numeric(as.factor(ud)))
abline(a = 0, b = 1)


as.numeric(ud)

qqplot(as.numeric(nd.final), as.numeric(ud))
abline(a = 0, b = 1)


qqplot(as.numeric(nd.final), as.numeric(nd.final))
abline(a = 0, b = 1)



sims <- 10000



for (i in 1:sims)
  
  rnorm(10000, )



#### Failed

nov3pred <- prediction %>%
  filter(day == "2008-11-03") %>%
  mutate(ppd = PriceD / 100,
         ppr = PriceR / 100)

nov3pred$state.name <- nov3pred$statename

nov3.c <- merge(nov3pred, result, by = "state.name")

nov3.rel <- nov3.c %>% 
  select(state.name, ppd, Obama, McCain, EV)


nstates <- nrow(nov3.rel)
n <- 1000
sims <- 10000
obama.ev.pred <- rep(NA, sims)
for (i in 1:sims){
  draws <- rbinom(nstates, size = n, prob = nov3.rel$ppd)
  obama.ev.pred[i]<-  sum(nov3.rel$EV[draws > n / 2])
  
sum(pred08.rel$EV * pbinom(n/2, size = n, prob = pred08.rel$probama, lower.tail = F))
mean(predobama.ev)  
