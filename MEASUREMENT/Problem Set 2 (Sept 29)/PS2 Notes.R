# Section 1
## Question 1

### 1.1.1: Show that the treatment and control groups are balanced with respect to the income variable (income) by comparing its distribution between those in the treatment group and those in the control group. 

summary(as.factor(boston$income))
summary(boston$male)
as.integer(3e+05)

co.var1 <- prop.table(table(income = boston$income, treatment = boston$treatment))
co.var1

treated <- subset(boston, subset = (treatment == 1))
not_treated <- subset(boston, subset = (treatment == 0))

summary(treated$income)
summary(not_treated$income)

(mean(treated$numberim.pre) - mean(treated$numberim.post, na.rm = TRUE))
(mean(not_treated$numberim.pre, na.rm = TRUE) - mean(not_treated$numberim.post, na.rm = TRUE))

0.2686543/5

boston %>%
  group_by(income, male) %>%
  summarise(diff = mean(treatment, na.rm = T)) %>%
  mutate(diff2 = diff - lag(diff))


?lag

boston

%>%
  summarise(diff = mean(treatment, na.rm = T)) %>%
  mutate(diff2 = diff - lag(diff))



### 1.1.2: Also, compare the proportion of males (male) in the treatment and control groups. 
co.var2 <- prop.table(table(male = boston$male, treatment = boston$treatment))
co.var2
### 1.1.3: Interpret these two numbers.
1

## Question 2

### 1.2.1: Compute the average treatment effect on the change in attitudes about immigration. That is, how does the mean change in attitudes about immigration policy for those in the control group compare to those in the treatment group.

treated.shift <- (mean(treated$numberim.post - treated$numberim.pre, na.rm = TRUE))

nottreated.shift <- (mean(not_treated$numberim.post - not_treated$numberim.pre, na.rm = TRUE))

treated.shift - nottreated.shift

### 1.2.2: Interpret the result.

## Question 3
### Does having attended college influence the effect of being exposed to outsiders on exclusionary attitudes? Another way to ask the same question is this: is there evidence of a differential impact of treatment, conditional on attending college versus not attending college? 

  ### 1.3.1: Calculate the necessary quantities to answer this question and interpret the results. 

sate <- function(df){
treated <- subset(df, subset = (treatment ==1 ))
not_treated <- subset(df, subset = (treatment == 0))
treated.shift <- (mean(treated$numberim.post, na.rm =TRUE) - mean(treated$numberim.pre, na.rm = TRUE))
nottreated.shift <- (mean(not_treated$numberim.post, na.rm = TRUE) - mean(not_treated$numberim.pre, na.rm = TRUE))
sate <- treated.shift - nottreated.shift
return(sate)
}

sate(boston)








boston %>%
  group_by(college) %>%
  summarise(sate)


##subset by treated / not treated
treated <- subset(boston, subset = (treatment == 1))# subset into treated 
not_treated <- subset(boston, subset = (treatment == 0))#and not treated

### subset again by college/ no college
college.tr <- subset(treated, subset = (college == 1))# subset into treated 
college.nt <- subset(not_treated, subset = (college == 1))#and not treated
no.college.tr <- subset(treated, subset = (college == 0))
no.college.nt <- subset(not_treated, subset = (college == 0))

coll_shift <- (mean(college.tr$numberim.pre - college.tr$numberim.post, na.rm = T) - (mean(college.nt$numberim.pre - college.nt$numberim.post, na.rm = T)
nocoll_shift <- (mean(no.college.tr$numberim.pre - no.college.tr$numberim.post, na.rm = T) - (mean(no.college.nt$numberim.pre - no.college.nt$numberim.post, na.rm = T))
coll_shift - nocoll_shift


boston %>%
group_by(college) %>%
  summarise(mean(treatment)) %>%
  filter((shift = mean(numberim.pre) - mean(numberim.post)))



shift.sate <- function(parameter){
  treated <- subset(boston$parameter == 1, parameter ==)
}
  


###function steps
##
 

  

  ### 1.3.2: Consider the average treatment effect for those who attended college and then those who did not.
  
  ## Question 4
  
  ### Repeat the same analysis as in the previous question but this time with respect to age and ideology. 
  
  ### 1.4.1: For age, divide the data based on its quartile and compute the average treatment effect within each of the resulting four groups. 

age_group <- quantile(boston$age)
age_group

boston$age

### 1.4.2: For ideology, compute the average treatment effect within each value. 

### 1.4.3: What patterns do you observe? Give a brief substantive interpretation of the results.

# Section 2
## Question 1
### 2.1.1: How many members of parliament are in the data? 
summary(as.factor(prop.AJPS$election))

### 2.1.2: Why is it not simply 338 x 2 = 676?

### 2.1.3: What proportion of the observations in the data are members of the government party?

### 2.1.4: What proportion are female? 
### 2.1.5: How much does a typical member spend on reelection? 

### 2.1.6: Is there anything about the spending data that is odd?

## Question 2
### First, we will check to see if the randomization procedure appears to have been fair. Calculate the differece between the proportion of MPs who were able to propose legislation under this procedure according to whether they are female. That is, a government MP, and whether their vote share in the previous election was greater than or less than the median.

## Question 3

### 2.3.1: Calculate the mean vote share for MPs able to introduce legislation under this procedure and those unable to do so. 
### 2.3.2: How big is the difference?

### 2.3.3: Create a table of the power to propose and whether the MP won reelection.

### 2.3.4: Did the power to propose help MPs win reelection? 

## Question 4

### 2.4.1: Create two new data frames, one with just MPs in the governing party and one with just members of the opposition. 

### 2.4.2: Now repeat what you did for Question 2 on each of these data frames. 

### 2.4.3: Is there a big difference in vote share or win share across the power to propose in either data frame? Do the differences look big?'

## Question 5
### One possibility is that government MPs did better and opposition MPs did worse when they got proposal power because they draw lower quality opponents (as measured by previously holding electoral office). 

### 2.5.1: Did MPs with proposal power draw lower quality opponents in the next election? 

### 2.5.2: Did this vary by whether they were in the government party?
  
  ### Another possibility is that proposal power shaped the MPs ability to fundraise, by letting them appear to be bringing home the pork. 

### 2.5.3: Did proposal power lead MPs to spend more or less money? Rather than answering this with just a difference in means, create a boxplot for each of four groups based on the 2x2 of government vs. opposition and proposal power and no proposal power. 

### 2.5.4: Provide a clear description as if it is in a paper (“This figure shows that. . . ”)




