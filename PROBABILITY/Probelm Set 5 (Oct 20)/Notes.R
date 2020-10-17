library(tidyverse)

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
pnorm(mu + sigma, mean = mu, sd = sigma)










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


