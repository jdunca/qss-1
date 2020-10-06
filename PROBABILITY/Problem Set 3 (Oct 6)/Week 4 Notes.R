distinct(fraud, n_turnout, n_winner)
?slice_max()
?if()
?fractions
?subset


names <- c("Michael", "Rob", "Kanta", "Aisha", "Lucan", "Ludovic")
for (i in 1:5) {
  print(paste0(sample(names, 2), sep=","))
}

sample1 <- sample(100) #take a random sample of 100 numbers.
out <- vector("numeric", length(sample1)) # creates an empty vector

## Let's calculate the variance
for (i in seq_along(sample1)) {
  out[i] <- (sample1[i] - mean(sample1))^2 / (length(sample1) - 1) #filling in the empty vector
  var <- sum(out)
}
print(var)


 seq_along(sample1)
?seq_along 
var(sample1)


region.list <- c(rep("Montreal", 3), rep("Toronto", 5), rep("Victoria", 2), rep("Istanbul", 4), rep("Quebec", 6))

## Let's take 3 people out of this group randomly.
sample(region.list, 3, rep=FALSE)

n.sim <- 100
out <- rep(list(vector("character", length=3)),100)
for (i in 1:n.sim){
  out[[i]] <- sample(region.list, 3, rep=FALSE)
}
head(out)

ifelse("Istanbul" %in% out[[1]], 1, 0)

ifelse("Istanbul" %in% out[[2]], 1, 0)

final <- rep(NA, 100)
for (i in 1:100) {
  final[i] <- ifelse("Istanbul" %in% out[[i]], 1, 0)
}
prop.table(table(final))


choose(20, 3)

?choose()

4*16
64/1140

1 - choose(16, 3)/ choose(20, 3)


faculty.list <- list(c(rep("Theorists", 5), rep("IR", 4), rep("Comparativist", 3)), 
                     c(rep("Political Economy", 3), rep("Methodologist", 3), rep("Comparativst", 6)),
                     c(rep("Theorists", 1), rep("Methodologist", 10), rep("Canadianist", 1))) 
lapply(faculty.list, function(x) unique(as.factor(x)))


class(out2)
count
?frequency()


breaks <- list(top.10$fraction)
breaks <- dput(breaks)
breaks
