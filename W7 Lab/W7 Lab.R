install.packages("stargazer")

library(tidyverse)
library(stargazer)
library(knitr)
library(kableExtra)


glimpse(covid.final)

stargazer(covid.final, summary=TRUE, out = "descriptive.html",
          title = "Descriptive Statistics")
table1 <- covid.final %>%
  group_by(treatment) %>%
  summarise_at(vars("male", "educ", "age", "libcon7"), mean, na.rm=T) %>%
  round(digits=2)


stargazer(table1, summary=FALSE, rownames=FALSE, out = "table1.html", 
          title = "Randomization Check",
          covariate.labels = c("Treatment", "Male", "Education", "Age", "Ideology"))

kable(table1, col.names = c("Treatment", "Male", "Education", "Age", "Ideology")) %>%
  kableExtra::kable_styling(full_width=F, position="left", bootstrap_options = c("striped", "hover",
                                                                                 "condensed", 

                                                                                 
                                                                                                                                                                  "responsive")) 
install.packages("ggpubr")
library(ggpubr)
ggstripchart(covid.final,
             x="treatment", y=c("vbm_inperson", "vbm_early", "vbm_mail"),
             shape = 1, add="mean_ci", color = c("#E7B800"), add.params = list(color = "black"),
             jitter=0.2,
             combine=T)


summaryf <- function(val) {
  confdata1 <- data.frame(avg = rep(NA, 2),
                          var = rep(NA, 2),
                          n = rep(NA, 2),
                          treatment = names(table(covid.final$treatment)))
  
  confdata1$avg <- tapply(val, covid.final$treatment,
                          mean, na.rm=T)
  confdata1$var <- tapply(val, covid.final$treatment,
                          var, na.rm=T)
  confdata1$n <- table(covid.final$treatment)
  confdata1$up <- confdata1$avg +1.96*sqrt(confdata1$var/(confdata1$n - 1))
  confdata1$low <- confdata1$avg - 1.96*sqrt(confdata1$var/(confdata1$n - 1))
  
  title <- paste("Mean CI - ", deparse(substitute(val)), sep="")
  
  dotchart(x = confdata1$avg, xlim = c(min(confdata1$low), max(confdata1$up)),
           labels = as.character(confdata1$treatment),
           xlab = title) 
  segments(x0 = confdata1$low, x1 = confdata1$up, y0 = 1:2)
}

sapply(covid.final[7:9], FUN = summaryf)
summaryf(covid.final$vbm_inperson)
