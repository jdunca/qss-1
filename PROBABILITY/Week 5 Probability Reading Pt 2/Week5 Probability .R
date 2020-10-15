library(tidyverse)

FLV <- read_csv("FLVoters.csv")
dim(FLV)

FLV <- na.omit(FLV)
dim(FLV)

margin.race <- prop.table(table(FLV$race))
margin.race

margin.gender <- prop.table(table(FLV$gender))
margin.gender

prop.table(table(FLV$race[FLV$gender == "f"]))

joint.p <- prop.table(table(race = FLV$race, gender = FLV$gender))
rowSums(joint.p)
colSums(joint.p)

FLV$age_grp <- NA
FLV$age_grp[FLV$age <= 20] <- 1
FLV$age_grp[FLV$age > 20 & FLV$age <= 40] <- 2
FLV$age_grp[FLV$age > 40 & FLV$age <= 60] <- 3
FLV$age_grp[FLV$age > 60] <- 4

joint3 <- with(FLV, prop.table(table(race = race, age.group = age_grp, gender = gender)))
joint3               

margin.age <- prop.table(table(FLV$age_grp))
margin.age

joint3["black", 4, "f"] /margin.age[4]


joint2 <- with(FLV, prop.table(table(age.group = age_grp, gender = gender)))   
joint2

joint2[4, "f"]
joint3["black", 4, "f"]/ joint2[4, "f"]

plot(c(margin.race * margin.gender["f"]), c(joint.p[, "f"]), 
     xlim = c(0, 0.4), ylim = c(0, 0.4), 
     xlab = "P(race) * P(female)", ylab = "P(race and female)")
abline(0, 1)

par(mfrow= c(1, 2))
plot(c(joint3[, 4, "f"]), 
     margin.race * margin.age[4] * margin.gender["f"], 
     xlim = c(0, 0.3), ylim = c(0, 0.3), main = "Joint Independence", 
     xlab = "P(race and above 60 | female)", ylab = "P(race | female) * P(above 60 | female)")
abline(0,1)
plot(c(joint3[, 4, "f"]) / margin.gender["f"], 
  (joint.p[, "f"] / margin.gender["f"]) *
   (joint2[4, "f"] / margin.gender["f"]),
     xlim = c(0, 0.3), ylim = c(0, 0.3), main = "Marginal independence", 
     xlab = "P(race and above 60 | female)", 
     ylab = "P (race | female) * P (above 60 | female)")
abline(0, 1)

sims <- 1000
doors <- c("goat", "goat", "car")
result.switch <- result.noswitch <- rep(NA, sims)

for (i in 1:sims) {
  first <- sample(1:3, size = 1)
  result.noswitch[i] <- doors[first]
  
  remain <- doors[-first]
  if (doors[first] == "car")
    monty <- sample(1:2, size = 1)
  else
    monty <- (1:2)[remain == "goat"]
  result.switch[i] <- remain[-monty]
}

mean(result.noswitch == "car")
mean(result.switch == "car")

cnames <- read.csv("names.csv")
dim(cnames)


FLV <- FLV[!is.na(match (FLV$surname, cnames$surname)), ]
dim(FLV)

white <- subset(FLV, race == "white")
w.indx <- match (white$surname, cnames$surname)
head(w.indx)
vars <- c("pctwhite", "pctblack", "pctpi", "pcthisp", "pctothers")
mean(apply(cnames[w.indx, vars], 1, max) == cnames$pctwhite[w.indx])

library(swirl)
swirl()
jamie
3




