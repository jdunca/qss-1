library(tidyverse)
head(parlgov)

dim(table(parlgov$country))


parlgov$seatshare <- parlgov$seats / parlgov$seats_total
mean(parlgov$seatshare)

summary(parlgov$seatshare)

table(parlgov$halfdecade)

can2015 <- parlgov[parlgov$country == "Canada" &parlgov$year == 2015, ]


after2014 <- parlgov[parlgov$year > 2014, ]
vs.after2014 <- after2014[order (after2014$vote_share, decreasing = TRUE), ]

after2014$party_name = as.character(after2014$party_name)

aggdf <- aggregate(after2014, by = list(after2014$party_name, after2014$vote_share), FUN = sum, na.rm = TRUE)


u.elec <- unique(after2014$election_id) #put unique elction_ids integers
length(u.elec) #count unique entries

u.p_fam <- 
summary(after2014$party_family)

germany.2019 <- after2014[after2014$election_id == 1055, ]
drop_na(germany.2019)

names(u.p_fam) <- levels(germany.2019$party_family)


avg.perf <- function(df, levels(df$party_family)){
  s1.avg.perf <- for(i in levels(df$party_family))
    return(aggregate(s1.avg.perf, by = list(s1.avg.perf == TRUE), sum, na.rm = TRUE))
}

avg.perf <- function(df, parameter){
  s1.avg.perf <- ifelse(df$party_family == parameter, 1, 0 )
  return(aggregate(df$vote_share, by = list(s1.avg.perf == TRUE), sum, na.rm = TRUE))
}


avg.perf.all <- function(df, parameter){
  for(i in unique(df$party_family)){
    agg.perf <- aggregate(df$vote_share, by = list(df$party_family), sum, na.rm = TRUE)
    return(print(agg.perf[agg.perf$party_family == parameter]))
  }
}

avg.perf.all(germany.2019, "Conservative")

avg.perf <- function(df, parameter){
  for(i in unique(df$party_family)){
    avg.perf1 <- ifelse(df$party_family == parameter, 1, 0)
    out <- aggregate(df$vote_share, by = list(avg.perf1 == TRUE), sum, na.rm = FALSE)
    return(out)
  }
}

length(germany.2019$party_family)
length(germany.2019$vote_share)

avg.perf(germany.2019, "Conservative")
avg.perf.all(germany.2019)

rad.right <- parlgov[parlgov$party_family == "Right-wing" & parlgov$vote_share > 5, ]
rad.right <- na.omit(rad.right)

rad.right.tab <- table(rad.right$election_id, rad.right$halfdecade) #create a table 
barplot(rad.right.tab, main = "Party Elections where European Right Wing Parties Achived More than 5% of Votes", xlab = "Halfdecade", ylab = "Elections")

rad.right.sh <- rad.right[unique(rad.right$election_id), ]
rad.right.tab <- table(rad.right.sh$election_id, rad.right.sh$halfdecade)
barplot(rad.right.tab, main = "Elections where European Right Wing Parties Achived More than 5% of Votes", xlab = "Halfdecade", ylab = "Elections") 


fam.elec.plot <- function(df, parameter){
  fam.elec_a <- df[df$party_family == parameter & df$vote_share >5, ]
  fam.elec_b <- na.omit(fam.elec_a)
  fam.elec_un <- fam.elec_b[unique(fam.elec_b$election_id), ]
  fam.elec_tab <- table(fam.elec_un$election_id, fam.elec_un$halfdecade)
  return(barplot(fam.elec_tab, main = "Elections Where [Parameter] Parties Achieved > 5% of Votes", xlab = "Halfdecade", ylab = "Elections"))
}

fam.elec.plot(parlgov, "Right-wing")
fam.elec.plot(parlgov, "Communist/Socialist")
fam.elec.plot(parlgov, "Conservative")




