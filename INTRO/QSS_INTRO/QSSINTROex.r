##Exercise 1

turnout <- read.csv("turnout.csv")
dim(turnout) #dimensions
summary(turnout)
range(turnout$year) #range in years

##Calculate the turnout rate

turnout_rate1 <- (turnout$total / (turnout$VAP + turnout$overseas)) * 100 #calc with voting age pop
turnout_rate1

turnout_rate2 <- (turnout$total / (turnout$VEP + turnout$overseas)) * 100 #calc with eligible pop
turnout_rate2

compare1 <- turnout$ANES - turnout_rate1
summary(compare1)

compare2 <- turnout$ANES - turnout_rate2
summary(compare2)

turnout$ANES

