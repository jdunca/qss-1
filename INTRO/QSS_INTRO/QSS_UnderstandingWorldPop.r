##World Population Dynamics


kenya <- read.csv("kenya.csv") #load in data
sweden <- read.csv("sweden.csv")
world <- read.csv("world.csv")

##Crude Birth Rate

kenya$py.total <- kenya$py.men + kenya$py.women #calculate person years
kenya_p1 <- kenya[1:15, ]
kenya_p2 <- kenya[16:30, ]
kenya_cbr1 <- sum(kenya_p1$births) / sum(kenya_p1$py.total)
kenya_cbr2 <- sum(kenya_p2$births) / sum(kenya_p2$py.total)

cbr.all <- function(df){ #function to do all of them
py.total <- df$py.men + df$py.women #calculate person years
p1 <- df[1:15, ]#periodize
p2 <- df[16:30, ]
cbr1 <- sum(p1$births) / sum(p1$py.total)#calc for both periods
cbr2 <- sum(p2$births) / sum(p2$py.total)
cbr.list <- list(cbr1, cbr2)#place in list to be output
return(cbr.list)
}

kenya_cbr <- unlist(cbr.all(kenya))
sweden_cbr <- unlist(cbr.all(sweden))
world_cbr <- unlist(cbr.all(world))


## calculate age specific fertility
asfr.func <- function(df){
  df$asfr <- df$births / df$py.women
  asfr <- df$asfr
  age <- seq(from = 0, to = 84, by = 5)
  names(asfr) <- age
  return(asfr)
}
kenya_asfr <- asfr.func(kenya)[4:10 & 19:25]
sweden_asfr <- asfr.func(sweden)[4:10 & 19:25]
world_asfr <- asfr.func(world)[4:10& 19:25]

kenya_asfr

##calculate TRF

tfr.func <- function(df){
  p1 <- df[1:15, ]#periodize
  p2 <- df[16:30, ]
  tfr1 <- sum(p1$asfr * 5)
  tfr2 <- sum(p2$asfr * 5)
  tfr.list <- list(tfr1, tfr2)
  return(tfr.list)
}
  
kenya_tfr <- unlist(tfr.func(kenya))
sweden_tfr <- unlist(tfr.func(sweden))
world_tfr <- unlist(tfr.func(world))

kenya_tfr
sweden_tfr
world_tfr 

rm(kenya_cbr1, kenya_cbr2)
