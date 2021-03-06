install.packages("here")
library(here)
here()

resume <- read.csv("resume.csv", stringsAsFactors = TRUE)#had to select stringsasfactors

dim(resume) #dimensions
head(resume) #first few rows
summary(resume) #summary--df need to contain factors

race.call.tab <- table(race = resume$race, call = resume$call)
race.call.tab
addmargins(race.call.tab)

###overall callback rate: callbacks/sample size
sum(race.call.tab[ , 2]) / nrow(resume)

### callbacks for black applicants
race.call.tab[1, 2] / sum(race.call.tab[1, ])

### callbacks for white applicants
race.call.tab[2, 2] / sum(race.call.tab[2, ])


race.call.tab[1, ]
race.call.tab[, 2]

mean(resume$call)
x <- c(3, 2, 1, -2, -1)
mean(x)
sum(x)


TF1 <- c(TRUE, FALSE, FALSE)
TF2 <- c(TRUE, FALSE, TRUE)
TF1 | TF2
TF1 & TF2

4 > 3
"Hello" == "hello"
"Hello" != "hello"

(x > 0) & (x <= 2)

(x > 2) | (x <= -1)

x.int <- (x > 0) & (x <= 2)
x.int

mean(x.int)
sum(x.int)


### subsetting
### calback for black-sounding names

mean(resume$call[resume$race == "black"])


## race of first 5 obs
resume$race[1:5]
(resume$race == "black") [1:5]


dim(resume)
resumeB <- resume[resume$race == "black", ]
dim(resumeB)
mean(resumeB$call)

### using subset function
resumeBf <- subset(resume, select = c("call", "firstname") , subset = (race == "black" & sex == "female"))
head(resumeBf)

###alt syntax
resumeBf <- resume[resume$race == "black" & resume$sex == "female", c("call", "firstname")]

resumeBm <- resume[resume$race == "black" & resume$sex == "male", c("call", "firstname")]

resumeWf <- resume[resume$race == "white" & resume$sex == "female", c("call", "firstname")]

resumeWm <- resume[resume$race == "white" & resume$sex == "male", c("call", "firstname")]


###racial gaps
mean(resumeWf$call) - mean(resumeBf$call)

mean(resumeWm$call) - mean(resumeBm$call)


###Conditional Statements
resume$BlackFemale <- ifelse(resume$race == "black" & resume$sex == "female", 1, 0)

table(race = resume$race, sex = resume$sex, BlackFemale = resume$BlackFemale)

### factor variables

resume$type <- NA
resume$type[resume$race == "black" & resume$sex == "female"] <- "BlackFemale"
resume$type[resume$race == "black" & resume$sex == "male"] <- "BlackMale"
resume$type[resume$race == "white" & resume$sex == "female"] <- "WhiteFemale"
resume$type[resume$race == "white" & resume$sex == "male"] <- "WhiteMale"

class(resume$type)
resume$type <- as.factor(resume$type)
levels(resume$type)
table(resume$type)

tapply(resume$call, resume$type, mean)

### sort by name
##turn first name into a factor

resume$firstname <- as.factor(resume$firstname)
callback.name <- tapply(resume$call, resume$firstname, mean)
sort(callback.name)


###socialpressure example

social <- read.csv("social.csv", stringsAsFactors = TRUE)
summary(social)

##turnout for each group
tapply(social$primary2006, social$messages, mean)

### turnout for control group
mean(social$primary2006[social$messages == "Control"])


###subtract control group from each of the others

tapply(social$primary2006, social$messages, mean) - mean(social$primary2006[social$messages == "Control"])

###testing against pretreatment variables 
social$age <- 2006 - social$yearofbirth #creating an age variable
tapply(social$age, social$messages, mean)

tapply(social$primary2004, social$messages, mean)

tapply(social$hhsize, social$messages, mean)

######minimum wage example

minwage <- read.csv("minwage.csv", stringsAsFactors = TRUE)
summary(minwage)

###subsetting data into two tables

minwageNJ <- subset(minwage, subset = (location != "PA"))
minwagePA <- subset(minwage, subset = (location == "PA"))

mean(minwageNJ$wageBefore < 5.05)
mean(minwageNJ$wageAfter < 5.05)
mean(minwagePA$wageBefore < 5.05)
mean(minwagePA$wageAfter < 5.05)


###create a variable from proportion of fulltime employees in NJ and PA
minwageNJ$fullPropAfter <- minwageNJ$fullAfter / (minwageNJ$fullAfter + minwageNJ$partAfter)
minwagePA$fullPropAfter <- minwagePA$fullAfter / (minwagePA$fullAfter + minwagePA$partAfter)

mean(minwageNJ$fullPropAfter) - mean(minwagePA$fullPropAfter)


###confounding variables and statistical control

prop.table(table(minwageNJ$chain))
prop.table(table(minwagePA$chain))

minwageNJ.bk <- subset(minwageNJ, subset = (chain == "burgerking"))
minwagePA.bk <- subset(minwagePA, subset = (chain == "burgerking"))

mean(minwageNJ.bk$fullPropAfter) - mean(minwagePA.bk$fullPropAfter)

##location as confounding variable?

minwage.bk.subset <-  subset(minwageNJ.bk, subset = ((location != "shoreNJ") & (location != "centralNJ")))
mean(minwage.bk.subset$fullPropAfter) - mean(minwagePA.bk$fullPropAfter)


### before-and-after design
##f/t prop in prev period
minwageNJ$fullPropBefore <- minwageNJ$fullBefore / (minwageNJ$fullBefore + minwageNJ$partBefore)
NJdiff <- mean(minwageNJ$fullPropAfter) - mean(minwageNJ$fullPropBefore)
NJdiff


minwagePA$fullPropBefore <- minwagePA$fullBefore / (minwagePA$fullBefore + minwagePA$partBefore)
PAdiff <- mean(minwagePA$fullPropAfter) - mean(minwagePA$fullPropBefore)
PAdiff
NJdiff - PAdiff

###Descriptive statistics
##quantiles

median(minwageNJ$fullPropAfter) - median(minwagePA$fullPropAfter)
NJdiff.med <- median(minwageNJ$fullPropAfter) - median(minwageNJ$fullPropBefore)
NJdiff.med
PAdiff.med <- median(minwagePA$fullPropAfter) - median(minwagePA$fullPropBefore)
NJdiff.med - PAdiff.med

summary(minwageNJ$wageBefore)
summary(minwageNJ$wageAfter)
IQR(minwageNJ$wageBefore)
IQR(minwageNJ$wageAfter)

###other quantiles
##deciles
quantile(minwageNJ$wageBefore, probs = seq(from = 0, to = 1, by = 0.1))
quantile(minwageNJ$wageAfter, probs = seq(from = 0, to = 1, by = 0.1))


###standard deviation
##RMS -- root mean square
sqrt(mean((minwageNJ$fullPropAfter - minwageNJ$fullPropBefore)^2))
mean(minwageNJ$fullPropAfter - minwageNJ$fullPropBefore)

sd(minwageNJ$fullPropBefore)

sd(minwageNJ$fullPropAfter)

var(minwageNJ$fullPropBefore)
var(minwageNJ$fullPropAfter)   