fam.elec.plot_norm <- function(df, parameter){ # function takes a data.frame (parlgov) and a parameter (party_family)
  fam.elec_a <- df[df$party_family == parameter & df$vote_share > 5, ] #subsets the dataframe by the parameter, excluding instances with a vote share less than 5%
  fam.elec_b <- na.omit(fam.elec_a) #omits NAs
  fam.elec_un <- fam.elec_b[unique(fam.elec_b$election_id), ] #cuts out duplicate election ids in case multiple far-right parties achieved votes shares of higher that 5% (we are just counting elections in which this happened not how many parties managed to do it)
  fam.elec_nm <- for(i in fam.elec_un$election_id) {
    fam.elec_un$election_id / length(unique(df$election_id))
  fam.elec_tab <- table(fam.elec_nm$election_id, fam.elec_nm$halfdecade) #creating a table with election_ids and halfdecades
  return(barplot(height = 1, width = 1, fam.elec_tab, main = paste("Elections where party family achieved > 5% of votes:", parameter), xlab = "Halfdecade", ylab = "Elections", ylim = seq(from = 0, to = 1, by = 0.1))) #outputting a barplot
   }
  }

fam.elec.plot_norm(parlgov, "Conservative")

?barplot

head(parlgov$party_family)

aggregate(survey$ideology, by = list(survey$year), mean, na.rm = TRUE)

?aggregate


drafted <- survey[survey$draft == 1, ]
drafted.ideo <- mean(drafted$ideology, na.rm = TRUE)
safe <- survey[survey$draft == 0, ]
safe.ideo <- mean(safe$ideology, na.rm = TRUE)
dim.sate <- drafted.ideo - safe.ideo
print(dim.sate)

sate.state <- function(df){
  for (i in (unique(df$state))){
    drafted <- survey[df$draft == 1, ]
    safe <- survey[df$draft == 0, ]
    sate.draft <- mean(drafted$ideology, na.rm = TRUE) - mean(safe$ideology, na.rm = TRUE)
    sate.state <- aggregate(sate.draft, by = list(unique(df$state), sum, na.rm = TRUE)
  }
  return(sate.state)
}







avg.perf.all <- function(df){
  for(i in unique(df$party_family)){ #replaced the parameter input with a for() loop
    return(aggregate(df$vote_share, by = list(df$party_family), sum, na.rm = TRUE))
  
    drafted.ideo <- mean(drafted$ideology, na.rm = TRUE)
    safe.ideo <- mean(safe$ideology, na.rm = TRUE)
    
    
    
    
sate.state <- function(df){
  for(i in unique(df$state)){
    drafted <- survey[df$draft == 1, ]
    safe <- survey[df$draft == 0, ]
    sate1 <- mean(drafted, na.rm = TRUE) - mean(safe, na.rm = TRUE)
    state.ideo <- aggregate(sate1, by = list(df$state))
  }
  return(state.ideo)
}   

data.frame(table(parlgov$election_id, parlgov$halfdecade))

sate.state(survey)

length(parlgov$election_id)

summary(survey$state)

?aggregate

fam.elec.plot <- function(df, parameter){ # function takes a data.frame (parlgov) and a parameter (party_family)
  fam.elec_a <- df[df$party_family == parameter & df$vote_share > 5, ] #subsets the dataframe by the parameter, excluding instances with a vote share less than 5%
  fam.elec_b <- na.omit(fam.elec_a) #omits NAs
  fam.elec_un <- fam.elec_b[unique(fam.elec_b$election_id), ] #cuts out duplicate election ids in case multiple far-right parties achieved votes shares of higher that 5% (we are just counting elections in which this happened not how many parties managed to do it)
  fam.elec_un$norm.vals <- length(fam.elec_un$election_id) / length(df)
  fam.elec_tab <- table(fam.elec_un$election_id, fam.elec_un$halfdecade) #creating a table with election_ids and halfdecades
  return(barplot(fam.elec_tab, main = paste("Elections where party family achieved > 5% of votes:", parameter), xlab = "Halfdecade", ylab = "Elections")) #outputting a barplot
}

?tapply


